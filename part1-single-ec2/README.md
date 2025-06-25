## Part 1: Single EC2 Instance Deployment

### Description
This setup provisions one EC2 instance running both Flask (port 5000) and Express (port 3000).

### How to Deploy
```bash
cd part1-single-ec2
terraform init
terraform apply -auto-approve
```

### Output
The public IP is shown in the outputs. You can access:
- Flask: http://<public-ip>:5000
- Express: http://<public-ip>:3000
