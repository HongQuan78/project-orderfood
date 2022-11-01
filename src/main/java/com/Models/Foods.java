
package com.Models;

/**
 *
 * @author vhqua
 */
public class Foods {
    private String Food_ID;
    private String Food_name;
    private double Price;
    private String F_Status;
    private String URL_img;
    private String Category_ID;

    public Foods(String Food_ID, String Food_name, double Price, String F_Status, String URL_img, String Category_ID) {
        this.Food_ID = Food_ID;
        this.Food_name = Food_name;
        this.Price = Price;
        this.F_Status = F_Status;
        this.URL_img = URL_img;
        this.Category_ID = Category_ID;
    }


    public String getFood_ID() {
        return Food_ID;
    }

    public void setFood_ID(String Food_ID) {
        this.Food_ID = Food_ID;
    }

    public String getFood_name() {
        return Food_name;
    }

    public void setFood_name(String Food_name) {
        this.Food_name = Food_name;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public String getF_Status() {
        return F_Status;
    }

    public void setF_Status(String F_Status) {
        this.F_Status = F_Status;
    }

    public String getURL_img() {
        return URL_img;
    }

    public void setURL_img(String URL_img) {
        this.URL_img = URL_img;
    }

    public String getCategory_ID() {
        return Category_ID;
    }

    public void setCategory_ID(String Category_ID) {
        this.Category_ID = Category_ID;
    }
       
}
