# 🚀 Day 02 – Docker Images & Container Lifecycle

## 📌 Objective
Understand how Docker images and containers work internally, including:
- Image vs Container relationship
- Image layers & caching
- Full container lifecycle

---

# 🧱 Task 1: Docker Images

## 🔹 Pull Images
```bash
docker pull nginx
docker pull ubuntu
docker pull alpine
🔹 List Images
docker images

👉 Example Output:

Repository	Tag	Size
nginx	latest	~140MB
ubuntu	latest	~70MB
alpine	latest	~7MB
🔹 Compare Ubuntu vs Alpine
Ubuntu
Full OS with many packages
Larger size (~70MB)
More compatible
Alpine
Minimal Linux distribution
Very small (~7MB)
Uses musl libc instead of glibc

👉 ✅ Alpine is smaller because it includes only essential packages.

🔹 Inspect Image
docker inspect nginx

👉 Information available:

Image ID
Created date
OS & architecture
Environment variables
Layers
🔹 Remove Image
docker rmi alpine
🧱 Task 2: Image Layers
🔹 Check Image History
docker image history nginx

👉 Output shows:

Each instruction creates a layer
Some layers show 0B (metadata only)
🧠 What are Layers?
Docker images are built in layers
Each command in Dockerfile = one layer
Layers are:
Cached
Reusable
Shared across images

👉 ✅ Why Docker uses layers:

Faster builds (cache reuse)
Efficient storage
Easy version control
🧱 Task 3: Container Lifecycle
🔹 Create Container (not running)
docker create --name mycontainer nginx
🔹 Start
docker start mycontainer
🔹 Pause
docker pause mycontainer
🔹 Unpause
docker unpause mycontainer
🔹 Stop
docker stop mycontainer
🔹 Restart
docker restart mycontainer
🔹 Kill
docker kill mycontainer
🔹 Remove
docker rm mycontainer
🔹 Check State
docker ps -a

👉 Observe states:

Created
Running
Paused
Exited
🧱 Task 4: Working with Running Containers
🔹 Run Nginx in Detached Mode
docker run -d -p 8080:80 --name nginx-server nginx
🔹 View Logs
docker logs nginx-server
🔹 Follow Logs (Real-time)
docker logs -f nginx-server
🔹 Exec into Container
docker exec -it nginx-server /bin/bash
🔹 Run Command without entering
docker exec nginx-server ls /
🔹 Inspect Container
docker inspect nginx-server

👉 Key Info:

IP Address
Port Mapping (8080 → 80)
Mounts
Network
🧱 Task 5: Cleanup
🔹 Stop All Containers
docker stop $(docker ps -q)
🔹 Remove Stopped Containers
docker rm $(docker ps -a -q)
🔹 Remove Unused Images
docker image prune -a
🔹 Check Disk Usage
docker system df
🔹 Full Cleanup (⚠️ Dangerous)
docker system prune -a
📸 Screenshots to Add
docker images output
docker image history nginx
docker ps -a (different states)
docker logs -f output
docker inspect output
🧠 Key Learnings
Images are blueprints, containers are running instances
Layers make Docker fast & efficient
Containers go through a lifecycle of states
Docker provides powerful tools to inspect & manage resources
🎯 Summary

Today’s hands-on helped understand:

How Docker stores images
How containers behave internally
How to manage containers like a pro

🚀 This is core DevOps knowledge used in real production systems.