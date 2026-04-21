#!/bin/bash
set -e

echo "Waiting a few seconds for MongoDB to become ready..."
sleep 10

echo "Loading catalogue MongoDB seed data..."
docker exec -i mongodb mongosh catalogue < /data/roboshop/mongo-init/master-data.js

echo "MongoDB seed load completed."