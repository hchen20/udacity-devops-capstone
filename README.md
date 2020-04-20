## Project Overview

This is the Udacity Devops Capstone project that uses Jenkins to perform Blue/Green deployment

### Project Tasks

Setup Jenkins

Configure crendentials

Install eksctl:
https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html

Install kubectl:
https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

Install aws-iam-authenticator:
https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html


### Important Files

* Dockerfile: this file is blue print for building containerized nginx app
* create_eks.sh: this script create an eks cluster
* index.html: simple file for shakeout
* Jenkinsfile: code for the pipeline that does end to end container deployment in an automated fasion
* app.yml: yaml file definition for kubernetes