# Inception

<div style="display" align="center">
<img src="./rscs/docker.png" width='42%'>
</div>

## About

This project involves setting up a Docker mini-infrastructure with various services. There will be three distinct Docker containers, each running a different service, as well as two volumes to store the WordPress database and files.

All these containers will be installed on debian-buster.
<div style="display" align="center">
<img src="./rscs/debian.png" width='10%'>
</div>

## Docker Containers:

### NGINX

NGINX is a lightweight and fast web server that is used to serve static or dynamic web sites. In this project, I'm using NGINX to handle secure communication between your WordPress site and users using the TLSv1.2 security protocols.

### WordPress + php-fpm

WordPress is a popular web content management system that is used to create dynamic web sites. It's easy to use and has a large community of developers creating plugins and themes to add functionality and customize the look of your site. In this project, I'm using WordPress in conjunction with php-fpm to ensure your site runs properly.

### MariaDB

MariaDB is an open-source database management system that is compatible with MySQL. It's used to securely and efficiently store data. In this project, MariaDB is used to store your WordPress site's data.

### Data Storage:

There are two distinct Docker volumes for storing our WordPress site's data:

- **WordPress Database Volume**: This Docker volume is used to store the MariaDB database used by WordPress. This ensures that all of your WordPress site's data is stored securely and can be easily backed up or migrated to another environment.
- **WordPress Site Files Volume**: This Docker volume is used to store all of your WordPress site's files, such as images, CSS files, and PHP files. This ensures that all of the files needed to run your site are stored securely and can be easily backed up or migrated to another environment.

### Docker Network:

There is a distinct Docker network allowing all Docker containers to communicate with each other. This ensures that each service is accessible and can communicate with the other services. All Docker containers will be connected to this network to allow seamless communication between them.

## Diagram

<div style="display" align="center">
<img src="./rscs/schema.jpg" width=50%">
</div>

## PID1 and the dumb-init solution

When running a Docker container, the first process inside the container is assigned the PID 1. This process is responsible for starting and stopping other processes within the container, and it is crucial for the proper functioning of the container.

One issue that can occur with PID 1 in Docker is known as the "PID 1 zombie reaping problem." This occurs when a zombie process (i.e., a process that has completed execution but still has an entry in the process table) is not properly reaped by PID 1. This can cause problems with resource management and lead to other issues.

To address this problem, the dumb-init solution can be used. Dumb-init is a simple process supervisor that can be used as the init process in a container. It ensures that all processes are properly reaped and that signals are correctly propagated to child processes.

To use dumb-init in your Docker container, you can add the following line to your Dockerfile:

```
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
```

This will ensure that dumb-init is used as the PID 1 process in the container, which will help prevent the PID 1 zombie reaping problem and ensure that your container runs smoothly.

## Prerequisites

To use this project, it is essential to have Docker and Docker Compose installed on the machine.
Docker is a popular platform that allows developers to build, ship, and run distributed applications in containers. Containers are lightweight, portable, and self-sufficient units of software that can be easily moved between different environments.

With Docker, you can package your application along with all its dependencies into a container, which can then be deployed to any machine that has Docker installed. This makes it easy to create consistent development, testing, and production environments, without having to worry about differences in underlying infrastructure.

<div style="display" align="center">
<img src="./rscs/docker.gif" width="20%">
</div>



## Getting Started

First, clone the repository:
````bash
git clone git@github.com:ltrinchini/Inception.git
cd Inception
````

Then
````bash
sudo make
````

## Usage

You can now access to the website by opening your preferred web browser and entering the following URL:
````
ltrinchi.42.fr
````
