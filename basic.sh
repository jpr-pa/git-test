#!/bin/sh

# Create the Dockerfile
cat <<EOF > Dockerfile
# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the local package.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["node", "app.js"]
EOF

# Build the Docker image
docker build -t newtaste .

