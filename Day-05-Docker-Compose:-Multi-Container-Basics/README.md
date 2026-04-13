# 🚀 Day 05 – Docker Compose: Multi-Container Basics

---

## 📌 Objective

Learn how to run **multi-container applications using a single command** with Docker Compose.

---

## 🧠 What is Docker Compose?

Docker Compose is a tool used to define and run multi-container Docker applications using a single YAML file.

---

## ⚙️ Task 1 – Install & Verify

### ✔️ Check Docker Compose Version

```bash
docker compose version
```

---

## 🐳 Task 2 – Your First Compose File

### 📁 Create Project Folder

```bash
mkdir compose-basics
cd compose-basics
```

### 📄 docker-compose.yml

```yaml
version: "3.8"

services:
  web:
    image: nginx
    ports:
      - "8080:80"
```

### ▶️ Run Container

```bash
docker compose up -d
```

### 🌐 Access in Browser

```
http://localhost:8080
```

### 🛑 Stop Services

```bash
docker compose down
```

---

## 🐳 Task 3 – Two-Container Setup (WordPress + MySQL)

### 📄 docker-compose.yml

```yaml
version: "3.8"

services:
  db:
    image: mysql:5.7
    container_name: mysql_db
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wpuser
      MYSQL_PASSWORD: wppassword
    volumes:
      - db_data:/var/lib/mysql

  wordpress:
    image: wordpress:latest
    container_name: wordpress_app
    depends_on:
      - db
    ports:
      - "8081:80"
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wpuser
      WORDPRESS_DB_PASSWORD: wppassword
      WORDPRESS_DB_NAME: wordpress

volumes:
  db_data:
```

---

### ▶️ Start Services

```bash
docker compose up -d
```

### 🌐 Access WordPress

```
http://localhost:8081
```

👉 Complete WordPress setup in browser

---

### 🔁 Verify Persistence

```bash
docker compose down
docker compose up -d
```

✅ Data should still exist (thanks to volumes)

---

## 🧪 Task 4 – Important Compose Commands

### ▶️ Start in Detached Mode

```bash
docker compose up -d
```

### 📋 View Running Services

```bash
docker compose ps
```

### 📜 View Logs (All Services)

```bash
docker compose logs -f
```

### 📜 Logs (Specific Service)

```bash
docker compose logs -f wordpress
```

### ⏸ Stop Without Removing

```bash
docker compose stop
```

### ❌ Remove Everything

```bash
docker compose down
```

### 🔄 Rebuild Images

```bash
docker compose up --build
```

---

## 🌱 Task 5 – Environment Variables

### 📄 .env File

```env
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=wordpress
MYSQL_USER=wpuser
MYSQL_PASSWORD=wppassword
```

---

### 📄 docker-compose.yml (Using .env)

```yaml
environment:
  MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
  MYSQL_DATABASE: ${MYSQL_DATABASE}
  MYSQL_USER: ${MYSQL_USER}
  MYSQL_PASSWORD: ${MYSQL_PASSWORD}
```

---

### ✅ Verify Variables

```bash
docker compose config
```

---

## 🧠 Key Concepts Learned

* Multi-container orchestration
* Service-to-service communication (DNS via service name)
* Volumes for data persistence
* Environment variables handling
* Compose lifecycle commands

---

## 🎯 Learning Outcome

✔️ Ran multi-container applications
✔️ Connected services using Docker network
✔️ Persisted data using volumes
✔️ Used environment variables in Compose

---

## 🔥 Real-World Use Case

* Full-stack apps (Frontend + Backend + DB)
* Microservices architecture
* Local development environments
* CI/CD pipelines

---

## 📸 Screenshots

*Add screenshots of:*

* Running containers (`docker compose ps`)
* WordPress setup page
* Logs output

---

## 💡 Notes

Docker Compose simplifies complex setups into a **single command workflow**, making it essential for every DevOps engineer.

---
