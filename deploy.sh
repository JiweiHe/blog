secretKeyPath='~/store/日常/vps/secretkey.pem'
SERVER_FOLDER='/home/ec2-user/data/web'
SERVER_USER='ec2-user'
SERVER_HOST='ec2-13-58-188-207.us-east-2.compute.amazonaws.com'
gitbook build
zip -r _book.zip _book
scp -i $secretKeyPath -r _book.zip $SERVER_USER@$SERVER_HOST:$SERVER_FOLDER
ssh -i $secretKeyPath $SERVER_USER@$SERVER_HOST << remotessh
  cd $SERVER_FOLDER
  unzip -o _book.zip
  rm -rf _book.zip
exit
remotessh
rm -rf _book.zip