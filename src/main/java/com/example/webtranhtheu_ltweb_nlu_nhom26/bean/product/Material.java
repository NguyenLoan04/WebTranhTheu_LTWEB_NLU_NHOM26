package com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product;

import java.io.Serializable;
import java.sql.Timestamp;

public class Material implements Serializable {
    private int id;
    private String title;
    private int active;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Material(String title) {
        this.title = title;
    }

    public Material() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public void setActive(int active) {
        this.active = active;
    }

    public int getActive() {
        return active;
    }

    public String printBean() {
        return "Material: \n" +
                "\tTitle: " + this.getTitle() +
                "\tCreated at: " + this.getCreatedAt() +
                "\tUpdated at: " + this.getUpdatedAt() + "\n";
    }
}
