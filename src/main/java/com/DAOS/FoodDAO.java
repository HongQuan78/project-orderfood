/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAOS;

import com.DBConnection.DBConnection;
import com.Models.Foods;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vhqua
 */
public class FoodDAO {

    private Connection connection = null;

    public FoodDAO() {
        connection = DBConnection.getConnection();
    }

    public List<Foods> getAllFood() {
        List<Foods> list = new ArrayList<>();
        try {
            Statement st = null;
            ResultSet rs = null;
            String query = "select * from `foods`";
            st = connection.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                Foods f = new Foods(rs.getString("Food_ID"), rs.getString("Food_name"), rs.getDouble("Price"), rs.getString("F_Status"), rs.getString("URL_img"), rs.getString("Category_ID"));
                list.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Foods> getFoodInCategory(String category_id) {
        List<Foods> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM foods WHERE foods.Category_ID = ?";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, category_id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Foods f = new Foods(rs.getString("Food_ID"), rs.getString("Food_name"), rs.getDouble("Price"), rs.getString("F_Status"), rs.getString("URL_img"), rs.getString("Category_ID"));
                list.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int setFoodStatus(String food_ID, String status) {
        int count = 0;
        try {
            PreparedStatement pst = null;
            String query = "UPDATE foods SET F_Status = ? WHERE Food_ID = ?";
            pst = connection.prepareStatement(query);
            pst.setString(1, status);
            pst.setString(2, food_ID);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int deleteFood(String food_ID) {
        int count = 0;
        try {
            PreparedStatement pst = null;
            String query = "DELETE FROM foods WHERE Food_ID = ?";
            pst = connection.prepareStatement(query);
            pst.setString(1, food_ID);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int addNewFood(Foods food) {
        int count = 0;
        try {
            String query = "Insert into foods values (?,?,?,?,?,?)";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, food.getFood_ID());
            pst.setString(2, food.getFood_name());
            pst.setDouble(3, food.getPrice());
            pst.setString(4, food.getF_Status());
            pst.setString(5, food.getURL_img());
            pst.setString(6, food.getCategory_ID());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int updateFood(Foods food) {
        int count = 0;
        try {
            String query = "UPDATE `foods` SET `Food_name` = ?, `Price` = ?, `F_Status` = ?, `URL_img` = ?, `Category_ID` = ? WHERE `foods`.`Food_ID` = ?";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, food.getFood_name());
            pst.setDouble(2, food.getPrice());
            pst.setString(3, food.getF_Status());
            pst.setString(4, food.getURL_img());
            pst.setString(5, food.getCategory_ID());
            pst.setString(6, food.getFood_ID());
            count = pst.executeUpdate();
            System.out.println(count);
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public double getFoodPrice(String foodID) {
        double price = 0;
        try {
            String query = "SELECT Price FROM foods WHERE Food_ID = ?";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, foodID);
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                price = resultSet.getDouble("Price");
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return price;
    }

    public String getFoodName(String foodID) {
        String name = null;
        try {
            String query = "SELECT foods.Food_name from foods WHERE Food_ID = ?";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, foodID);
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                name = resultSet.getString("Food_name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }

}
