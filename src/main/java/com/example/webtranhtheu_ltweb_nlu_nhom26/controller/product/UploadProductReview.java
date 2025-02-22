package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.product;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Review;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.ProductService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.UserService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.product.ConcreteProductDetail;
import com.example.webtranhtheu_ltweb_nlu_nhom26.util.ControllerUtil;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "UploadProductReview", value = "/upload-review")
public class UploadProductReview extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        JsonObject jsonResult = new JsonObject();
        try {
            HttpSession session = request.getSession();
            int userSessionId = (int) session.getAttribute("accountId");
//            int validateUserId = Integer.parseInt(request.getParameter("account"));
//            System.out.println(validateUserId);
//            if (validateUserId != userSessionId) {
//                jsonResult.addProperty("result", false);
//            }
//            else {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String content = request.getParameter("content");

            System.out.println("Review detail: " + new ConcreteProductDetail().isUserCanReview(userSessionId, productId));
            if (!new ConcreteProductDetail().isUserCanReview(userSessionId, productId)) {
                ControllerUtil.sendAjaxResultFalse(response, jsonResult, null);
            } else {
                Timestamp currentTime = new Timestamp(System.currentTimeMillis());
                Review newReview = new Review(productId, userSessionId, rating, content, currentTime, currentTime);
                boolean insertResult = new ConcreteProductDetail().uploadReview(newReview);
                System.out.println("Insert detail: " + insertResult);
                jsonResult.addProperty("currentAvgRating", ProductService.getProductRating(productId));
                jsonResult.addProperty("result", insertResult);

                JsonObject newReviewJson = new JsonObject();
                newReviewJson.addProperty("username", new UserService().getUsername(newReview.getAccountId())); //Một hàm nào đó sẽ viết trong service sau
                newReviewJson.addProperty("rating", newReview.getRating());
                newReviewJson.addProperty("content", newReview.getContent());
                newReviewJson.addProperty("reviewTime", newReview.getCreatedAt().toString());

                jsonResult.add("reviewData", newReviewJson);
                response.getWriter().write(jsonResult.toString());
            }
//            }

        } catch (Exception e) {
            e.printStackTrace();
            ControllerUtil.sendAjaxResultFalse(response, jsonResult, null);
        }

    }
}