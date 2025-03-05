package com.example.webtranhtheu_ltweb_nlu_nhom26.services.product;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.*;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class DisplayFullProduct extends DecorationProductDetail {
    ProductDetailService wrapper;

    public DisplayFullProduct(ProductDetailService wrapper) {
        this.wrapper = wrapper;
    }

    public Product getFullProductInfo(int productId) {
        Product product = this.wrapper.getProductInfo(productId);
        product.setPolicy(this.getPolicy(productId));
        product.setProvider(this.getProvider(productId));
        product.setCategory(this.getCategory(productId));
        if (this.getDiscount(productId) != null) product.setDiscount(this.getDiscount(productId));
        product.getListTopics().addAll(this.getListTopics(productId));
        product.getListPrices().addAll(this.getListPrices(productId).stream().sorted(Comparator.comparingDouble(Price::getPrice)).toList());
        product.getListMaterials().addAll(this.getListMaterials(productId));
        product.getListImageUrls().addAll(this.productDAO.getListProductImageById(productId));
        product.getListReviews().addAll(this.getListReviews(productId, 0, 3)); //Mặc định offset = 0
        return product;
    }

    public Policy getPolicy(int productId) {
        return super.productDAO.getProductPolicy(productId);
    }

    public Provider getProvider(int productId) {
        return super.productDAO.getProductProvider(productId);
    }

    public Category getCategory(int productId) {
        return super.productDAO.getCategory(productId);
    }

    public Discount getDiscount(int productId) {
        return generateDiscount(super.productDAO.getProductDiscounts(productId));
    }

    public List<Topic> getListTopics(int productId) {
        return super.productDAO.getTopics(productId);
    }

    public List<Price> getListPrices(int productId) {
        return super.productDAO.getProductPrices(productId);
    }

    public List<Material> getListMaterials(int productId) {
        return super.productDAO.getMaterials(productId);
    }

    public List<String> getListImageUrls(int productId) {
        return super.productDAO.getListImageUrls(productId);
    }

    public List<Review> getListReviews(int productId, int offset, int amount) { //Lấy amount review
        //FIXME Thêm phần kiểm tra khi nào hết bình luận có thể lấy
        return super.productDAO.getProductReviews(productId, offset, amount);
    }

    //Sẽ chuyển qua chỗ khác
    public List<Product> getSimilarProduct(Product product) {
        List<Integer> listId = super.productDAO.findAllSimilarProducts(product.getListTopics().stream().map(Topic::getId).collect(Collectors.toList()), product.getId());
        List<Product> result = new ArrayList<>();
        for (int id : listId) {
            result.add(new DisplayCardProduct(new ConcreteProductDetail()).getDisplayProductInfo(id));
        }
        return result;
    }

    //Đây là method tạm
    private Discount generateDiscount(Discount discount) {
        if (discount == null) {
            discount = new Discount(0, "Chưa có chương trình khuyến mãi", "Chưa có chương trình khuyến mãi");
        }
        return discount;
    }
}
