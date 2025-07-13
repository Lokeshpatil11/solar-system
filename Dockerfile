# Base GitHub Actions runner image
FROM myoung34/github-runner:latest

# Install Node.js 18 & npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Verify versions
RUN node -v && npm -v

# Set working directory
WORKDIR /usr/app

# Copy and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Set environment variables (can also be overridden via GitHub workflow)
ENV MONGO_URI=uriPlaceholder
ENV MONGO_USERNAME=usernamePlaceholder
ENV MONGO_PASSWORD=passwordPlaceholder

# Expose app port
EXPOSE 3000

# Start your Node.js app
CMD ["npm", "start"]
