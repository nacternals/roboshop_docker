FROM maven:3.9-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Build the application
RUN mvn clean package -DskipTests
RUN mv target/shipping-1.0.jar shipping.jar

FROM eclipse-temurin:17-jre-alpine

# Set working directory
WORKDIR /app

# Copy built jar from build stage
COPY --from=build /app/shipping.jar /app/shipping.jar

# Create non-root user
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop

# Give ownership
RUN chown -R roboshop:roboshop /app

# Set environment variables
ENV CART_ENDPOINT=cart:8080
ENV DB_HOST=mysql

# Switch user
USER roboshop

# Expose port
EXPOSE 8080

# Start app
CMD ["java", "-jar", "/app/shipping.jar"]