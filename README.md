# 🧾 Hợp đồng thông minh truy xuất nguồn gốc sản phẩm

Dự án này mô phỏng chức năng **truy xuất nguồn gốc và theo dõi chuỗi cung ứng** bằng công nghệ **Blockchain**, được viết bằng ngôn ngữ **Solidity** và triển khai trực tiếp trên nền tảng **Remix IDE**. 

Đây là phần minh họa kỹ thuật cho hướng nghiên cứu ứng dụng nền tảng **VeChain** trong việc đảm bảo tính minh bạch, xác thực và bền vững trong quản lý chuỗi cung ứng tại Việt Nam.

---

## 🛠️ Công nghệ sử dụng

- ⚙️ Solidity ^0.8.0
- 💻 Remix Ethereum IDE (trình duyệt)
- 🔗 IPFS (CID mô phỏng)
- 🧪 Sepolia Testnet

---

## 🎯 Mục tiêu triển khai

Hợp đồng được thiết kế để thực hiện các chức năng sau:

- ✅ Thêm sản phẩm mới với mã định danh riêng (mã sản phẩm)
- ✅ Lưu trữ các thông tin: tên sản phẩm, nơi sản xuất, ngày sản xuất, mã IPFS
- ✅ Cập nhật trạng thái sản phẩm theo chuỗi cung ứng (Sản xuất → Vận chuyển → Lưu kho → Bán lẻ)
- ✅ Ghi lại lịch sử trạng thái của từng sản phẩm (on-chain)
- ✅ Cho phép người dùng kiểm tra trạng thái mới nhất và số lần cập nhật

---

## 🔧 Cấu trúc hợp đồng

```solidity
function themSanPham(...) public onlyOwner
function capNhatTrangThai(...) public onlyOwner
function xemSanPham(string memory maSanPham) public view returns (...)
function xemTrangThaiGanNhat(string memory maSanPham) public view returns (...)
function demSoTrangThai(string memory maSanPham) public view returns (uint256)
