/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Models;

/**
 *
 * @author vhqua
 */
public class Category {

    private String Category_ID;
    private String Category_Name;

    public Category(String Category_ID, String Category_Name) {
        this.Category_ID = Category_ID;
        this.Category_Name = Category_Name;
    }

    public String getCategory_ID() {
        return Category_ID;
    }

    public void setCategory_ID(String Category_ID) {
        this.Category_ID = Category_ID;
    }

    public String getCategory_Name() {
        return Category_Name;
    }

    public void setCategory_Name(String Category_Name) {
        this.Category_Name = Category_Name;
    }

}
