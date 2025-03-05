package com.example.webtranhtheu_ltweb_nlu_nhom26.dao;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.Address;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Review;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.admin.UserDTO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.AuthDTO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.WishProduct;
import com.example.webtranhtheu_ltweb_nlu_nhom26.dao.mapper.BaseWishProductMapper;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.config.RegisterRowMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.sql.Timestamp;
import java.util.List;

public interface UserDAO {
    @SqlQuery("select fullname from accounts where id = :id")
    String getUsername(@Bind("id") int id);

    @SqlUpdate("INSERT INTO accounts (email, avatar_url, username, fullname, pass, phone, gender, description, statusAccount, createdAt, updatedAt, role) " +
            "VALUES (:email, :avatarUrl, :username, :fullName, :password, :phone, :gender, :description, :statusAccount, :createdAt, :updatedAt, :role)")
    boolean addUser(@BindBean User user);

    @SqlQuery("select id from accounts where email = :email")
    Integer getIdByEmail(@Bind("email") String email);

    @SqlQuery("select email from accounts where id = :id")
    String getEmail(@Bind("id") int id);

    @SqlQuery("select id from accounts where username = :username")
    Integer getId(@Bind("username") String username);

    @SqlQuery("select id from accounts where email = :email and username = :username and statusAccount = 2")
    Integer getIdByEmailAndUsername(@Bind("email") String email, @Bind("username") String username);

    @SqlUpdate("Update accounts set statusAccount = :status where id = :id")
    boolean updateStatus(@Bind("id") int id, @Bind("status") int status);

    @SqlUpdate("Update accounts set pass = :password where id = :id and statusAccount = 2")
    boolean updatePassword(@Bind("id") int id, @Bind("password") String password);

    @SqlQuery("select id, statusAccount, role from accounts where username = :username")
    @RegisterBeanMapper(AuthDTO.class)
    AuthDTO getAuth(@Bind("username") String username);

    @SqlQuery("select id, statusAccount, role from accounts where id = :id")
    @RegisterBeanMapper(AuthDTO.class)
    AuthDTO getAuthById(@Bind("id") int id);

    @SqlQuery("select statusAccount from accounts where id = :id")
    Integer getStatusAccount(@Bind("id") int id);

    @SqlQuery("select pass from accounts where username = :username")
    String getPassword(@Bind("username") String username);


    @SqlQuery("select a.id, a.fullname as fullName, a.username, a.gender, x.numOrderBought, a.createdAt, a.statusAccount from accounts a LEFT JOIN (select accountId, count(id) as numOrderBought from orders GROUP BY accountId) x on a.id = x.accountId")
    @RegisterBeanMapper(UserDTO.class)
    List<UserDTO> getUsersDTO();

    @SqlUpdate("insert into accounts(email, avatar_url, username, fullname, pass, phone, gender, description, statusAccount, createdAt, updatedAt, role) " +
            "values (:email, :avatarUrl, :username, :fullName, :password, :phone, :gender, :description, :statusAccount, :createdAt, :updatedAt, :role)")
    @RegisterBeanMapper(User.class)
    boolean insertUser(@BindBean User user);

    @SqlQuery("select id, avatar_url as avatarUrl, username, fullname as fullName, email, phone, gender, description, statusAccount, role, createdAt, updatedAt from accounts where id = :accountId")
    @RegisterBeanMapper(User.class)
    User getUser(@Bind("accountId") int accountId);

    @SqlQuery("SELECT a.id, a.location FROM account_addresses_details ad join addresses a on ad.addressId = a.id where ad.accountId = :accountId")
    @RegisterBeanMapper(Address.class)
    List<Address> getLocation(@Bind("accountId") int accountId);

    @SqlQuery("select p.id, p.codeProduct, p.title, w.createdAt from wishlist_products w join products p on w.productId = p.id where w.accountId = :accountId")
    @RegisterRowMapper(BaseWishProductMapper.class)
    List<WishProduct> getWishProducts(@Bind("accountId") int accountId);


    @SqlUpdate("UPDATE accounts\n" +
            "SET fullname = :fullName, email = :email, phone = :phone, gender = :gender, description = :description, statusAccount = :statusAccount, updatedAt = :updatedAt, role = :role " +
            "where id = :id")
    @RegisterBeanMapper(User.class)
    boolean updateUser(@BindBean User user);

