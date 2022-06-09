CREATE DATABASE QuanLyDiemThi;
USE QuanLyDiemThi;

CREATE TABLE HocSinh (
	MaHS varchar(20) PRIMARY KEY,
    TenHS varchar(50),
    NgaySinh datetime,
    Lop varchar(20),
    GT varchar(20)
);

CREATE TABLE MonHoc (
	MaMH varchar(20) PRIMARY KEY,
    TenMH varchar(50)
);

CREATE TABLE BangDiem (
	MaHS varchar(20),
    MaMH varchar(20),
    DiemThi int,
    NgayKT datetime,
    PRIMARY KEY (MaHS, MaMH),
    FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS),
    FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);

CREATE TABLE GiaoVien (
	MaGV varchar(20) PRIMARY KEY,
    TenGV varchar(50),
    SDT varchar(10)
);

ALTER TABLE MonHoc
	ADD MaGV varchar(20),
    ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);  