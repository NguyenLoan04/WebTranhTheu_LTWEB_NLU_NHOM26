package com.example.webtranhtheu_ltweb_nlu_nhom26.enums;

public enum OrderStatus {
    CANCELED(0),
    PENDING_CONFIRMATION(1),
    WAITING_FOR_PICKUP(2),
    WAITING_FOR_DELIVERY(3),
    DELIVERED(4),
    RECEIVED(5),
    RETURN_REQUESTED(6),
    DEPOSITED(7);

    private final int code;

    OrderStatus(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }
}
