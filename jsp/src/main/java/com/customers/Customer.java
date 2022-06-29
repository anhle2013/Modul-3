package com.customers;

import java.time.LocalDate;
import java.util.Date;

public class Customer {
    private String fullName;
    private LocalDate dateOfBirth;
    private String address;
    private String imgPath;

    public Customer() {}

    public Customer(String fullName, LocalDate dateOfBirth, String address, String imagePath) {
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.imgPath = imagePath;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
}
