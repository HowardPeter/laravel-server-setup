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
|-- src/  # Laravel source code directory (ignored in .gitignore)
|-- env/mysql.env
```

## ⚙️ Installation & Running the Project
### 1️⃣ Install Docker & Docker Compose
First, install **Docker** and **Docker Compose** on your system.

- [Docker Installation Guide](https://docs.docker.com/get-docker/)
- [Docker Compose Installation Guide](https://docs.docker.com/compose/install/)

### 2️⃣ Clone the Repository & Setup Laravel
```sh
git clone https://github.com/HowardPeter/laravel-server-setup.git
```

Since the `src/` directory is ignored in `.gitignore`, you first need to create a `src/` folder in the root folder level. <br>
After that, create a fresh Laravel installation after cloning the repository.
```sh
docker-compose run --rm composer create-project --prefer-dist laravel/laravel:8.0 .
```

### 3️⃣ Configure the `.env` File
Copy the default Laravel `.env` file and update the database settings:
```sh
cp src/.env.example src/.env
```
Edit `.env` to match the MySQL configuration:
```env
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=homestead
DB_USERNAME=homestead
DB_PASSWORD=secret
```

### 4️⃣ Start the Project
Build and start all services:
```sh
docker-compose up --build -d
```
Once completed, visit **http://localhost:8000** to check the application.

### 5️⃣ Run Migration
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