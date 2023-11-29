## Thông tin đăng nhập
Phpmyadmin: http://localhost:8080

Dashboard: http://localhost:8081

Login với tài khoản 
- admin:123456
- saler:123456

Mysql admin xem ở file ``\.env``

## Thông tin kết nối SQL

Chỉnh sửa file sau nếu muốn thay đổi thông tin kết nối MySQL
```
# rabitpos\application\config\database.php

'hostname' => 'mariadb', // Không được thay đổi, vì sử dụng docker network
'username' => 'root',
'password' => 'rabitpos',
'database' => 'rabitpos',
'dbdriver' => 'mysqli',
```
*** Tham khảo thông tin cài đặt ở file sau: 
``\rabitpos\.env``

## Import sql 
Truy cập vào đường dẫn ``http://localhost:8080`` để import sql vào. File sql nằm ở đây: ``\rabitpos\database\localhost.sql``


## Thông tin mã nguồn 
Vui lòng lấy mã nguồn từ bạn `phamduybk`.
Git này chỉ hỗ trợ build docker images.
```
https://github.com/phamduybk/rabitpos
```

## Fix lỗi mã nguồn
Không hiểu lý do gì bác share mã nguồn lại cài php 7.4 nên bản này phải build trên PHP 7.4. Sẽ bị lỗi check phiên bản composer. 
```
Composer detected issues in your platform: Your Composer dependencies require a PHP version ">= 8.1.0".
```
Để fix lỗi này thì vào file sau xóa 1 dòng code đi. 
```rabitpos\vendor\composer\platform_check.php```

```
# Comment nó lại như này là xong
// if (!(PHP_VERSION_ID >= 80100)) {
//     $issues[] = 'Your Composer dependencies require a PHP version ">= 8.1.0". You are running ' . PHP_VERSION . '.';
// }
```