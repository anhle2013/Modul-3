CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;

CREATE TABLE Class (
	ClassID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName varchar(50) NOT NULL,
    StarDate datetime NOT NULL,
    `Status` bit
);

CREATE TABLE Student (
	StudentID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName varchar(50) NOT NULL,
    Address varchar(50),
    Phone varchar(20),
    `Status` bit,
    ClassID int NOT NULL,
    FOREIGN KEY (ClassID) REFERENCES Class (ClassID)
);

CREATE TABLE Subject (
	SubID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	SubName varchar(30) NOT NULL,
    Credit tinyint NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    `Status` bit DEFAULT 1
);

CREATE TABLE Mark (
	MarkID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubID int NOT NULL,
    StudentID int NOT NULL,
    Mark float DEFAULT 0 CHECK (Mark BETWEEN 0 AND 100),
    ExamTimes tinyint DEFAULT 1,
    UNIQUE (SubID, StudentID),
    FOREIGN KEY (SubID) REFERENCES Subject(SubID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);