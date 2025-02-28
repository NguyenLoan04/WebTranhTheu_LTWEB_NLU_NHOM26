package com.example.webtranhtheu_ltweb_nlu_nhom26.services;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.admin.OrderDTO;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.order.Order;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.cart.CartProduct;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.order.OrderProduct;
import com.example.webtranhtheu_ltweb_nlu_nhom26.dao.OrderDAO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.db.JDBIConnector;

import java.sql.Timestamp;
import java.util.List;

public class OrderService {
    private static OrderDAO orderDAO = JDBIConnector.getInstance().onDemand(OrderDAO.class);
    public static final int PAYMENT_BY_COD = 0;
    public static final int PAYMENT_BY_BANK = 1;

    public static List<OrderDTO> getListOrderDTO() {
        return orderDAO.getListOrderDTO();
    }

    public static List<Order> getListOrderByUser(int accountId) {
        return orderDAO.getListOrderByUser(accountId);
    }

    public static List<OrderProduct> getListOrderProductByOrderId(int orderId) {
        return orderDAO.getListOrderProductByOrderId(orderId);
    }

    public static List<Order> getListOrderByUserAndStatus(int accountId, int status) {
        return orderDAO.getListOrderByUserAndStatus(accountId, status);
    }

    public Order getOrderById(int accountId, int orderId) {
        return orderDAO.getOrderByIdAndUser(accountId, orderId);
    }

    public boolean updateStatus(int orderId, int status) {
        return orderDAO.updateUserOrderStatus(orderId, status);
    }

    public boolean insertCancelOrder(int orderId, int cancelReason) {
        return orderDAO.insertCancelOrder(orderId, cancelReason);
    }


    public static Order getOrderById(int orderId) {
        Order order = orderDAO.getOrderById(orderId);

        List<OrderProduct> listOrderDetails = orderDAO.getOrderDetailByOrderId(orderId);
        order.setProducts(listOrderDetails);
        return order;
    }

    public static User getUserByOrderId(int orderId) {
        return orderDAO.getUserByOrderId(orderId);
    }

    public static boolean updateOrder(int orderId, int statusOrder, Timestamp deliveredAt) {
        return orderDAO.updateOrderStatus(orderId, statusOrder, deliveredAt);
    }

    public static void deleteCancelReasonOrder(int orderId) {
        orderDAO.deleteCancelReasonByOrderId(orderId);
    }

    public static void insertCancelReasonOrder(int orderId, int reason) {
        orderDAO.insertCancelReasonOrder(orderId, reason);
    }

    public static OrderProduct convertCartToOrder(CartProduct cartProduct, int chosenAmount) {
        OrderProduct orderProduct = new OrderProduct();
        orderProduct.setId(cartProduct.getId());
        orderProduct.setTitle(cartProduct.getTitle());
        orderProduct.setThumbnail(cartProduct.getThumbnailUrl());
        orderProduct.setWidth(cartProduct.getPrice().getWidth());
        orderProduct.setHeight(cartProduct.getPrice().getHeight());
        orderProduct.setPrice(cartProduct.getPrice().getPrice());
        orderProduct.setQuantity(chosenAmount);
        return orderProduct;
    }

    //Thêm hằng số cho class Order
    public static boolean createOrder(int accountId, String address, int method, List<CartProduct> listProduct) {
        int orderId = createNewOrder(accountId, 1, address, 1, 1);
        if (orderId < 0) return false;
        for (CartProduct cartProduct : listProduct) {
            if (!addProductToOrder(orderId, cartProduct.getId(),
                    cartProduct.getQuantity(), cartProduct.getPrice().getPrice(),
                    cartProduct.getPrice().getWidth(), cartProduct.getPrice().getHeight())) return false;
        }
        return true;
    }

    private static int createNewOrder(int accountId, int statusOrder, String shippingAddress, int statusPay, int method) {
        return orderDAO.createNewOrder(accountId, statusOrder, shippingAddress, statusPay, method);
    }

    private static boolean addProductToOrder(int orderId, int productId, int amount, double price, int width, int height) {
        return orderDAO.addDetailToOrder(orderId, productId, amount, price, width, height) > 0;

    }
}
