# Build image

`docker build -t node-dep-example .`

# Run container

`docker run --rm -d --name node-dep -p 80:80 node-dep-example`

# AWS

```
chmod 400 "dockercomplete1.pem"
ssh -i "dockercomplete1.pem" ec2-user@ec2-15-222-250-234.ca-central-1.compute.amazonaws.com
```
