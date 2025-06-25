#!/bin/bash
sudo yum update -y
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

cd /home/ec2-user
mkdir express && cd express
cat <<EOF > app.js
const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Hello from Express EC2 on port 3000'));
app.listen(3000);
EOF
npm init -y
npm install express
nohup node app.js &
