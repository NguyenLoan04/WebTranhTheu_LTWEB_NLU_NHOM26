package com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product;

import com.example.webtranhtheu_ltweb_nlu_nhom26.services.DiscountService;

import java.io.Serializable;
import java.sql.Timestamp;

public class Discount implements Serializable {
    private int id;
    private String title;
    private String description;
    private double value;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private Timestamp startedAt;
    private Timestamp endedAt;

    public Discount() {
    }

    public Discount(int id, String description, String title) {
        this.id = id;
        this.description = description;
        this.title = title;
        this.value = 0;
    }

    public Discount(String title, String description, double value, Timestamp startedAt, Timestamp endedAt) {
        this.title = title;
        this.description = description;
        this.value = value;
        this.startedAt = startedAt;
        this.endedAt = endedAt;
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

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
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

    public Timestamp getStartedAt() {
        return startedAt;
    }

    public void setStartedAt(Timestamp startedAt) {
        this.startedAt = startedAt;
    }

    public Timestamp getEndedAt() {
        return endedAt;
    }

    public void setEndedAt(Timestamp endedAt) {
        this.endedAt = endedAt;
    }

    @Override
    public String toString() {
        return "Discount{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", value=" + value +
                '}';
    }

    public String displayDiscountDetail() {
        return DiscountService.displayDiscount(this);
    }

    public String displayDiscountValue() {
        return (int) (this.value * 100) + " %";
    }

    @Override
    public boolean equals(Object other) {
        if (other == null || this.getClass() != other.getClass()) return false;
        Discount otherDiscount = (Discount) other;
        return this.id == otherDiscount.id &&
                this.title.equals(otherDiscount.title) &&
                this.description.equals(otherDiscount.description) &&
                this.value == otherDiscount.value &&
                this.createdAt.equals(otherDiscount.createdAt) &&
                this.updatedAt.equals(otherDiscount.updatedAt) &&
                this.startedAt.equals(otherDiscount.startedAt) &&
                this.endedAt.equals(otherDiscount.endedAt);
    }

    public String printBean() {
        return "Discount: \n" +
                "\tTitle: " + this.getTitle() +
                "\tDescription: " + this.getDescription() +
                "\tValue: " + this.getValue() +
                "\tStartedAt: " + this.getStartedAt() +
                "\tEndedAt: " + this.getEndedAt() + "\n";
    }
}
