# Unlock-421wd

Root shell + mở khóa **Viettel vG-421WD**.


![](Assets/Viettel-vG-421WD.jpg)

## Tổng quan

Kho lưu trữ này cung cấp các công cụ và script để có quyền truy cập root shell trên router GPON **Viettel vG-421WD**. Quy trình bao gồm:

1. Bật phiên bản telnet/SSH tạm thời thông qua lỗ hổng trên trang quản trị web.
2. Bật quyền root vĩnh viễn từ phiên tạm thời.
3. Tắt quản lý từ xa (TR-069 / TMS).
4. Tùy chọn: Truy cập ổ USB thông qua cổng USB chưa được hàn (sắp ra mắt).

## Thông tin Router

| Thuộc tính | Giá trị |
|---|---|
| **Thiết bị** | Viettel vG-421WD |
| **Firmware** | `V2803241218` |
| **Kernel** | Linux 3.18.21 |

## Yêu cầu

- Trình duyệt web (để đăng nhập và khai thác lỗ hổng trên trang quản trị)
- Truy cập giao diện web của router (mặc định: `http://192.168.1.1`)
- Client SSH/Telnet (PuTTY, OpenSSH,...)

# Bước 0 - Clone kho lưu trữ

```bash
git clone https://github.com/ElectroHeavenVN/unlock-421wd.git
cd unlock-421wd
```

## Bước 1 - Bật Telnet tạm thời qua giao diện Web

1. Đăng nhập vào trang quản trị web của router.
2. Mở **Công cụ dành cho nhà phát triển** (F12) → **Console**.
3. Đăng nhập vào trang quản trị (tên đăng nhập mặc định: `admin`, mật khẩu: xem ở sau router).
4. Dán nội dung của **[`Unlock temp telnet.js`](Unlock%20temp%20telnet.js)** và nhấn **Enter**.
5. Kết nối qua telnet hoặc SSH:

```bash
telnet 192.168.1.1
# hoặc
ssh admin@192.168.1.1 -p 9777
```
Mật khẩu cho telnet/SSH: `euclid@vht380`.

> **Lưu ý:** Phiên shell tạm thời có giới hạn thời gian. Sử dụng Bước 2 để mở vĩnh viễn.

## Bước 2 - Mở khóa & Tắt quản lý từ xa

Sau khi có shell, tải script **[`unlock_421wd.sh`](unlock_421wd.sh)** vào router. Script này:

1. **Bật telnet vĩnh viễn** - Đặt trạng thái hệ thống để telnet vẫn bật qua các lần khởi động lại.
2. **Tắt TR-069 (CWMP)** - Ngăn máy chủ ACS của Viettel cấu hình lại hoặc cập nhật router từ xa.
3. **Tắt TMSClient (MQTT)** - Ngăn router gửi dữ liệu từ xa đến Viettel cloud.

```bash
# trên máy Linux cục bộ:
python3 -m http.server 8000
```
hoặc:
```cmd
REM trên máy Windows cục bộ:
python -m http.server 8000
``` 

```bash
# Trên shell của router:
curl -o /tmp/unlock_421wd.sh http://<địa_chỉ_ip_pc_của_bạn>:8000/unlock_421wd.sh
chmod +x /tmp/unlock_421wd.sh
/tmp/unlock_421wd.sh
```

## Phân tích Firmware

Bản dump firmware đầy đủ (`421wd_dump.bin` bên trong `421wd_dump.7z`) có thể được phân tích bằng **binwalk**. Một phần dữ liệu đã được trích xuất có trong thư mục `extractions/`.

## Từ chối trách nhiệm

Dự án này chỉ dành cho **mục đích giáo dục và nghiên cứu**. Việc sửa đổi firmware hoặc cấu hình của router có thể làm mất bảo hành, làm hỏng thiết bị, hoặc vi phạm điều khoản dịch vụ của Viettel. Bạn phải tự chịu trách nhiệm. Các tác giả không chịu trách nhiệm cho bất kỳ thiệt hại nào gây ra bởi việc sử dụng các công cụ này.

## Giấy phép
Dự án này được cấp phép theo Giấy phép MIT - xem tệp [LICENSE](LICENSE) để biết chi tiết.
