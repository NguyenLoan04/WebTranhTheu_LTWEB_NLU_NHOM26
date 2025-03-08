package com.example.webtranhtheu_ltweb_nlu_nhom26.dao;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.admin.ProductDTO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.*;
import com.example.webtranhtheu_ltweb_nlu_nhom26.dao.mapper.BaseProductMapper;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.config.RegisterRowMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.customizer.BindList;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.awt.*;
import java.sql.Timestamp;
import java.util.List;

public interface ProductDAO {

    //Lấy thông tin cơ bản của sản phẩm
    @SqlQuery("""
        select products.id, products.title, products.codeProduct, products.description,
                   products.typeOfProduct, products.createdAt, products.updatedAt 
        from products 
        join category_products_details on products.id = category_products_details.productId 
        where products.id = :id and products.status = 1
    """)
    @RegisterRowMapper(BaseProductMapper.class)
    Product getProductInfo(@Bind("id") int id);

    //Lấy danh mục của sản phẩm theo id
    @SqlQuery("""
        select categories.*
        from categories
        join category_products_details on categories.id = category_products_details.categoryId
        where category_products_details.productId = :id and categories.active = 1
    """)
    @RegisterBeanMapper(Category.class)
    Category getCategory(@Bind("id") int id);

    //Lấy nhà cung cấp của sản phẩm
    @SqlQuery("""
        select providers.id, providers.providerName, addresses.location, providers.createdAt, providers.updatedAt
            from providers
                join products on providers.id = products.providerId
                join addresses on providers.addressId = addresses.id
            where products.id = :id
    """)
    @RegisterBeanMapper(Provider.class)
    Provider getProductProvider(@Bind("id") int id);

    //Lấy chính sách của sản phẩm theo id
    @SqlQuery("""
        select policies.title, policies.description, policies.createdAt, policies.updatedAt
        from policies join products on policies.id = products.policyId
        where products.id = :id
    """)
    @RegisterBeanMapper(Policy.class)
    Policy getProductPolicy(@Bind("id") int id);

    //Lấy chủ đề của sản phẩm theo id
    @SqlQuery("""
        select topics.id, topics.title, topics.active, topics.createdAt, topics.updatedAt
        from topics join topic_products_details on topic_products_details.topicId = topics.id
        where topic_products_details.productId = :id and topics.active = 1
    """)
    @RegisterBeanMapper(Topic.class)
    List<Topic> getTopics(@Bind("id") int id);

    //Lấy tất cả hình ảnh của sản phẩm theo id
    @SqlQuery("select imgUrl from product_images where productId = :id")
    List<String> getListImageUrls(@Bind("id") int id);

    //Lấy tất cả thông tin về giá và kích thước của sản phẩm theo id
    @SqlQuery("select productId, width, height, price, available from product_prices where productId = :id")
    @RegisterBeanMapper(Price.class)
    List<Price> getProductPrices(@Bind("id") int id);

    //Lấy nguyên liệu của sản phẩm theo id
    @SqlQuery("select materials.title, materials.createdAt, materials.updatedAt from material_products_details join materials on material_products_details.materialId = materials.id where productId = :id")
    @RegisterBeanMapper(Material.class)
    List<Material> getMaterials(@Bind("id") int id);

    //Lấy các review của sản phẩm theo id
    @SqlQuery("select id, productId, accountId, rating, content, createdAt, updatedAt from product_reviews where productId = :id and content is not null limit :offset, :amount")
    @RegisterBeanMapper(Review.class)
    List<Review> getProductReviews(@Bind("id") int id, @Bind("offset") int offset, @Bind("amount") int amount);

    //Lấy thông tin giảm giá của sản phẩm
    @SqlQuery("""
        select id, title, description, value, createdAt, updatedAt, startedAt, endedAt
        from discounts
            join discount_products_details on discounts.id = discount_products_details.discountId
        where discounts.startedAt <= now() and discounts.endedAt >= now() and discount_products_details.productId = :id
        order by value desc
    """)
    @RegisterBeanMapper(Discount.class)
    Discount getProductDiscounts(@Bind("id") int id);

