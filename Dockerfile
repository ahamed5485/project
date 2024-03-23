FROM nginx:latest

# Copy the built app from the previous stage
COPY build/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
