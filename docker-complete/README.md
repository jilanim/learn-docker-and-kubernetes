# Build image

`docker build -t node-dep-example .`

# Run container

`docker run --rm -d --name node-dep -p 80:80 node-dep-example`

# AWS

```
chmod 400 "dockercomplete1.pem"
ssh -i "dockercomplete1.pem" ec2-user@ec2-15-222-250-234.ca-central-1.compute.amazonaws.com
```

## Installing Docker on EC2

```
sudo yum update -y
sudo yum -y install docker

sudo service docker start
sudo usermod -a -G docker ec2-user

#log out + back in after running these commands.
sudo systemctl enable docker

docker version
```

## Working with Docker on EC2

```
sudo service docker start
```

## Push local image to Dockerhub

```
# clone image with a different name that matches our dockerhub repo
docker tag node-dep-example jilanim/node-example-1

# login first
docker login

# push to dockerhub repo
docker push jilanim/node-example-1

```

## Run image on EC2

```
# get latest image (always do this first before running image in case of changes in image)
docker pull jilanim/node-example-1

# run image
docker run -d --rm -p 80:80 jilanim/node-example-1
```

## Update Inbound Rules to allow traffic to flow into the container from outside

By default, only SSH traffic is allowed into the container.

```
# Security Groups > launch-wizard-1 > Inbound Rules > Edit inbound rule
# Add a HTTP rule with port 80 for Anywhere (0.0.0.0/0)
```
