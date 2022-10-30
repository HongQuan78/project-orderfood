/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Models;

import java.sql.Date;

/**
 *
 * @author vhqua
 */
public class MakePayment {

    private String Pay_ID;
    private Date Pay_Date;
    private double Price_total;
    private String MP_Status;
    private String Emp_ID;
    private String Table_ID;

    public MakePayment(String Pay_ID, double Price_total, String MP_Status, String Emp_ID, String Table_ID) {
        this.Pay_ID = Pay_ID;
        this.Price_total = Price_total;
        this.MP_Status = MP_Status;
        this.Emp_ID = Emp_ID;
        this.Table_ID = Table_ID;
    }

    public MakePayment(String Pay_ID, Date Pay_Date, double Price_total, String MP_Status, String Emp_ID, String Table_ID) {
        this.Pay_ID = Pay_ID;
        this.Pay_Date = Pay_Date;
        this.Price_total = Price_total;
        this.MP_Status = MP_Status;
        this.Emp_ID = Emp_ID;
        this.Table_ID = Table_ID;
    }

    public String getPay_ID() {
        return Pay_ID;
    }

    public void setPay_ID(String Pay_ID) {
        this.Pay_ID = Pay_ID;
    }

    public Date getPay_Date() {
        return Pay_Date;
    }

    public void setPay_Date(Date Pay_Date) {
        this.Pay_Date = Pay_Date;
    }

    public double getPrice_total() {
        return Price_total;
    }

    public void setPrice_total(double Price_total) {
        this.Price_total = Price_total;
    }

    public String getMP_Status() {
        return MP_Status;
    }

    public void setMP_Status(String MP_Status) {
        this.MP_Status = MP_Status;
    }

    public String getEmp_ID() {
        return Emp_ID;
    }

    public void setEmp_ID(String Emp_ID) {
        this.Emp_ID = Emp_ID;
    }

    public String getTable_ID() {
        return Table_ID;
    }

    public void setTable_ID(String Table_ID) {
        this.Table_ID = Table_ID;
    }

    @Override
    public String toString() {
        return "MakePayment{" + "Pay_ID=" + Pay_ID + ", Pay_Date=" + Pay_Date + ", Price_total=" + Price_total + ", MP_Status=" + MP_Status + ", Emp_ID=" + Emp_ID + ", Table_ID=" + Table_ID + '}';
    }

}
