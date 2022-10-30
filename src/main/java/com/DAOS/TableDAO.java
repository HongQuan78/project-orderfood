/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAOS;

import com.DBConnection.DBConnection;
import com.Models.Table;
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
public class TableDAO {

    private Connection connection = null;

    public TableDAO() {
        connection = DBConnection.getConnection();
    }

    public List<Table> getAllTable() {
        List<Table> list = new ArrayList<>();
        try {
            Statement st = null;
            ResultSet rs = null;
            String query = "select * from `table`";
            st = connection.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                list.add(new Table(rs.getString("Table_ID"), rs.getString("T_Status")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getNumberOfTable() {
        try {
            Statement st = null;
            ResultSet rs = null;
            String query = "SELECT COUNT(Table_ID) as 's' FROM `table`";
            st = connection.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                return rs.getInt("s");
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int setTableStatus(String TableID, String status) {
        int count = 0;
        try {
            PreparedStatement pst = null;
            String query = "UPDATE `table` SET `T_Status` = ? WHERE `table`.`Table_ID` = ?";
            pst = connection.prepareStatement(query);
            pst.setString(1, status);
            pst.setString(2, TableID);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int deleteTable(String TableID) {
        int count = 0;
        try {
            PreparedStatement pst = null;
            String query = "DELETE FROM `table` WHERE `table`.`Table_ID` = ?";
            pst = connection.prepareStatement(query);
            pst.setString(1, TableID);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int addNewTable(Table table) {
        int count = 0;
        try {
            String query = "Insert into `table` values (?,?)";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, table.getTable_ID());
            pst.setString(2, table.getT_Status());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

}
