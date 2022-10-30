package com.Models;

import com.DAOS.*;

/**
 *
 * @author vhqua
 */
public class OrderModel {

    private String Order_ID;
    private int quantity;
    private String Table_ID;
    private String Food_ID;

    public OrderModel(String Order_ID, int quantity, String Table_ID, String Food_ID) {
        this.Order_ID = Order_ID;
        this.quantity = quantity;
        this.Table_ID = Table_ID;
        this.Food_ID = Food_ID;
    }

    public String getOrder_ID() {
        return Order_ID;
    }

    public void setOrder_ID(String Order_ID) {
        this.Order_ID = Order_ID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getTable_ID() {
        return Table_ID;
    }

    public void setTable_ID(String Table_ID) {
        this.Table_ID = Table_ID;
    }

    public String getFood_ID() {
        return Food_ID;
    }

    public void setFood_ID(String Food_ID) {
        this.Food_ID = Food_ID;
    }

}
