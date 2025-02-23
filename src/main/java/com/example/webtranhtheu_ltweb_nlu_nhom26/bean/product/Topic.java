package com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product;

import java.io.Serializable;
import java.sql.Timestamp;

public class Topic implements Serializable {
    private int id; //Id của topic
    private String title;    //Tên của topic
    private int active; //Trạng thái của topic
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Topic() {
    }

    public Topic(int id, String title, int active, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.title = title;
        this.active = active;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Topic(String title, int active, Timestamp createdAt, Timestamp updatedAt) {
        this.title = title;
        this.active = active;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
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

    public String printBean() {
        return "Provider: \n" +
                "\tName: " + this.getTitle() +
                "\tCreated at: " + this.getCreatedAt() +
                "\tUpdated at: " + this.getUpdatedAt() + "\n";
    }
}
