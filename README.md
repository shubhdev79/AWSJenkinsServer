# AWSJenkinsServer
Creation of AWSJenkinsServer Through Terraform

# Configuration & Setup

**1. Linux EC2 Creation Through Terraform Code**

**2. Install Jenkins on Server through InstallingJenkinsOnLinux.txt**

**3. Install Terraform through TerraformInstallationOnLinux.txt**

**4. Install GIT**

**5. Install AWS/CLI**

**6. Configure the JENKINS: Set the Environment Variable for GIT in Global Tools Configuration**

**Note: 2,3,4 & 5 Steps Can be done through USERDATA SCRIPT.**


# PROCESS FLOW:

## CI/Cd Pipeline for Terraform Using Jenkins ##

1. **The developer or operations engineer changes the Terraform configuration file in his local machine and commits the code to Voice Vault-GITSERVER.**

2. **Git Webhook triggers a continuous integration job to Jenkins Through Pipeline.**

3. **Jenkins will pull the latest code from the configured repo which contains Terraform files to its workspace.**

4. **It reads the Terraform configuration then initializes the S3 backend.**

5. **Terraform generates a plan about the changes that have to be applied on the infrastructure.**

6. **Jenkins sends a notification to a Teams/Outlook channel about the changes for manual approval.**
**OR Manually Check the Jenkins Pipeline Console to Deploy the Code in AWS.**

7. **Here, the user can approve or disapprove the Terraform plan.**

8. **The user input is sent to Jenkins server for proceeding with the further action.**

9. **Once the changes are approved by an operator, Jenkins will execute the terraform apply command to reflect the changes to the infrastructure.**

10. **Terraform will create a report about the resources and its dependency created while executing the plan.**

11. **Terraform will provision the resources in the provider environment.**

12. **Jenkins will again send a notification to the channel about the status of the infrastructure after the applying changes on it. Once the job is executed, Jenkins pipeline job is configured to clean up the workspace created by the job.**


**Docker Use for Jenkins/Slave**
**It is recommended to use reusable modules in Terraform by writing your own modules and using modules from the Terraform Registry. We can also use the Docker Build Agent for Jenkins slave and save the workspace by attaching a persistent volume to the Jenkins server from the Docker host.**


