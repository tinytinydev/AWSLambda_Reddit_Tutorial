if test -f "function.zip"; then
    echo "function.zip exist, removing it"
    rm function.zip
fi 

cd package

rm -r *.dist-info __pycache__


echo "zipping library"
zip -r9 ${OLDPWD}/function.zip .
cd ../

echo "adding lambda_function.py and auth-key.json"
zip -g function.zip lambda_function.py
zip -g function.zip auth-key.json

echo " "
echo " "
echo "Deploying on AWS Lambda... Please hold..."
aws lambda update-function-code --function-name LambdaRedditSingaporeTop10 --zip-file fileb://function.zip