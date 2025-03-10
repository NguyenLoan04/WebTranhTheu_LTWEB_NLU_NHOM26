package com.example.webtranhtheu_ltweb_nlu_nhom26.services;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.Address;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Review;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.WishProduct;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.admin.UserDTO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.dao.UserDAO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import java.sql.Timestamp;
import java.util.List;

public class UserService {
    private static UserDAO userDAO;
    private static UserService instance;
    public static UserService getInstance() {
        if(instance == null) {
            Jdbi jdbi= JDBIConnector.getInstance();
            jdbi.installPlugin(new SqlObjectPlugin());
            userDAO = jdbi.onDemand(UserDAO.class);
            instance = new UserService(userDAO);
            return instance;
        }
        return instance;
    }
    public UserService(UserDAO userDAO) {this.userDAO = userDAO;}
    public UserService() {
        this.userDAO = JDBIConnector.getInstance().onDemand(UserDAO.class);
    }

    //Để tạm thôi
    public String getUsername(int userId) {
        return userDAO.getUsername(userId);
    }

    public List<UserDTO> listUserDTO() {
        return userDAO.getUsersDTO();
    }

    public boolean addUser(User user) {
        return userDAO.insertUser(user);
    }

    public User getUserById(int userId) {
        User user = userDAO.getUser(userId);
        List<Address> location = userDAO.getLocation(userId);
        List<WishProduct> wishProducts = userDAO.getWishProducts(userId);
        user.setLocation(location);
        user.setWishProducts(wishProducts);
        //user.setWishProducts(userDAO.getWishProducts(userId));
        return user;
    }

    public void updateUser(User user, String[] location, String[] deleteLocation) {
        userDAO.updateUser(user);
        if(user.getPassword() != null) {
            userDAO.updatePassword(user.getId(), user.getPassword());
        }

        for (int i = 0; i < deleteLocation.length; i++) {
            userDAO.deleteUserAddress(user.getId(), Integer.parseInt(deleteLocation[i]));
        }

        for (int i = 0; i < location.length; i++) {
            userDAO.insertAddress(location[i]);
            userDAO.insertUserAddress(user.getId(), userDAO.getIdByLocation(location[i]));
        }

//        for(int i = 0; i < addWishProduct.length; i++) {
//            userDAO.insertWishProduct(user.getId(), Integer.parseInt(addWishProduct[i]));
//        }
//
//        for(int i = 0; i < deleteWishProduct.length; i++) {
//            userDAO.deleteWishProduct(user.getId(), Integer.parseInt(deleteWishProduct[i]));
//        }

    }

    public boolean updateAvatar(int id, String url) {
        return userDAO.updateAvatar(id, url);
    }

    // cập nhật trạng thái cho user
    public boolean updateStatus(int userId, int status) {
        return userDAO.updateStatus(userId, status);
    }

    //cập nhật password
    public boolean updatePassword(int userId, String password) {
        return userDAO.updatePassword(userId, password);
    }

    public void updateInfoAdmin(User user) {
        userDAO.updateInfoAdmin(user);
        if(user.getPassword() != null) {
            userDAO.updatePassword(user.getId(), user.getPassword());
        }
    }


    // Danh sách sản phẩm yêu thích
    public List<WishProduct> getWishProducts(int userId) {
        return userDAO.getWishProducts(userId);
    }
    public List<Address> getLocation(int userId) {
        return userDAO.getLocation(userId);
    }

    public boolean updateInfo(User user) {
        return userDAO.updateUser(user);
    }
    public boolean updateAddress(Address address) {
        userDAO.updateAddress(address);
        userDAO.updateUserAddress(address.getId());
        return true;
    }

    public boolean insertAddress(String location){
        return userDAO.insertAddress(location);
    }

    public Integer getIdByLocation(String newAddress) {
        return userDAO.getIdByLocation(newAddress);
    }

    public void insertUserAddress(int id, Integer addressId) {
        userDAO.insertUserAddress(id, addressId);
    }
    public void deleteUserAddress(int accountId, int addressId) {
        userDAO.deleteUserAddress(accountId, addressId);
        userDAO.deleteAddress(addressId);
    }
    public boolean insertWishProduct(int userId, int productId) {
        return userDAO.insertWishProduct(userId, productId);
    }
    public boolean deleteWishProduct(int userId, int productId) {
        return userDAO.deleteWishProduct(userId, productId);
    }
//    public Timestamp getCreatedWishProductTime(int accountId, int productId) {
//        return userDAO.getCreatedAt(accountId, productId);
//    }
    public WishProduct getWishProductByUser(int accountId, int productId) {
        return userDAO.getWishProduct(accountId, productId);
    }
    public List<Review> getReviewByUser(int accountId){
        return userDAO.getReviewByUser(accountId);
    }
    public Review getReviewById(int reviewId) {
        return userDAO.getReviewById(reviewId);
    }
    public boolean updateAvatarUser(int accountId, String avatarUrl) {
        return userDAO.updateAvatarUser(accountId, avatarUrl);
    }
    public boolean updateUserStatus(int accountId, int status) {
        return userDAO.updateUserStatus(accountId, status);
    }

    public String getPassword(String accountName){
        return userDAO.getPassword(accountName);
    }

    //Lấy thông tin địa chỉ theo id
    public String getLocationById(int accountId, int id) {
        if (id == 0) return "Chưa chọn";
        else {
            return userDAO.getAddressLocationById(accountId, id);
        }
    }


}
