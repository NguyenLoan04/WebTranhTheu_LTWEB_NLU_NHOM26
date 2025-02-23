package com.example.webtranhtheu_ltweb_nlu_nhom26.db;

import java.util.List;

public class DatabaseLogger {
    public static void logQuery(Object result, String title) {
        printLog(title);
        printLogDetail(result);
    }

    //FIXME: Facade Pattern
    private static void printLog(String title) {
        System.out.println("--------------------------");
        System.out.println(title);
    }

    private static void printLogDetail(Object result) {
        if (result instanceof List<?> listResult) {
            for (Object o : listResult) {
                System.out.println(o);
            }
        }
        else System.out.println(result);
        System.out.println("\n--------------------------");
    }
}
