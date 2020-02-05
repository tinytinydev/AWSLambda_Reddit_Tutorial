#Credits to github.com/winstonho90

if (Test-Path .\package) {
     Write-Host "package folder exist, removing it"
     Start-Sleep 5
     Remove-Item -Recurse -Force .\package
}

Write-Host ""
Write-Host "ENTERING SET UP.."
Start-Sleep 2

Write-Host ""
Write-Host "Install Python Packages..."
Start-Sleep 2
pip install --target ./package praw
pip install --target ./package pytz

Expand-Archive numpy-1.18.1-cp37-cp37m-manylinux1_x86_64.whl
Expand-Archive pandas-0.25.3-cp37-cp37m-manylinux1_x86_64.whl

Remove-Item -Recurse -Force *.dist-info

Move-Item numpy .\package
Move-Item pandas .\package

Write-Host ""
Write-Host "Deploying to AWS Lambda..."
Start-Sleep 2
.\deploy_to_lambda.ps1


Write-Host ""
Write-Host "Deployment ended."

# powershell -nop -ex bypass setup.ps1