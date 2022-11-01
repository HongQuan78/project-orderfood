/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAOS;

import com.DBConnection.DBConnection;
import com.Models.Category;
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
public class CategoryDAO {

    private Connection connection = null;

    public CategoryDAO() {
        connection = DBConnection.getConnection();
    }

    public List<Category> getAllCate() {
        List<Category> list = new ArrayList<>();
        try {
            Statement st = null;
            ResultSet rs = null;
            String query = "select * from `category`";
            st = connection.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                list.add(new Category(rs.getString("Category_ID"), rs.getString("Category_Name")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int deleteCate(String categoryID) {
        int count = 0;
        try {
            PreparedStatement pst = null;
            String query = "DELETE FROM `category` WHERE `category`.`Category_ID` = ?";
            pst = connection.prepareStatement(query);
            pst.setString(1, categoryID);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int addNewCate(Category cate) {
        int count = 0;
        try {
            String query = "Insert into `category` values (?,?)";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, cate.getCategory_ID());
            pst.setString(2, cate.getCategory_Name());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

}
