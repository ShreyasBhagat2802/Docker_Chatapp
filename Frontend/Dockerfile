# Use official Nginx image from Docker Hub
FROM nginx:latest

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy your static files (make sure you build the frontend or copy it from your host)
#COPY ../fundoo/static /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
