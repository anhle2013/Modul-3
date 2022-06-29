package com.cg.model;

public class User {
    private int id;
    private String fullName;
    private String phone;
    private String address;
    private int cityId;
    private int age;
    private String status;


    public User() {}

    public User(String fullName, String phone, String address, int cityId, int age) {
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.cityId = cityId;
        this.age = age;
        status = "active";
    }

    public User(int id, String fullName, String phone, String address, int cityId, int age, String status) {
        this.id = id;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.cityId = cityId;
        this.age = age;
        this.status = status;
    }

    public User(int id, String fullName, String phone, String address, int cityId, int age) {
        this.id = id;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.cityId = cityId;
        this.age = age;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
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
