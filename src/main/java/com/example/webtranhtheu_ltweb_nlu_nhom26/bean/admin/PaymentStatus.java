package com.example.webtranhtheu_ltweb_nlu_nhom26.bean.admin;

public enum PaymentStatus {
    //còn xử lý sau
    PAYMENT_PAID(1),
    PAYMENT_UNPAID(0);

    private final int code;

    PaymentStatus(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }
}
