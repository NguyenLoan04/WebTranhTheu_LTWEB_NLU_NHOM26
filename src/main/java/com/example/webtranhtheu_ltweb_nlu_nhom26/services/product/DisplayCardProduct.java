package com.example.webtranhtheu_ltweb_nlu_nhom26.services.product;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Discount;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Price;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.dao.ProductDAO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.db.JDBIConnector;

import java.util.Comparator;

public class DisplayCardProduct extends DecorationProductDetail {
    ProductDetailService wrapper;
    ProductDAO productDAO;

    public DisplayCardProduct(ProductDetailService wrapper) {
        this.wrapper = wrapper;
        this.productDAO = JDBIConnector.getInstance().onDemand(ProductDAO.class);
    }

    public Product getDisplayProductInfo(int productId) {
        Product product = super.getProductInfo(productId);
//        if (this.getDiscount() != null)
        product.setDiscount(this.getDiscount(productId));
        product.getListPrices().addAll(this.productDAO.getProductPrices(productId).stream().sorted(Comparator.comparingDouble(Price::getPrice)).toList());
        product.getListImageUrls().addAll(this.productDAO.getListProductImageById(productId));
        product.getListMaterials().addAll(this.productDAO.getMaterials(productId));
        product.setProvider(this.productDAO.getProductProvider(productId));
        return product;
    }

    private Discount getDiscount(int productId) {
        return generateDiscount(super.productDAO.getProductDiscounts(productId));
    }

    //Đây là method tạm
    private Discount generateDiscount(Discount discount) {
        if (discount == null) {
            discount = new Discount(0, "Chưa có chương trình khuyến mãi", "Chưa có chương trình khuyến mãi");
        }
        return discount;
    }
}
