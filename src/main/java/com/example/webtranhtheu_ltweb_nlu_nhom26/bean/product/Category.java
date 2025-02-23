package com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product;

import java.io.Serializable;
import java.sql.Timestamp;

public class Category implements Serializable {
    private int id;
    private String title;
    private String patternName;
    private int active;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Category() {

    }

    public Category(int id, String title, String patternName, int active, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.title = title;
        this.patternName = patternName;
        this.active = active;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Category(String title, String patternName, int active, Timestamp createdAt, Timestamp updatedAt) {
        this.title = title;
        this.patternName = patternName;
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

    public String getPatternName() {
        return patternName;
    }

    public void setPatternName(String patternName) {
        this.patternName = patternName;
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
        return "Category: \n" +
                "\tTitle: " + this.getTitle() +
                "\tPattern name: " + this.getPatternName() +
                "\tCreated at: " + this.getCreatedAt() +
                "\tUpdated at: " + this.getUpdatedAt() + "\n";
    }
}
