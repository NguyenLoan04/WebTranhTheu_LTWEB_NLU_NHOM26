package com.example.webtranhtheu_ltweb_nlu_nhom26.enums;

public enum PaymentStatus {
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
