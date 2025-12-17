# 🚢 Inception

<p align="center">
  <img src="https://img.shields.io/badge/42%20School-Inception-blue" alt="42 Inception"/>
</p>

> **A Docker-based project to deploy a secure WordPress website with MariaDB and Nginx using Docker Compose.**

---

## 📁 Project Structure

```text
Inception/
├── Makefile
├── usefull.md
├── secrets/
│   ├── credentials.txt
│   ├── db_password.txt
│   └── db_root_password.txt
├── srcs/
│   ├── docker-compose.yml
│   └── requirements/
│       ├── mariadb/
│       │   ├── 50-server.cnf
│       │   ├── Dockerfile
│       │   └── script.sh
│       ├── nginx/
│       │   ├── default
│       │   ├── Dockerfile
│       │   └── keygen.sh
│       └── wordpress/
│           ├── Dockerfile
│           ├── webScript.sh
│           └── www.conf
```

---

## 🛠️ Services

### 🐬 MariaDB
- Custom Dockerfile based on Debian 12
- Initializes the database and user from environment variables and secrets
- Configuration: `50-server.cnf`, `script.sh`
- Data persisted in a local volume

### 📝 WordPress (PHP-FPM)
- Custom Dockerfile based on Debian 12
- Installs PHP, downloads and configures WordPress using WP-CLI
- Configuration: `webScript.sh`, `www.conf`
- Data persisted in a local volume

### 🌐 Nginx
- Custom Dockerfile based on Debian 12
- Serves as a reverse proxy for WordPress with SSL enabled
- Configuration: `default`, `keygen.sh` (for self-signed SSL certs)

---

## 💾 Volumes
- `mariadb_data`: Persists MariaDB data
- `wordpress_data`: Persists WordPress files

## 🔐 Secrets
- `db_password.txt`: MariaDB user password
- `db_root_password.txt`: MariaDB root password

---

## 🚀 Usage

1. **Build and start the services:**
   ```sh
   cd srcs
   docker-compose up --build
   ```
2. **Access WordPress:**
   - Open [https://localhost](https://localhost) in your browser
   - Accept the self-signed certificate warning

3. **Useful commands:**
   - Check local HTTPS connection:
     ```sh
     curl -vk https://localhost
     ```
   - Generate SSL certificates (if needed):
     ```sh
     ./srcs/requirements/nginx/keygen.sh
     ```

---

## 📝 Notes
- All passwords are managed via Docker secrets for security
- The project is designed for local development and educational use
- For production, use trusted SSL certificates and secure password management

---

## 👤 Author

- [Inzagini](https://github.com/Inzagini)

---

<p align="center">
  <em>42 Inception &copy; 2025</em>
</p>
