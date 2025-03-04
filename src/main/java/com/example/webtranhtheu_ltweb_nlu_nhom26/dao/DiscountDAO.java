package com.example.webtranhtheu_ltweb_nlu_nhom26.dao;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.admin.DiscountDTO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Discount;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import org.jdbi.v3.sqlobject.config.KeyColumn;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.sql.Timestamp;
import java.util.List;

public interface DiscountDAO {
    @SqlQuery("select id, title, value, startedAt, endedAt from discounts")
    @RegisterBeanMapper(DiscountDTO.class)
    List<DiscountDTO> getAllDiscountDTO();

    @SqlUpdate("insert into discounts(title, description, value, startedAt, endedAt, createdAt, updatedAt) values(:title, :description, :value, :startedAt, :endedAt, NOW(), NOW())")
    @RegisterBeanMapper(Discount.class)
    @GetGeneratedKeys
    int insertDiscount(@BindBean Discount discount);

    @SqlUpdate("INSERT IGNORE INTO discount_products_details(discountId, productId) VALUES(:discountId, :productId)")
    boolean insertDiscountProduct(@Bind("discountId") int discountId, @Bind("productId") int productId);

    @SqlUpdate("delete from discount_products_details where productId = :productId and discountId = :discountId")
    boolean deleteDiscountProduct(@Bind("productId") int productId, @Bind("discountId") int discountId);

    @SqlQuery("select id, title, description, value, startedAt, endedAt, createdAt, updatedAt from discounts where id = :id")
    @RegisterBeanMapper(Discount.class)
    Discount getDiscountById(@Bind("id") Integer id);

    @SqlUpdate("update discounts set title = :title, description = :description, value = :value, startedAt = :startedAt, endedAt = :endedAt, updatedAt = NOW() where id = :id")
    @RegisterBeanMapper(Discount.class)
    boolean updateDiscount(@BindBean Discount discount);

    @SqlQuery("select id, title, description, value, createdAt, updatedAt, startedAt, endedAt from discounts where NOW()>=startedAt and NOW()<=endedAt")
    @RegisterBeanMapper(Discount.class)
    List<Discount> getDiscountAvailable();

    @SqlQuery("select id, title from discounts where startedAt <= NOW() and NOW() <= endedAt")
    @RegisterBeanMapper(Discount.class)
    List<Discount> getDiscountValid();

    @SqlQuery("select p.id, p.title, p.codeProduct as code from discount_products_details d join products p on d.productId = p.id where d.discountId = :discountId")
    @RegisterBeanMapper(Product.class)
    List<Product> listDiscountProduct(@Bind("discountId") int discountId);

    @SqlQuery("select id, title, codeProduct as code from products where id not in (select productId from discount_products_details where discountId = :discountId) and status = 1")
    @RegisterBeanMapper(Product.class)
    List<Product> getProductNotInDiscount(@Bind("discountId") int discountId);


}
