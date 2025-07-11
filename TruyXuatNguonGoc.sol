// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruyXuatNguonGoc {
    address public owner;

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

    constructor() {
        owner = msg.sender;
    }

    modifier chiChuSoHuu() {
        require(msg.sender == owner, "Chi chu so huu moi co quyen");
        _;
    }

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
}
