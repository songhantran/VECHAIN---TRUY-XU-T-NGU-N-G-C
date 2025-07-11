// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruyXuatNguonGoc {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier chiChuSoHuu() {
        require(msg.sender == owner, "Chi chu so huu moi co quyen");
        _;
    }

    // ----------- PHẦN 1: DỮ LIỆU SẢN PHẨM -----------

    struct SanPham {
        string tenSanPham;
        string noiSanXuat;
        uint256 ngaySanXuat;
        string ipfsHash;
    }

    mapping(string => SanPham) public danhSachSanPham;

    event SanPhamMoi(
        string maSanPham,
        string tenSanPham,
        string noiSanXuat,
        uint256 ngaySanXuat,
        string ipfsHash
    );

    function themSanPham(
        string memory maSanPham,
        string memory tenSanPham,
        string memory noiSanXuat,
        uint256 ngaySanXuat,
        string memory ipfsHash
    ) public chiChuSoHuu {
        require(bytes(danhSachSanPham[maSanPham].tenSanPham).length == 0, "San pham da ton tai");

        danhSachSanPham[maSanPham] = SanPham(
            tenSanPham,
            noiSanXuat,
            ngaySanXuat,
            ipfsHash
        );

        emit SanPhamMoi(maSanPham, tenSanPham, noiSanXuat, ngaySanXuat, ipfsHash);
    }

    function xemSanPham(string memory maSanPham) public view returns (
        string memory tenSanPham,
        string memory noiSanXuat,
        uint256 ngaySanXuat,
        string memory ipfsHash
    ) {
        SanPham memory sp = danhSachSanPham[maSanPham];
        return (sp.tenSanPham, sp.noiSanXuat, sp.ngaySanXuat, sp.ipfsHash);
    }

    // ----------- PHẦN 2: TRẠNG THÁI VÀ NHẬT KÝ CHUỖI CUNG ỨNG -----------

    enum TrangThai { SanXuat, VanChuyen, LuuKho, BanLe }

    struct LichSuTrangThai {
        TrangThai trangThai;
        uint256 thoiGian;
        string moTa;
    }

    mapping(string => LichSuTrangThai[]) public nhatKyTrangThai;

    event CapNhatTrangThai(
        string maSanPham,
        TrangThai trangThai,
        uint256 thoiGian,
        string moTa
    );

    function capNhatTrangThai(
        string memory maSanPham,
        uint8 trangThaiMoi,
        string memory moTa
    ) public chiChuSoHuu {
        require(bytes(danhSachSanPham[maSanPham].tenSanPham).length != 0, "San pham khong ton tai");
        require(trangThaiMoi <= uint8(TrangThai.BanLe), "Trang thai khong hop le");

        nhatKyTrangThai[maSanPham].push(
            LichSuTrangThai(TrangThai(trangThaiMoi), block.timestamp, moTa)
        );

        emit CapNhatTrangThai(maSanPham, TrangThai(trangThaiMoi), block.timestamp, moTa);
    }

    function xemTrangThaiGanNhat(string memory maSanPham) public view returns (
        TrangThai trangThai,
        uint256 thoiGian,
        string memory moTa
    ) {
        uint256 len = nhatKyTrangThai[maSanPham].length;
        require(len > 0, "Chua co trang thai nao");

        LichSuTrangThai memory cuoi = nhatKyTrangThai[maSanPham][len - 1];
        return (cuoi.trangThai, cuoi.thoiGian, cuoi.moTa);
    }

    function demSoTrangThai(string memory maSanPham) public view returns (uint256) {
        return nhatKyTrangThai[maSanPham].length;
    }
}
