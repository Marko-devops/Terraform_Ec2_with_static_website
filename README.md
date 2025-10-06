# Terraform_Ec2_with_static_website

- I created an AWS Ec2 instance using Terraform and uploaded all the content to an S3 bucket. I started by generating an SSH key pair on my local terminal in the project folder. I took the script from my first project and added it to this one under the name web.sh.
- Next, I created a file called instance.tf and added details such as the AMI, instance type, key name, security group, tags, and permissions for the web.sh script so that it would run automatically when the instance starts. I also gave it execution permissions using chmod +x.
- After that, I created key_pair.tf and added the variable var.public_key containing the public key.
-  I set up provider.tf with the AWS region information.
-  Then, I created security_group.tf for the security group named terra_sg, with ingress rules allowing my IP "var.my_ip" to access port 22 and HTTP access on port 80, and egress rules allowing access to all ports.
- I also created variable.tf to define the variables for my IP "my_ip" and the public key "public_key".
- Finally, I created backend.tf to configure the project to upload everything to an S3 bucket named "terrafs3bucket" https://github.com/Marko-devops/Terraform_Ec2_with_static_website/blob/main/Screenshots/S3%20bucket%20on%20AWS.png
- Using Git Bash, I ran the commands terraform init, terraform fmt, terraform validate, and terraform plan to verify that there were no errors, and then launched the instance with terraform apply. After the EC2 instance was up, I copied its public key, opened it in the browser, and confirmed that the website had been deployed successfully.
- https://github.com/Marko-devops/Terraform_Ec2_with_static_website/blob/main/Screenshots/Terraform%20Ec2.png
- https://github.com/Marko-devops/Terraform_Ec2_with_static_website/blob/main/Screenshots/web.sh.png
- Once I verified that everything was working, I destroyed the instance on AWS using terraform destroy.
