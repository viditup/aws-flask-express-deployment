#!/bin/bash
sudo yum update -y
sudo yum install -y python3 git

cd /home/ec2-user
mkdir flask && cd flask
cat <<EOF > app.py
from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello():
    return "Hello from Flask EC2 on port 5000"
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF
pip3 install flask
nohup python3 app.py &