    @SqlQuery("""
        select imgUrl
        from product_images
        where productId = :id
    """)
    List<String> getListProductImageById(@Bind("id") int id);
    //Lấy id của các sản phẩm hot (là các sản phẩm được order nhiều nhất trong 3 tháng gần đây)
    @SqlQuery("""
        select distinct products.id
        from products
        join (
            select order_products_details.productId
            from order_products_details
            join orders on order_products_details.orderId = orders.id
            where orders.createdAt >= now() - interval 3 month
                and order_products_details.productId in (
                    select productId
                    from order_products_details
                    group by productId
                    order by count(productId)
                )
            ) as limit_orders on limit_orders.productId = products.id
        limit :limit
    """)
    List<Integer> getIdOfHotProduct(@Bind("limit") int limit);

    //Lấy id cùa các sản phẩm mới
    @SqlQuery("""
        select products.id
        from products
        order by products.updatedAt desc
        limit :limit
    """)
    List<Integer> getNewestProduct(@Bind("limit") int limit);

    //Lấy danh sách các product có đánh giá cao nhất
    @SqlQuery("select products.id from products join ( select productId, avg(rating) as rating from product_reviews group by productId order by rating desc limit 5) as product_ratings on product_ratings.productId = products.id")
    List<Integer> getMostRatedProductsId();

    @SqlQuery("""
        select products.id
        from products
            join discount_products_details on products.id = discount_products_details.productId
            join discounts on discounts.id = discount_products_details.discountId
        where discounts.startedAt <= now() and discounts.endedAt >= now()
        limit 5
    """)
    List<Integer> getDiscountedProduct();

    //Đếm xem đã có bao nhiêu sản phẩm
    @SqlQuery("select count(id) from products")
    int countProducts();

    //Đếm xem sản phẩm đó có bao nhiêu lượt đánh giá
    @SqlQuery("select count(id) from product_reviews where productId = :id")
    int countReviews(@Bind("id") int id);

    //Thêm đánh giá vào
    @SqlUpdate("""
        insert into product_reviews(accountId, productId, rating, content, createdAt, updatedAt)
        values(:accountId, :productId, :rating, :content, :createdAt, :updatedAt)
    """)
    int insertReview(@Bind("accountId") int accountId, @Bind("productId") int productId, @Bind("rating") int rating, @Bind("content") String content, @Bind("createdAt") Timestamp createdAt, @Bind("updatedAt") Timestamp updatedAt);

    //Kiểm tra xem người dùng có đuược review không
    @SqlQuery("""
        select ifnull(count(orders.accountId) > reviews.count_review, 1) as result
        from orders
            join order_products_details
            on orders.id = order_products_details.orderId
            join (
                select count(accountId) as count_review, accountId
                from product_reviews
                where accountId = :accountId and productId = :productId
                group by accountId
            ) as reviews
            on reviews.accountId = orders.accountId
        where orders.accountId = :accountId and order_products_details.productId = :productId
    """)
    boolean isUserCanReview(@Bind("accountId") int accountId, @Bind("productId") int productId);

    //Lấy số sao của sản phẩm
    @SqlQuery("""
        select avg(rating)
        from product_reviews
        where productId = :productId
    """)
    double getProductRating(@Bind("productId") int productId);

    //Lấy các sản phẩm tương tự (có chủ đề tương tự)
    @SqlQuery("""
        select products.id
        from products join topic_products_details on products.id = topic_products_details.productId
        where topic_products_details.topicId in (<topicIds>) and products.id != :productId
        limit 5
    """)
    List<Integer> findAllSimilarProducts(@BindList("topicIds") List<Integer> topicIds, @Bind("productId") int productId);

    @SqlQuery("select id, codeProduct as code, title from products where status = 1")
    @RegisterBeanMapper(Product.class)
    List<Product> getProductsCodeAndTitle();

