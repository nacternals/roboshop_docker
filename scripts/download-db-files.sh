#!/bin/bash
set -e

BUCKET="roboshop-db-files"

echo "Creating local init directories..."
sudo mkdir -p /data/roboshop/mysql-init
sudo mkdir -p /data/roboshop/mongo-init

echo "Downloading MongoDB seed file..."
aws s3 cp s3://$BUCKET/cataloguedb/master-data.js /tmp/master-data.js

echo "Downloading MySQL init files..."
aws s3 cp s3://$BUCKET/shippingdb/schema.sql /tmp/schema.sql
aws s3 cp s3://$BUCKET/shippingdb/app-user.sql /tmp/app-user.sql
aws s3 cp s3://$BUCKET/shippingdb/master-data.sql /tmp/master-data.sql

echo "Preparing MySQL init order..."
sudo cp /tmp/schema.sql /data/roboshop/mysql-init/01-schema.sql
sudo cp /tmp/app-user.sql /data/roboshop/mysql-init/02-app-user.sql
sudo cp /tmp/master-data.sql /data/roboshop/mysql-init/03-master-data.sql

echo "Preparing Mongo seed file..."
sudo cp /tmp/master-data.js /data/roboshop/mongo-init/master-data.js

echo "DB files downloaded successfully."
ls -lh /data/roboshop/mysql-init /data/roboshop/mongo-init