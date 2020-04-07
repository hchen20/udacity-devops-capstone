### Project Title - Deploy a high-availability web app using CloudFormation
This folder provides the starter code for the "ND9991 - C2- Infrastructure as Code - Deploy a high-availability web app using CloudFormation" project. This folder contains the following files:

Procedure:

Assume you have the access to AWS and has an IAM role name UdacityS3ReadOnlyEC2 which has S3 read only access.

1. ./create network network.yml network-paramters.json
2. ./create app servers.yml server-parameters.json


#### servers.yml
Students have to write the CloudFormation code using this YAML template for building the cloud infrastructure, as required for the project. 

#### server-parameters.json
Students may use a JSON file for increasing the generic nature of the YAML code. For example, the JSON file contains a "ParameterKey" as "EnvironmentName" and "ParameterValue" as "UdacityProject". 

#### network.yml
The Cloudformation template for VPC, Subnets, InternetGateway, NatGateways, and Route tables.

#### network-parameters.json
The key value pairs for vpc and subnet cidrs.

In YAML code, the `${EnvironmentName}` would be substituted with `UdacityProject` accordingly.