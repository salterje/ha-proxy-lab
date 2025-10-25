# Script to create podman container based on httpd and serving local content

podman container run -d -p 8080:8080 -v /home/cloud_user/ha-proxy-lab/site1/web:/var/www/html:Z --name site1-server1 registry.access.redhat.com/ubi9/httpd-24:latest

