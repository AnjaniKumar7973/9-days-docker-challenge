# 🚀 Day 03 – Dockerfile: Build Your Own Images

## 📌 Objective

Learn how to create custom Docker images using Dockerfiles:

* Write Dockerfiles from scratch
* Understand key instructions
* Compare CMD vs ENTRYPOINT
* Build a real web app image
* Optimize builds using cache

---

# 🧱 Task 1: Your First Dockerfile

## 📁 Project Structure

```
my-first-image/
 ├── Dockerfile
```

## 📝 Dockerfile

```Dockerfile
FROM ubuntu

RUN apt-get update && apt-get install -y curl

CMD ["echo", "Hello from my custom image!"]
```

## 🔨 Build Image

```bash
docker build -t my-ubuntu:v1 .
```

## ▶️ Run Container

```bash
docker run my-ubuntu:v1
```

✅ Output:

```
Hello from my custom image!
```

---

# 🧱 Task 2: Dockerfile Instructions

## 📝 Dockerfile

```Dockerfile
FROM ubuntu

WORKDIR /app

RUN apt-get update && apt-get install -y curl

COPY . .

EXPOSE 3000

CMD ["echo", "Dockerfile Instructions Demo"]
```

## 🧠 Explanation

* **FROM** → Base image (starting point)
* **WORKDIR** → Sets working directory inside container
* **RUN** → Executes commands during build
* **COPY** → Copies files from host to container
* **EXPOSE** → Documents the port (not actually publish)
* **CMD** → Default command when container runs

---

# 🧱 Task 3: CMD vs ENTRYPOINT

## 🔹 CMD Example

```Dockerfile
FROM ubuntu
CMD ["echo", "hello"]
```

### ▶️ Run:

```bash
docker run cmd-image
```

👉 Output: `hello`

```bash
docker run cmd-image "Hi"
```

👉 Output: `Hi` (CMD gets overridden)

---

## 🔹 ENTRYPOINT Example

```Dockerfile
FROM ubuntu
ENTRYPOINT ["echo"]
```

### ▶️ Run:

```bash
docker run entrypoint-image hello
```

👉 Output: `hello`

```bash
docker run entrypoint-image Hi DevOps
```

👉 Output: `Hi DevOps`

---

## 🧠 CMD vs ENTRYPOINT

* **CMD**

  * Default command
  * Can be overridden

* **ENTRYPOINT**

  * Fixed executable
  * Arguments can be passed

👉 ✅ Use:

* CMD → for flexible containers
* ENTRYPOINT → for fixed behavior tools

---

# 🧱 Task 4: Simple Web App Image

## 📁 Project Structure

```
my-website/
 ├── index.html
 ├── Dockerfile
```

## 📝 index.html

```html
<!DOCTYPE html>
<html>
<head>
  <title>My Docker Website</title>
</head>
<body>
  <h1>🚀 Hello from Docker Nginx!</h1>
</body>
</html>
```

## 📝 Dockerfile

```Dockerfile
FROM nginx:alpine

COPY index.html /usr/share/nginx/html/
```

## 🔨 Build

```bash
docker build -t my-website:v1 .
```

## ▶️ Run

```bash
docker run -d -p 8080:80 my-website:v1
```

👉 Open browser:
http://localhost:8080

---

# 🧱 Task 5: .dockerignore

## 📝 .dockerignore

```
node_modules
.git
*.md
.env
```

## 🧠 Why?

* Reduces image size
* Faster builds
* Avoids sensitive data leaks

---

# 🧱 Task 6: Build Optimization

## 🔹 Example

### ❌ Bad Order

```Dockerfile
COPY . .
RUN npm install
```

### ✅ Good Order

```Dockerfile
COPY package.json .
RUN npm install
COPY . .
```

---

## 🧠 Why Layer Order Matters

* Docker caches each layer
* If one layer changes → all next layers rebuild
* Keep frequently changing code at the bottom

👉 ✅ Result:

* Faster rebuilds
* Efficient CI/CD pipelines

---

# 📸 Screenshots to Add

* docker build output
* docker run output
* CMD vs ENTRYPOINT results
* Website running in browser
* docker images size comparison

---

# 🧠 Key Learnings

* Dockerfile = blueprint for custom images
* CMD vs ENTRYPOINT is critical for real-world usage
* nginx:alpine is lightweight and perfect for static apps
* .dockerignore improves security & performance
* Layer caching is the secret to fast builds

---

# 🎯 Summary

Today you learned how to:

* Build your own Docker images
* Use core Dockerfile instructions
* Deploy a real web app in a container
* Optimize builds like a DevOps engineer

🔥 This is production-level Docker skill.
