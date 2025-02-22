package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.user.order.order_form;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.cart.Cart;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Price;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.order.OrderProduct;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.DiscountService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.OrderService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.ProductService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.util.ControllerUtil;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddOrderToCartController", value = "/add-order-to-cart")
public class AddOrderToCartController extends HttpServlet {
    public OrderService orderService = new OrderService();
    public ProductService productService = new ProductService();
    public DiscountService discountService = new DiscountService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        JsonObject jsonResult = new JsonObject();
        if(cart == null) {
            cart= Cart.getInstance();
        }
        cart.setDiscountList(discountService.getListDiscountAvailable());
//        cart.setDiscount(cart.getDiscountList().get(0));
        String orderId = request.getParameter("orderId");
        List<OrderProduct> orderProducts= orderService.getListOrderProductByOrderId(Integer.parseInt(orderId));
        for (OrderProduct orderProduct : orderProducts) {
            Product product= productService.getProduct(orderProduct.getId());
            product.setListImageUrls(productService.getListImageUrls(product.getId()));
            product.setListPrices(productService.getProductPrices(product.getId()));
            Price price= product.getSelectedPrice(orderProduct.getWidth(), orderProduct.getHeight());
            cart.addProduct(product,price,orderProduct.getQuantity());
        }
        session.setAttribute("cart",cart);
        jsonResult.addProperty("currentCartLength", cart.getCartSize());
        ControllerUtil.sendAjaxResultSuccess(response, jsonResult, null);
    }
}