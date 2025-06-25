#!/bin/bash
sudo yum update -y
sudo yum install -y python3 git
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Flask App
cd /home/ec2-user
mkdir flask && cd flask
cat <<EOF > app.py
from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello():
    return "Hello from Flask on port 5000"
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF
pip3 install flask
nohup python3 app.py &

# Express App
cd /home/ec2-user
mkdir express && cd express
cat <<EOF > app.js
const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Hello from Express on port 3000'));
app.listen(3000);
EOF
npm init -y
npm install express
nohup node app.js &
