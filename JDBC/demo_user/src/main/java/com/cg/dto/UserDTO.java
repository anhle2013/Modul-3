package com.cg.dto;

public class UserDTO {

    private int id;
    private String fullName;
    private int age;
    private String phone;
    private String cityName;
    private String address;
    private String status;

    public UserDTO() {
    }

    public UserDTO(int id, String fullName, int age, String phone, String cityName, String address, String status) {
        this.id = id;
        this.fullName = fullName;
        this.age = age;
        this.phone = phone;
        this.cityName = cityName;
        this.address = address;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}