    @SqlUpdate("UPDATE accounts\n" +
            "SET fullname = :fullName, email = :email, phone = :phone, gender = :gender, updatedAt = :updatedAt where id = :id")
    @RegisterBeanMapper(User.class)
    boolean updateInfoAdmin(@BindBean User user);

    @SqlUpdate("DELETE from addresses where id=:id")
    void deleteAddress(@Bind("id") int id);

    @SqlUpdate("UPDATE accounts set avatar_url = :avatarUrl where id = :id")
    boolean updateAvatar(@Bind("id") int id, @Bind("avatarUrl") String avatarUrl);


    @SqlUpdate("DELETE from account_addresses_details\n" +
            "WHERE accountId = :accountId and addressId = :addressId")
    void deleteUserAddress(@Bind("accountId") int accountId, @Bind("addressId") int addressId);

    @SqlUpdate("insert into addresses(location) values(:location)")
    boolean insertAddress(@Bind("location") String location);

    @SqlUpdate("INSERT INTO account_addresses_details(accountId, addressId, createdAt, updatedAt) values(:accountId, :addressId, NOW(), NOW())")
    boolean insertUserAddress(@Bind("accountId") int accountId, @Bind("addressId") int addressId);

    @SqlQuery("select id from addresses where location = :location limit 1")
    Integer getIdByLocation(@Bind("location") String location);

    @SqlUpdate("insert into wishlist_products(accountId, productId, createdAt) values(:accountId, :productId, NOW())")
    boolean insertWishProduct(@Bind("accountId") int accountId, @Bind("productId") int productId);

//    @SqlUpdate("DELETE FROM wishlist_products where accountId = :accountId and productId = :productId")
//    void deleteWishProduct(@Bind("accountId") int accountId, @Bind("productId") int productId);

    @SqlQuery("select id, email from accounts where statusAccount = 2")
    @RegisterBeanMapper(User.class)
    List<User> getAllUsersEmailValid();


    @SqlUpdate("DELETE FROM wishlist_products where accountId = :accountId and productId = :productId")
    boolean deleteWishProduct(@Bind("accountId") int accountId, @Bind("productId") int productId);

    @SqlQuery("SELECT p.id, p.codeProduct, p.title, w.createdAt from wishlist_products w join products p on w.productId = p.id where w.accountId= :accountId and w.productId= :productId limit 1")
    @RegisterBeanMapper(BaseWishProductMapper.class)
    WishProduct getWishProduct(@Bind("accountId") int accountId, @Bind("productId") int productId);
    @SqlUpdate("UPDATE addresses SET location = :location where id= :id ")
    @RegisterBeanMapper(Address.class)
    boolean updateAddress(@BindBean Address address);

    @SqlUpdate("UPDATE account_addresses_details SET updatedAt = NOW() where addressId= :addressId")
    boolean updateUserAddress(@Bind("addressId") int addressId);

    @SqlQuery(
        "SELECT id,createdAt,rating,productId,content,updatedAt,accountId "+
                "FROM product_reviews where accountId= :accountId "
    )
    @RegisterBeanMapper(Review.class)
    List<Review> getReviewByUser(@Bind("accountId") int accountId);

    @SqlQuery(
            "SELECT id,createdAt,rating,productId,content,updatedAt,accountId "+
                    "FROM product_reviews where id=:reviewId"
    )
    @RegisterBeanMapper(Review.class)
    Review getReviewById(@Bind("reviewId") int reviewId);


    @SqlUpdate(
            "UPDATE accounts\n"+
                    "SET avatar_url = :avatarUrl where id=:accountId"
    )
    boolean updateAvatarUser(@Bind("accountId") int accountId, @Bind("avatarUrl") String avatarUrl);

    @SqlUpdate(
            "UPDATE accounts\n"+
                    "SET statusAccount=:status where id=:accountId "
    )
    boolean updateUserStatus(@Bind("accountId") int accountId, @Bind("status") int status);


    @SqlQuery("""
            select addresses.location
            from addresses
                join account_addresses_details on addresses.id = account_addresses_details.addressId
            where account_addresses_details.accountId = :accountId and addresses.id = :addressId
            """)
    String getAddressLocationById(@Bind("accountId") int accountId, @Bind("addressId") int addressId);

}
