package com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.order;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.admin.orderAdmin.OrderDetails;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Discount;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Order implements Serializable {
    private int id;
    private int status;
    private Timestamp createdAt;
    private Timestamp deliveredAt;
    private String shippingAddress;
    private int statusPay;
    private int method;
    private List<OrderProduct> products;
    private Discount discount;
    private double totalPrice;
    private int cancelReason;
    public Order() {
    }

    public Order(int method, int statusPay, String shippingAddress, Timestamp deliveredAt, Timestamp createdAt, int status, int id,int cancelReason) {
        this.method = method;
        this.statusPay = statusPay;
        this.shippingAddress = shippingAddress;
        this.deliveredAt = deliveredAt;
        this.createdAt = createdAt;
        this.status = status;
        this.id = id;
        this.products = new ArrayList<>();
        this.cancelReason= cancelReason;
    }
    public Order(int method, int statusPay, String shippingAddress, Timestamp deliveredAt, Timestamp createdAt, int status, int id) {
        this.method = method;
        this.statusPay = statusPay;
        this.shippingAddress = shippingAddress;
        this.deliveredAt = deliveredAt;
        this.createdAt = createdAt;
        this.status = status;
        this.id = id;
        this.products = new ArrayList<>();
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getDeliveredAt() {
        return deliveredAt;
    }

    public void setDeliveredAt(Timestamp deliveredAt) {
        this.deliveredAt = deliveredAt;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public int getStatusPay() {
        return statusPay;
    }

    public void setStatusPay(int statusPay) {
        this.statusPay = statusPay;
    }

    public int getMethod() {
        return method;
    }

    public void setMethod(int method) {
        this.method = method;
    }

    public List<OrderProduct> getProducts() {
        return products;
    }

    public void setProducts(List<OrderProduct> products) {
        this.products = products;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getCancelReason() {
        return cancelReason;
    }

    public void setCancelReason(int cancelReason) {
        this.cancelReason = cancelReason;
    }

    public String getStatusDetail() {
        return switch (this.status) {
            case 1 -> "Chờ xác nhận";
            case 2 -> "Chờ lấy hàng";
            case 3 -> "Chờ giao hàng";
            case 4 -> "Đã giao hàng";
            case 5 -> "Đã nhận được hàng";
            case 6 -> "Yêu cầu đổi trả";
            default -> "Đã hủy";
        };
    }
}
