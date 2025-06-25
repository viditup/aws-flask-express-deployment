## Part 2: Separate EC2 Instances Deployment

### Description
This setup provisions two EC2 instances:
- Flask app on port 5000
- Express app on port 3000

### How to Deploy
```bash
cd part2-separate-ec2
terraform init
terraform apply -auto-approve
```

### Output
The public IPs are shown in the outputs. You can access:
- Flask: http://<flask-ip>:5000
- Express: http://<express-ip>:3000
