# node-awsebcli

Base Image: Node

Installed Libraries:

 * AWS EB CLI
 * AWS CLI

# Building
1. Pick a version in https://github.com/nikolaik/docker-python-nodejs/blob/master/versions.json
2. Set the new version to the ```FROM python:3.10.10-slim``` field in Dockerfile.
3. Build the image using ```docker build .```.
4. Find the image id using ```docker images```.
5. Tag the image using ```docker tag <image id> jessiecris/node-awsebcli:<node version>```. Ex ```docker tag bb38976d03cf jessiecris/node-awsebcli:14.17.6```.
6. Push the new image using ```docker push jessiecris/node-awsebcli:<node version>```
