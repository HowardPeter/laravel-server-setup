# 🚀 Laravel + Docker Compose

## 📌 Introduction
This project sets up a Laravel development environment using **Docker Compose**, including the following services:
- **Nginx** (Web Server)
- **PHP-FPM** (PHP processing)
- **MySQL** (Database)
- **Composer** (PHP dependency management)
- **Artisan** (Laravel CLI commands)
- **Node.js (NPM)** (Frontend processing)

## 📁 Project Structure
```
/
|-- docker-compose.yml
|-- dockerfiles/
|   |-- php.dockerfile
|   |-- composer.dockerfile
|   |-- nginx.dockerfile
|-- nginx/
|   |-- nginx.conf
|-- src/  # Laravel source code directory
|-- env/mysql.env
```

## ⚙️ Installation & Running the Project
### 1️⃣ Install Docker & Docker Compose
First, install **Docker** and **Docker Compose** on your system.

- [Docker Installation Guide](https://docs.docker.com/get-docker/)
- [Docker Compose Installation Guide](https://docs.docker.com/compose/install/)

### 2️⃣ Start the Project
Run the following command to build and start all services:
```sh
docker-compose up --build -d
```
Once completed, visit **http://localhost:8000** to check the application.

### 3️⃣ Install Laravel (if no source code exists)
If there is no Laravel source code in the `src/` directory, create a new Laravel project with:
```sh
docker-compose run --rm composer create-project --prefer-dist laravel/laravel:8.0 .
```
Then, update the `./src/.env` file to match the MySQL configuration:
```env
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=homestead
DB_USERNAME=homestead
DB_PASSWORD=secret
```

### 4️⃣ Run Migration
Create the database and run migrations using Artisan:
```sh
docker-compose run --rm artisan migrate --seed
```

## 🛠️ Useful Commands
### 🖥️ Check Logs
```sh
docker-compose logs -f server  # View Nginx logs
docker-compose logs -f php     # View PHP logs
```

### 🔄 Restart Containers
```sh
docker-compose restart
```

### 🚀 Run Artisan Commands
```sh
docker-compose run --rm artisan tinker
```

### 📦 Install Laravel Packages via Composer
```sh
docker-compose run --rm composer require laravel/ui
```

### 🎨 Run NPM Commands
```sh
docker-compose run --rm npm install
```