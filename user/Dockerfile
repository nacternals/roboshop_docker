FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy dependency file first
COPY package.json ./

# Install dependencies
RUN npm install

# Copy remaining application code
COPY . .

# Create a non-root user and give ownership
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
RUN chown -R roboshop:roboshop /app

# Set environment variables
ENV MONGO=true
ENV REDIS_HOST=redis
ENV MONGO_URL=mongodb://mongodb:27017/users

# Switch user
USER roboshop

# Expose port
EXPOSE 8080

# Start app
CMD ["node", "server.js"]