    //Lọc sản phẩm theo các tiêu chí
    @SqlQuery("""
        select distinct products.id
        from products
        join category_products_details
            on products.id = category_products_details.productId
        join categories
            on category_products_details.categoryId = categories.id
        join topic_products_details
            on products.id = topic_products_details.productId
        join product_prices
            on products.id = product_prices.productId
        left join product_reviews
            on products.id = product_reviews.productId
        join providers
            on products.providerId = providers.id
        where (:patternName is null or categories.patternName like :patternName)
            and (json_array(<topicId>) = '[null]' or topic_products_details.topicId in (<topicId>))
            and (:providerName is null or providers.providerName like :providerName)
            and ((:fromPrice = 0 and :toPrice = 0) or :fromPrice <= :toPrice and product_prices.price between :fromPrice and :toPrice)
            and (:productName is null or products.title like :productName)
        group by products.id
        having (:rating = 0 or coalesce(avg(product_reviews.rating), 0) >= :rating)
        order by products.id
        limit :offset, :amount
    """)
    List<Integer> filterProduct(@Bind("patternName") String patternName, @BindList(value = "topicId", onEmpty = BindList.EmptyHandling.NULL_STRING) List<Integer> topicId,
                                @Bind("rating") int rating,
                                @Bind("fromPrice") double fromPrice, @Bind("toPrice") double toPrice,
                                @Bind("providerName") String providerName, @Bind("productName") String productName,
                                @Bind("offset") int offset, @Bind("amount") int amount);

    //Lấy danh sách các nhà cung cấp
    @SqlQuery("""
        select providers.id, providers.providerName, addresses.location, providers.createdAt, providers.updatedAt
        from providers
            join addresses on providers.addressId = addresses.id
    """)
    @RegisterBeanMapper(Provider.class)
    List<Provider> getListProvider();

    //Tìm id sản phẩm theo tên
    @SqlQuery("""
        select products.id
        from products
        where title like :productName
        limit :offset, :amount
    """)
    List<Integer> findProductsIdByName(@Bind("productName") String productName, @Bind("offset") int offset, @Bind("amount") int amount);

    //Phần admin
    @SqlQuery("select p.id, p.codeProduct as code,  p.title, x.available, y.imgUrl, ifnull(z.countEvaluate, 0) as countEvaluate, ifnull(z.totalStar, 0) as totalStar, p.status as status from products p " +
            "LEFT JOIN (select productId, sum(available) as available  from product_prices GROUP BY productId) x on p.id = x.productId LEFT JOIN (select productId, min(imgUrl) as imgUrl from product_images GROUP BY productId) y on p.id = y.productId " +
            "LEFT JOIN (select productId, count(productId) as countEvaluate, avg(rating) as totalStar from product_reviews GROUP BY productId) z on p.id = z.productId")
    @RegisterBeanMapper(ProductDTO.class)
    List<ProductDTO> getProductsDTO();

    @SqlQuery("select id, title from materials where active = 1")
    @RegisterBeanMapper(Material.class)
    List<Material> getMaterials();

    @SqlQuery("select id, providerName from providers")
    @RegisterBeanMapper(Provider.class)
    List<Provider> getProviders();

    @SqlUpdate("insert into products(codeProduct, title, description, status, typeOfProduct, policyId, createdAt, updatedAt)\n" +
            "values(:code, :title, :description, :status, :type, 1, NOW(), NOW())")
    @GetGeneratedKeys
    int insertProduct(@BindBean Product product);

    @SqlUpdate("update products set providerId = :providerId where id = :id")
    void updateProvider(@Bind("providerId") int providerId, @Bind("id") int id);

    @SqlUpdate("INSERT IGNORE INTO material_products_details (materialId, productId, updatedAt) " +
            "VALUES (:materialId, :productId, NOW())")
    void updateMaterial(@Bind("materialId") int materialId, @Bind("productId") int productId);

    @SqlUpdate("insert into product_prices(productId, width, height, price, available)\n" +
            "values(:productId, :width, :height, :price, :available)")
    void insertProductPrice(@BindBean Price price);

