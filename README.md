# DelloiteDevops
UIDelloite


In this Particular Repository I have written IAC Approach of deploying a Flask api with a Simple HTML on AWS ec2 instance
Followoing are the tools which i have used for different verticals in this approach

Provisioning: Terraform
Configuration: Ansible
DB: MySQL
WebServer: Nginx
CICD tool: Jenkins
Backend: Python Flask
FrontEnd: Simple Html form page

The 'ansibleplaybooks' consists of configuration of required packages required for this Usecase on the remote machine 
The 'scripts' folder consists of the backend scripts just for a reference
The 'ansibleplaybooks/assentials' folder consists of html,BE,and few configuration files

I have configured all the setup on a single instance as its a simple application, in case if you want a clustered approach we can increase count to 'n' instances in ec2launch.tf and mention the instance on which you want to apply the playbook in the provisioner local-exec block ansible command  and haven't used docker images as t2.micro is having memory constraints. 
