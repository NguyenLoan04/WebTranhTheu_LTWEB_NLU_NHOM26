package com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product;

import com.example.webtranhtheu_ltweb_nlu_nhom26.services.ProductService;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

public class Price implements Serializable {
    private int id;
    private int productId;  //Id sản phẩm
    private int width;  //Chiều dài của sản phẩm
    private int height; //Chiều cao của sản phẩm
    private double price;   //Giá tiền
    private int available;  //Số lượng tồn kho hiện tại

    public Price() {
    }

    public Price(int productId, int width, int height, double price, int available) {
        this.productId = productId;
        this.width = width;
        this.height = height;
        this.price = price;
        this.available = available;
    }

    public Price(int width, int height, double price, int available) {
        this.width = width;
        this.height = height;
        this.price = price;
        this.available = available;
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

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

    public String getDisplayPriceToString() {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setGroupingSeparator('.');
        symbols.setDecimalSeparator(',');
        return new DecimalFormat("#,###", symbols).format(price) + " VNĐ";
    }

    public Price getDiscountedPrice(double value) {
        if (value != 0.0) {
            return new Price(productId, width, height, (1 - value) * price, available);
        }
        return this;
    }

    public String displayDiscountedPriceToString(Discount discount) {
        if (discount == null) return getDisplayPriceToString();
        else {
            return ProductService.getDisplayPriceToString(price * (1 - discount.getValue()));
        }
    }

    @Override
    public String toString() {
        return "Price{" +
                "productId=" + productId +
                ", width=" + width +
                ", height=" + height +
                ", price=" + price +
                ", available=" + available +
                '}';
    }

    public String printBean() {
        return "Price: \n" +
                "\tWidth: " + this.getWidth() +
                "\tHeight: " + this.getHeight() +
                "\tPrice: " + this.getPrice() +
                "\tAvailable: " + this.getAvailable() + "\n";
    }
}


