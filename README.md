# 🧾 Hợp đồng thông minh truy xuất nguồn gốc sản phẩm

Dự án này mô phỏng chức năng **truy xuất nguồn gốc sản phẩm** bằng **Blockchain**, được viết bằng **Solidity** và triển khai trên **Remix IDE**. Đây là phần minh họa nhỏ trong hướng nghiên cứu về ứng dụng của nền tảng **VeChain** trong quản lý chuỗi cung ứng tại Việt Nam.

---

## 🛠️ Công nghệ sử dụng
- ⚙️ Solidity ^0.8.0
- 💻 Remix IDE (trực tuyến)
- 🔗 IPFS (giả lập CID)
- 🧪 JavaScript VM / Sepolia testnet (tùy chọn)

---

## 🧩 Mục tiêu

Triển khai một smart contract đơn giản có khả năng:
- ✅ Lưu trữ thông tin sản phẩm (tên, nơi sản xuất, ngày sản xuất)
- ✅ Gắn mã IPFS chứa dữ liệu xác thực (chứng nhận, ảnh...)
- ✅ Cho phép người dùng truy vấn minh bạch, không thể sửa đổi

---

## 🧾 Cấu trúc hợp đồng

```solidity
function themSanPham(...) public onlyOwner
function xemSanPham(maSanPham) public view returns (...)
