if test -d "package"; then
    echo "package folder exist, removing it"
    sleep 5s
    rm -r package
fi 

echo ""
echo "ENTERING SET UP.."
sleep 2s

echo ""
echo "Install Python Packages..."
sleep 2s
pip3 install --target ./package praw
pip3 install --target ./package pytz

unzip numpy-1.18.1-cp37-cp37m-manylinux1_x86_64.whl
unzip pandas-0.25.3-cp37-cp37m-manylinux1_x86_64.whl

rm -r *.dist-info

mv numpy ./package
mv pandas ./package

echo ""
echo "Deploying to AWS Lambda..."
sleep 2s
./deploy_to_lambda.sh


echo ""
echo "Deployment ended."