    @SqlUpdate("insert into product_images(productId, imgUrl)\n" +
            "values(:productId, :imgUrl)")
    void insertProductImage(@Bind("productId") int productId, @Bind("imgUrl") String imgUrl);

    @SqlQuery("select id, codeProduct as code, title, description, status, typeOfProduct as type, createdAt, updatedAt from products where id = :id")
    @RegisterBeanMapper(Product.class)
    Product getProductById(@Bind("id") int id);

    @SqlQuery("select c.id, c.title from category_products_details cd join categories c on cd.categoryId = c.id where cd.productId = :productId limit 1")
    @RegisterBeanMapper(Category.class)
    Category getCategoryById(@Bind("productId") int productId);

    @SqlQuery("select t.id, t.title from topic_products_details tp join topics t on tp.topicId = t.id where tp.productId = :productId")
    @RegisterBeanMapper(Topic.class)
    List<Topic> getTopicById(@Bind("productId") int productId);

    @SqlQuery("select id, price, available, width, height from product_prices where productId = :productId")
    @RegisterBeanMapper(Price.class)
    List<Price> getPriceById(@Bind("productId") int productId);

    @SqlQuery("select id, accountId, rating, content, createdAt from product_reviews WHERE productId = :productId")
    @RegisterBeanMapper(Review.class)
    List<Review> getReviewById(@Bind("productId") int productId);

    @SqlQuery("select imgUrl from product_images WHERE productId = :productId")
    List<String> getImgUrlById(@Bind("productId") int productId);


    @SqlUpdate("""
        update product_prices set available = :amount where productId = : productId and width = :width and height = :height and price = :price
    """)
    int updateProductAvailable(@Bind("productId") int productId, @Bind("width") int width, @Bind("height") int height, @Bind("price") double price, @Bind("amount") int amount);
    @SqlQuery("select m.id, m.title from material_products_details mp join materials m on mp.materialId = m.id where mp.productId = :productId and m.active = 1")
    @RegisterBeanMapper(Material.class)
    List<Material> getListMaterialByProductId(@Bind("productId") int productId);

    @SqlQuery("select pro.id, pro.providerName from products p join providers pro on p.providerId = pro.id where p.id = :productId")
    @RegisterBeanMapper(Provider.class)
    Provider getProviderByProductId(@Bind("productId") int productId);

    @SqlQuery("select po.id, po.title from products p join policies po on p.policyId = po.id where p.id = :productId")
    @RegisterBeanMapper(Policy.class)
    Policy getPolicyByProductId(@Bind("productId") int productId);

    @SqlUpdate("update products set codeProduct = :code, title = :title, description = :description, providerId = :provider.id, typeOfProduct = :type, status = :status, updatedAt = NOW() where id = :id")
    void updateProduct(@BindBean Product product);

    @SqlUpdate("delete from product_images where productId = :productId and imgUrl = :imgUrl")
    void deleteProductImage(@Bind("productId") int productId, @Bind("imgUrl") String imgUrl);

    @SqlUpdate("delete from product_reviews where id = :id")
    void deleteProductReview(@Bind("id") int id);

    @SqlUpdate("delete from material_products_details where productId = :productId")
    void deleteMaterialProductDetails(@Bind("productId") int productId);

    @SqlUpdate("insert into material_products_details(materialId, productId, updatedAt) values(:materialId, :productId, NOW())")
    boolean insertMaterialProductDetails(@Bind("materialId") int materialId, @Bind("productId") int productId);

    @SqlUpdate("delete from product_prices where id = :id")
    void deleteProductPrice(@Bind("id") int id);

    @SqlUpdate("update product_prices set width = :width, height = :height, price = :price, available = :available where id = :id")
    void updateProductPrice(@Bind("width") int width, @Bind("height") int height, @Bind("price") double price, @Bind("available") int available, @Bind("id") int id);

    @SqlUpdate("insert into product_prices(productId, width, height, price, available) values(:productId, :width, :height, :price, :available)")
    boolean insertProductPrice(@Bind("productId") int productId, @Bind("width") int width, @Bind("height") int height, @Bind("price") double price, @Bind("available") int available);
}
