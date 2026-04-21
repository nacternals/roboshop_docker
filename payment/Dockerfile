FROM python:3.6-alpine

# Set working directory
WORKDIR /app

# Copy dependency file first
COPY requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy remaining application code
COPY . .

# Create non-root user
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop

# Give ownership
RUN chown -R roboshop:roboshop /app

# Set environment variables
ENV CART_HOST=cart
ENV CART_PORT=8080
ENV USER_HOST=user
ENV USER_PORT=8080
ENV AMQP_HOST=rabbitmq
ENV AMQP_USER=roboshop
ENV AMQP_PASS=roboshop123

# Switch user
USER roboshop

# Expose port
EXPOSE 8080

# Start app using uWSGI
CMD ["uwsgi", "--ini", "payment.ini"]