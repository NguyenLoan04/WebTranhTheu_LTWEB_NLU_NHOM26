package com.example.webtranhtheu_ltweb_nlu_nhom26.services;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.dao.ProductDAO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.db.JDBIConnector;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.product.ConcreteProductDetail;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.product.DisplayCardProduct;

import java.util.LinkedList;
import java.util.List;

public class HomeService {
    ProductDAO productDAO;

    public HomeService() {
        this.productDAO = JDBIConnector.getInstance().onDemand(ProductDAO.class);
    }

    public List<Product> getMostRatedProduct() {
        List<Integer> listProductId = this.productDAO.getMostRatedProductsId();
        List<Product> listProduct = new LinkedList<>();
        for (int id : listProductId) {
            listProduct.add(new DisplayCardProduct(new ConcreteProductDetail()).getDisplayProductInfo(id));
        }
        return listProduct;
    }

    public List<Product> getHotProduct(int limit) {
        List<Integer> listProductId = this.productDAO.getIdOfHotProduct(limit);
        List<Product> listProduct = new LinkedList<>();
        for (int id : listProductId) {
            listProduct.add(new DisplayCardProduct(new ConcreteProductDetail()).getDisplayProductInfo(id));
        }
        return listProduct;
    }

    public List<Product> getNewestProduct(int limit) {
        List<Integer> listProductId = this.productDAO.getNewestProduct(limit);
        List<Product> listProduct = new LinkedList<>();
        for (int id : listProductId) {
            listProduct.add(new DisplayCardProduct(new ConcreteProductDetail()).getDisplayProductInfo(id));
        }
        return listProduct;
    }

    public List<Product> getCurrentProductsDiscount() {
        return productDAO.getDiscountedProduct().stream()
                .map(id -> new DisplayCardProduct(new ConcreteProductDetail()).getDisplayProductInfo(id))
                .toList();
    }
}
