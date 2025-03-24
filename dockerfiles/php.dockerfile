FROM php:8.0-fpm-alpine

# Work directory tương ứng với thư mục chứa source code root trong nginx.conf
# Thư mục này cần khớp với đường dẫn được cấu hình trong Nginx
WORKDIR /var/www/html

COPY src .

# Các extension cần thiết
RUN docker-php-ext-install pdo pdo_mysql

# Thiết lập quyền sở hữu thư mục `/var/www/html` cho user `www-data`
# `www-data` là user mặc định mà PHP-FPM sử dụng để chạy ứng dụng, giúp tránh lỗi phân quyền
RUN chown -R www-data:www-data /var/www/html