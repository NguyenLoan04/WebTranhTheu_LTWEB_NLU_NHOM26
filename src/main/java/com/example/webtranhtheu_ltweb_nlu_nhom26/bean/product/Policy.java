package com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product;

import java.io.Serializable;
import java.sql.Timestamp;

public class Policy implements Serializable {
    private int id;
    private String title;
    private String description;
    private Timestamp createAt;
    private Timestamp updateAt;

    public Policy() {
    }

    public Policy(String title, String description, Timestamp createAt, Timestamp updateAt) {
        this.title = title;
        this.description = description;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    public Policy(int id, String title, String description, Timestamp createAt, Timestamp updateAt) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.createAt = createAt;
        this.updateAt = updateAt;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public Timestamp getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }

    public String printBean() {
        return "Policy: \n" +
                "\tTitle: " + this.getTitle() +
                "\tDescription: " + this.getDescription() +
                "\tCreated at: " + this.getCreateAt() +
                "\tUpdated at: " + this.getUpdateAt() + "\n";
    }
}
