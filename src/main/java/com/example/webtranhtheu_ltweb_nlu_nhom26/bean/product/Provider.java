package com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product;

import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class Provider implements Serializable {
    private int id;
    private String providerName;
    private String address;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Provider(int id, String providerName, String address, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.providerName = providerName;
        this.address = address;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Provider() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public void setProviderName(String providerName) {
        this.providerName = providerName;
    }

    public String getProviderName() {
        return providerName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public static class ProviderMapper implements RowMapper<Provider> { //Cần sửa cái này
        @Override
        public Provider map(ResultSet rs, StatementContext ctx) throws SQLException {
            return new Provider(rs.getInt("id"), rs.getString("providerName"), rs.getString("location"), rs.getTimestamp("createdAt"), rs.getTimestamp("updatedAt"));
        }
    }

    public String printBean() {
        return "Provider: \n" +
                "\tName: " + this.getProviderName() +
                "\tAddress: " + this.getAddress() +
                "\tCreated at: " + this.getCreatedAt() +
                "\tUpdated at: " + this.getUpdatedAt() + "\n";
    }
}
