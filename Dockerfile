# Use an official Node.js LTS (Long Term Support) version as a parent image
FROM node:lts

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json separately to leverage Docker cache
COPY package.json ./
COPY package-lock.json ./

# Install app dependencies
RUN npm install --only=production

# Bundle app source
COPY . .

# Expose the port that the app will run on
EXPOSE 3000

# Define environment variable for MongoDB connection
ENV MONGO_URL "mongodb://mongo:27017/tasks"

# Command to run the application
CMD ["node", "index.js"]
