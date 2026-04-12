# 🚀 Day 04 – Docker Volumes & Networking

## 📌 Objective

Solve two critical Docker problems:

* Data persistence (Volumes)
* Container communication (Networking)

---

# 🧱 Task 1: The Problem (Data Loss)

## ▶️ Run PostgreSQL Container

```bash
docker run -d --name my-postgres -e POSTGRES_PASSWORD=pass postgres
```

## ▶️ Enter Container

```bash
docker exec -it my-postgres psql -U postgres
```

## ▶️ Create Data

```sql
CREATE TABLE test (id INT, name TEXT);
INSERT INTO test VALUES (1, 'DevOps');
SELECT * FROM test;
```

## ❌ Remove Container

```bash
docker stop my-postgres
docker rm my-postgres
```

## ▶️ Run New Container

```bash
docker run -d --name my-postgres -e POSTGRES_PASSWORD=pass postgres
```

## 😱 What Happened?

👉 Data is **gone**

## 🧠 Why?

* Containers are **ephemeral**
* Data is stored inside container filesystem
* When container is removed → data is deleted

---

# 🧱 Task 2: Named Volumes (Solution)

## ▶️ Create Volume

```bash
docker volume create pg-data
```

## ▶️ Run Container with Volume

```bash
docker run -d \
  --name my-postgres \
  -e POSTGRES_PASSWORD=pass \
  -v pg-data:/var/lib/postgresql/data \
  postgres
```

## ▶️ Add Data (same as before)

## ▶️ Remove Container

```bash
docker stop my-postgres
docker rm my-postgres
```

## ▶️ Run New Container (same volume)

```bash
docker run -d \
  --name my-postgres \
  -e POSTGRES_PASSWORD=pass \
  -v pg-data:/var/lib/postgresql/data \
  postgres
```

## ✅ Result

👉 Data is **still there 🎉**

---

## 🔍 Verify Volume

```bash
docker volume ls
docker volume inspect pg-data
```

---

# 🧱 Task 3: Bind Mounts

## 📁 Create Local Folder

```bash
mkdir my-site
cd my-site
```

## 📝 index.html

```html
<h1>🚀 Hello from Bind Mount</h1>
```

## ▶️ Run Nginx with Bind Mount

```bash
docker run -d -p 8080:80 \
  -v $(pwd):/usr/share/nginx/html \
  --name nginx-bind nginx
```

👉 Open: http://localhost:8080

## 🔄 Edit File on Host

```html
<h1>🔥 Updated Live!</h1>
```

👉 Refresh browser → changes visible instantly

---

## 🧠 Named Volume vs Bind Mount

| Feature     | Named Volume      | Bind Mount      |
| ----------- | ----------------- | --------------- |
| Location    | Managed by Docker | Host filesystem |
| Use Case    | Databases         | Development     |
| Performance | Optimized         | Depends on host |
| Portability | High              | Low             |

---

# 🧱 Task 4: Docker Networking Basics

## ▶️ List Networks

```bash
docker network ls
```

## ▶️ Inspect Bridge Network

```bash
docker network inspect bridge
```

## ▶️ Run Two Containers

```bash
docker run -dit --name c1 ubuntu
docker run -dit --name c2 ubuntu
```

## ❓ Ping by Name

```bash
docker exec -it c1 ping c2
```

👉 ❌ Fails

## ❓ Ping by IP

```bash
docker inspect c2
```

```bash
docker exec -it c1 ping <IP>
```

👉 ✅ Works

---

# 🧱 Task 5: Custom Network

## ▶️ Create Network

```bash
docker network create my-app-net
```

## ▶️ Run Containers

```bash
docker run -dit --name c1 --network my-app-net ubuntu
docker run -dit --name c2 --network my-app-net ubuntu
```

## ▶️ Ping by Name

```bash
docker exec -it c1 ping c2
```

👉 ✅ Works 🎉

---

## 🧠 Why Custom Network Works?

* Docker provides **built-in DNS**
* Containers resolve names automatically
* Default bridge does NOT support this

---

# 🧱 Task 6: Put It Together (Real Setup)

## ▶️ Create Network

```bash
docker network create app-net
```

## ▶️ Run Database (Postgres)

```bash
docker run -d \
  --name db \
  --network app-net \
  -e POSTGRES_PASSWORD=pass \
  -v pg-data:/var/lib/postgresql/data \
  postgres
```

## ▶️ Run App Container

```bash
docker run -dit \
  --name app \
  --network app-net \
  ubuntu
```

## ▶️ Test Connection

```bash
docker exec -it app ping db
```

👉 ✅ Success — containers communicate by name

---

# 📸 Screenshots to Add

* Data lost without volume
* Data persists with volume
* Bind mount live update
* docker network ls
* Ping failure vs success
* docker volume inspect

---

# 🧠 Key Learnings

* Containers are **temporary**, volumes make data **permanent**
* Named volumes are best for databases
* Bind mounts are best for development
* Default bridge network is limited
* Custom networks enable **service discovery**

---

# 🎯 Summary

Today you learned:

* How to persist data using Docker volumes
* How to share files using bind mounts
* How containers communicate over networks
* How to design a real multi-container setup

🔥 This is exactly how real-world applications run in production.
