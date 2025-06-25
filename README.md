# 🚀 Dockerized Multi-Service System with NGINX Reverse Proxy

This project demonstrates a containerized microservice architecture using:

- 🟢 **Service 1:** Golang API (port `8001`)
- 🔵 **Service 2:** Python Flask API (port `8002`)
- 🔁 **NGINX:** Acts as a reverse proxy exposing both services via `localhost:8080`

Everything is containerized using Docker Compose and communicates via a bridge network.

---

## 📁 Project Structure

```
.
├── docker-compose.yml
├── nginx/
│   ├── Dockerfile
│   └── nginx.conf
├── service_1/
│   ├── Dockerfile
│   ├── main.go
│   └── README.md
├── service_2/
│   ├── Dockerfile
│   ├── app.py
│   └── README.md
├── test.sh
└── README.md
```

---

## 🛠️ Getting Started

### 🔧 Prerequisites

- Docker
- Docker Compose
- (Optional) `jq` for readable test output

### ▶️ Run the Project

```bash
docker-compose up --build
```

This will:

- Build all 3 services (Go, Python, NGINX)
- Start NGINX on `localhost:8080`
- Use internal health checks to confirm readiness

---

## 🌐 Access the Services

Once running, test the routes:

| URL | Description |
|-----|-------------|
| http://localhost:8080/service1/ping | Go service health check |
| http://localhost:8080/service1/hello | Go service hello message |
| http://localhost:8080/service2/ping | Python service health check |
| http://localhost:8080/service2/hello | Python hello message |

---

## ✅ Health Checks

Both containers implement `/ping` endpoints that Docker Compose uses for health checks before considering the service “healthy”.

---

## 📜 Test Script

You can verify routing using:

```bash
bash test.sh
```

This runs `curl` commands and prints responses for both services via NGINX.

---

## 📄 NGINX Features

- Routes `/service1/` → Go app  
- Routes `/service2/` → Flask app  
- Logs each request with:
  - IP address
  - Timestamp
  - URL
  - Status code
  - Response time

---

## 🔐 Security Headers Included

- `X-Content-Type-Options: nosniff`
- `X-Frame-Options: DENY`
- `X-XSS-Protection: 1; mode=block`

---

## 📦 Build Summary

All services use lightweight base images:

- **Alpine** for Go
- **Python Slim + uvicorn** for Flask
- **Alpine** for NGINX

---

## 💡 Useful Commands

```bash
docker-compose down             # Stop and remove containers
docker-compose logs -f nginx    # View real-time access logs
docker ps                       # Check running containers
```

---

## 🧪 One-Liner Summary

A clean, secure, containerized reverse-proxy system with real-time logging, health checks, and auto-routing for multiple microservices.
