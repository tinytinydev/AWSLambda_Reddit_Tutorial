#Credits to github.com/winstonho90

if (Test-Path .\function.zip) {
    Write-Host "function.zip exist, removing it"
    Remove-Item -Force .\function.zip
}

Set-Location .\package

Remove-Item -Recurse -Force *.dist-info, __pycache__

Write-Host "zipping library"
Compress-Archive -CompressionLevel Optimal -DestinationPath '..\function.zip' *
Set-Location ..\

Write-Host "adding lambda_function.py and auth-key.json"
Compress-Archive -CompressionLevel Optimal -Update -DestinationPath '.\function.zip' lambda_function.py
Compress-Archive -CompressionLevel Optimal -Update -DestinationPath '.\function.zip' auth-key.json

Write-Host " "
Write-Host " "
Write-Host "Deploying on AWS Lambda... Please hold..."
aws lambda update-function-code --function-name LambdaRedditSingaporeTop10 --zip-file fileb://function.zip