# Script to create podman container based on httpd and serving local content

site_number=1

for i in {1..3}
do
    server_number=$i
    container_name=site$site_number\_server\_$server_number
    echo "Removing currently running container " 
    podman container rm -f $container_name
    
done

for i in {1..3}
do	
    server_number=$i
    container_name=site$site_number\_server\_$server_number
    echo "Creating new container "
    podman container run -d -p 808$i:8080 -v /home/cloud_user/ha-proxy-lab/site$site_number/web_$container_name:/var/www/html:Z --name $container_name registry.access.redhat.com/ubi9/httpd-24:latest 

done
