# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Install Apache and other required packages
RUN apt-get update && apt-get install -y apache2

# Clean up the apt cache to reduce image size
RUN apt-get clean

COPY * /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
