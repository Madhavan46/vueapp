echo 'Building project in production environment...'
npm run build
echo 'Project built'

echo 'Compressing project files...'
tar -zcvf cropchat.tar.gz dist > /dev/null 2>&1
echo 'Files compressed'

echo 'Copying project to staging server...'
scp cropchat.tar.gz ubuntu@ip-172-31-20-32:/home/ubuntu
ssh ubuntu@ip-172-31-20-32 rm -Rf /var/www/cropchat/current
ssh ubuntu@ip-172-31-20-32 mkdir /var/www/cropchat/current

echo 'Extracting files...'
ssh ubuntu@ip-172-31-20-32 tar -xvzf /home/ubuntu/cropchat.tar.gz -C /var/www/cropchat/current/ > /dev/null 2>&1
echo 'Files extracted'

echo 'Deployed successfully!'
