FROM composer:latest

# # Đặt thư mục làm việc cho ứng dụng Laravel
# # Thư mục này cần khớp với đường dẫn được cấu hình trong Nginx
WORKDIR /var/www/html

# Thiết lập lệnh mặc định khi container khởi chạy
# `composer --ignore-platform-reqs` giúp bỏ qua kiểm tra yêu cầu hệ thống
ENTRYPOINT [ "composer", "--ignore-platform-reqs" ]