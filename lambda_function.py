import json
import praw
import pandas as pd

secret = ""
personal_use_script = ""
user_name = ""
password = ""

with open('auth-key.json') as auth_obj:
    data = json.load(auth_obj)
    secret = data["secret"]
    personal_use_script = data["personal_use_script"]
    user_name = data["user_name"]
    password = data["password"]

reddit = praw.Reddit(client_id= personal_use_script, \
                        client_secret= secret, \
                         user_agent='MLBB', \
                         username=user_name, \
                         password=password)


subreddit = reddit.subreddit('singapore')

def crawl10_reddit_singapore(event, context): 
    topics_dict = { 
        "tags": [],
        "author": [],
        "title":[],
        "score":[],
        "id":[], "url":[],
        "comms_num": [],
        "created": [],
        "body":[]}

    for submission in subreddit.hot(limit=10):
        if(submission.link_flair_text is None):
            submission.link_flair_text = "-"
        topics_dict["tags"].append(submission.link_flair_text)
        if(submission.author != None):
            topics_dict["author"].append(submission.author.name)
        else:
            topics_dict["author"].append("")
        topics_dict["title"].append(submission.title)
        topics_dict["score"].append(submission.score)
        topics_dict["id"].append(submission.id)
        topics_dict["url"].append(submission.url)
        topics_dict["comms_num"].append(submission.num_comments)
        topics_dict["created"].append(submission.created)
        topics_dict["body"].append(submission.selftext)
    df = pd.DataFrame(topics_dict)

    response = {
        "statusCode": 200,
        "headers": {},
        "body": json.dumps(
            df.to_json()
        )
    }

    return response