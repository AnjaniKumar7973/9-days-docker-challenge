🚀 Day 2 – Docker Mastery (Image Optimization + Data Persistence)
📌 Overview

This project demonstrates real-world Docker scenarios:

🔻 Reducing Docker image size using Multi-stage builds
🔐 Securing containers using Distroless images
💾 Persisting data using Docker Volumes
🧠 Problem Statements
1️⃣ Large Docker Image
Slower deployment
Higher security risks
2️⃣ Data Loss on Container Crash
Containers are ephemeral
Data gets deleted when container stops
✅ Solutions Implemented
🔻 Multi-Stage Docker Build
Separate build and runtime environments
Removes unnecessary dependencies
# Stage 1: Build
FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Production
FROM node:18-slim
WORKDIR /app
COPY --from=builder /app .
CMD ["node", "app.js"]
🔐 Distroless Image (Security Enhancement)
Minimal base image
No shell or package manager
Reduced attack surface
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM gcr.io/distroless/nodejs18
WORKDIR /app
COPY --from=builder /app .
CMD ["app.js"]
💾 Docker Volumes (Data Persistence)
🔹 Create Volume
docker volume create mydata
🔹 Run Container with Volume
docker run -d -v mydata:/app/data nginx
📦 Example: Persistent MySQL Data
docker run -d \
  -v mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=pass123 \
  mysql
📁 Bind Mount (Development Use)
docker run -d \
  -v /home/anjani/data:/app/data \
  nginx
⚖️ Volume vs Bind Mount
Feature	Volume ✅	Bind Mount 📁
Managed by Docker	Yes	No
Portable	Yes	No
Use Case	Production	Development
🧪 Hands-On Tasks Completed
✅ Built optimized Docker image using multi-stage build
✅ Reduced image size significantly
✅ Implemented secure distroless container
✅ Created Docker volume for persistent storage
✅ Verified data persists after container deletion
🎯 Key Learnings
Containers are stateless by default
Always use volumes for databases
Smaller images = faster + more secure deployments
Distroless images = production-grade security
🚀 How to Run
# Build Image
docker build -t docker-day2 .

# Run Container with Volume
docker run -d -v mydata:/app/data docker-day2
📌 Author

Anjani Kumar
💻 Aspiring DevOps Engineer | 90DaysOfDevOps