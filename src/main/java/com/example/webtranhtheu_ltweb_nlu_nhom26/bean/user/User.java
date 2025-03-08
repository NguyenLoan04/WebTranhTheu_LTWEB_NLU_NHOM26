package com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.Address;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.order.Order;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class User implements Serializable {
    private int id;
    private String avatarUrl;
    private String username;
    private String fullName;
    private String password;
    private String email;
    private String phone;
    private int gender;
    private String description;
    private int statusAccount;
    private List<Address> location;
    private List<WishProduct> wishProducts;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private int role;
    private List<Order> orders;

    public User() {}

    // constructor để thêm người dùng
    public User(String avatarUrl, String username, String fullName, String password, String email, String phone, int gender, String description, int statusAccount, Timestamp createdAt, Timestamp updatedAt, int role) {
        this.avatarUrl = avatarUrl;
        this.username = username;
        this.fullName = fullName;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.description = description;
        this.statusAccount = statusAccount;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.role = role;
    }

    public User(String username, String avatarUrl, String fullName, String password, String email, Timestamp createdAt, Timestamp updatedAt, int role, int statusAccount) {
        this.username = username;
        this.fullName = fullName;
        this.avatarUrl = avatarUrl;
        this.password = password;
        this.email = email;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.role = role;
        this.statusAccount = statusAccount;
    }

    public User(String fullName, String email, String avatarUrl, int statusAccount, Timestamp createdAt, Timestamp updatedAt, int role) {
        this.fullName = fullName;
        this.email = email;
        this.avatarUrl = avatarUrl;
        this.statusAccount = statusAccount;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.role = role;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStatusAccount(int statusAccount) {
        this.statusAccount = statusAccount;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public String getUsername() {
        return username;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public int getGender() {
        return gender;
    }

    public String getDescription() {
        return description;
    }

    public int getStatusAccount() {
        return statusAccount;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public int getRole() {
        return role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setLocation(List<Address> location) {
        this.location = location;
    }

    public List<Address> getLocation() {
        return location;
    }

    public List<WishProduct> getWishProducts() {
        return wishProducts;
    }

    public void setWishProducts(List<WishProduct> wishProducts) {
        this.wishProducts = wishProducts;
    }

    public Address getDefaultLocation() {
        if (location == null || location.size() == 0) {
            return new Address(0, "Chưa chọn");
        }
        else return location.get(0);
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public WishProduct getWishProductById(int productId) {
        for (WishProduct wishProduct : wishProducts) {
            if (wishProduct.getProduct().getId() == productId) {
                return wishProduct;
            }
        }
        return null;
    }
}
