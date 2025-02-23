package com.example.webtranhtheu_ltweb_nlu_nhom26.services.product;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Review;
import com.example.webtranhtheu_ltweb_nlu_nhom26.dao.ProductDAO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;

public class ConcreteProductDetail implements ProductDetailService {
    ProductDAO productDAO;

    public ConcreteProductDetail() {
        this.productDAO = JDBIConnector.getInstance().onDemand(ProductDAO.class);
    }

    //Dùng để hiển thị thông tin product dưới dạng card
    @Override
    public Product getProductInfo(int productId) {
        return productDAO.getProductInfo(productId);
    }

    // Các utility method
    public int countProducts() {
        return productDAO.countProducts();
    }

    public int countReviews(int id) {
        return productDAO.countReviews(id);
    }

    public boolean isUserCanReview(int productId, int userId) {
        return productDAO.isUserCanReview(productId, userId);
    }

    //Đây là method tạm, sau này sẽ tách sang review
    public boolean uploadReview(Review review) {
        return productDAO.insertReview(review.getAccountId(), review.getProductId(), review.getRating(), review.getContent(), review.getCreatedAt(), review.getUpdatedAt()) != 0;
    }

    public double getProductRating(int productId) {
        return productDAO.getProductRating(productId);
    }

    public List<Integer> filterProduct(String categoryName, List<Integer> listTopicId, int rating, double fromPrice, double toPrice, String providerName, String productName, int offset, int amount) {
        return productDAO.filterProduct(categoryName, listTopicId, rating, fromPrice, toPrice, providerName, productName, (offset - 1) * amount, amount);
    }

    public List<Integer> findProductsIdByName(String productName, int page, int amount) {
        return productDAO.findProductsIdByName("%" + productName + "%", (page - 1) * amount, amount);
    }
}
