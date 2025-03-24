# Sử dụng image Nginx phiên bản ổn định, nhỏ gọn dựa trên Alpine Linux
FROM nginx:stable-alpine

# Thiết lập thư mục làm việc là thư mục chứa file cấu hình của Nginx
WORKDIR /etc/nginx/conf.d

# Sao chép file cấu hình `nginx.conf` từ thư mục `nginx` trên máy host vào container
COPY nginx/nginx.conf .

# Đổi tên `nginx.conf` thành `default.conf` để Nginx có thể nhận diện và sử dụng
RUN mv nginx.conf default.conf

# Chuyển thư mục làm việc đến nơi chứa mã nguồn Laravel trong container
WORKDIR /var/www/html

# Sao chép toàn bộ mã nguồn từ thư mục `src` trên máy host vào thư mục `/var/www/html` trong container
COPY src .