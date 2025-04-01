# 🚀 Spring Petclinic DevOps Project - CI/CD on AWS EKS with Jenkins

## 🌐 Live Environment
- **App URL:** http://petclinic.normandev.xyz
- **Jenkins URL:** http://jenkins.petclinic.normandev.xyz

---

## 📦 Tech Stack & Tools

### ☁️ Cloud / Infrastructure
- **AWS EC2, VPC, ACM, ECR, S3, Route53** (DNS via GoDaddy)
- **Kubernetes (Kops)** – manual cluster provisioning
- **NGINX Ingress Controller** with TLS support (ACM cert)

### 🛠 CI/CD Stack
- **Jenkins** (running as Pod inside K8s)
- **Docker** + **Amazon ECR** (for image storage)
- **kubectl** for in-cluster deployment
- **GitHub** for source code management

### 💻 Application
- Java 17 + Spring Boot
- Maven
- Based on: https://github.com/dockersamples/spring-petclinic-docker

---

## 🔄 CI/CD Pipeline

### ✅ CI Job (petclinic-ci)
- Clones code from GitHub
- Builds the app with `mvn clean package`
- Builds Docker image
- Tags and pushes it to AWS ECR

### 🚀 CD Job (petclinic-cd)
- Triggered manually or from CI
- Accepts IMAGE_TAG as parameter
- Uses `kubectl set image` to roll out new image in the cluster

---

## 🔐 Domains & Security
- Custom domain from GoDaddy
- Subdomains mapped manually to AWS ELB
- TLS certificate via ACM for `petclinic.normandev.xyz`
- Jenkins exposed without HTTPS (dev-mode only)

---

## 🧠 What This Proves
✅ Hands-on knowledge of K8s, Jenkins, AWS, CI/CD, Ingress, ECR  
✅ Practical domain & cert configuration  
✅ Ability to deliver real-world DevOps projects

---

## 👨‍💻 Author
**Norman Świątek**  
23 y/o DevOps & Cloud enthusiast  
[GitHub](https://github.com/nordans) | [normandev.xyz](http://normandev.xyz)  

---

## 📌 Future Improvements
- Add Helm or Kustomize for deployment management
- Switch to GitOps with ArgoCD
- Add Prometheus + Grafana + Alertmanager
- Enable cert-manager with Let's Encrypt
- Secure Jenkins with Ingress TLS + Basic Auth

---

> Built with 💻, ☕ and way too many terminal tabs.

