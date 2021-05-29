# How to use the project
* run > docker-compose up
* run > ssh master@localhost -p 8022

# How to build the docker
## Dockerfile
Dockerfile define the work to build the self defined docker.
### docker-compose.yml use dockerfile
    build:
        context: ./docker
        args:
            SSH_MASTER_USER: ${SSH_MASTER_USER}
            SSH_MASTER_PASS: ${SSH_MASTER_PASS}

## How to utilize environment variable
* Define environment variable in .env file 
* Use the environment var in yml by ${variable_name}
