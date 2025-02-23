package com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product;

import java.io.Serializable;
import java.sql.Timestamp;

public class Review implements Serializable {
    private int id;
    private int productId;
    private int accountId;
    private int rating;
    private String content;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private Product product;
    public Review() {
    }

    public Review(int productId, int accountId, int rating, String content, Timestamp createdAt, Timestamp updatedAt) {
        this.productId = productId;
        this.accountId = accountId;
        this.rating = rating;
        this.content = content;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }


    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String printBean() {
        return "Material: \n" +
                "\tAccount Id: " + this.getAccountId() +
                "\tRating: " + this.getRating() +
                "\tContent: " + this.getContent() +
                "\tCreated at: " + this.getCreatedAt() +
                "\tUpdated at: " + this.getUpdatedAt() + "\n";
    }
}
