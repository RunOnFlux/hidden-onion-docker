# hidden-onion-docker
Creates an Onion Address in a container that can be linked to from another container on the same docker network, creating hidden services.

## Building the image

`docker build -t runonflux/hiddenonion:latest .`

## How To Use

There are 3 Environment Variables that must be set an onion address to be generated for your local service. 

1. `SERVICE_HOST` - This must be a fully accessible local IP or hostname of a service you want to expose. Docker container names can also be used, but must be on the same docker network. 
2. `SERVICE_PORT` - This is the port that the local service is running on that you want to pipe to an onion address. (ex.) You have a local simplex xftp server running on port 443 that you want to expose. So you set this ENV as 443.
3. `ONION_PORT` - This is the port that your onion address will listen for connections on. The simplex chat client attempts to load xftp servers on port 443 by default. So we'll also set this to 443.


To Do: 

1. Add logging and error messages for when ENV variables are not set.


