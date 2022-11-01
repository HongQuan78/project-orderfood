package com.DAOS;

import com.DBConnection.DBConnection;
import com.Models.OrderModel;
import com.mysql.cj.protocol.x.ReusableOutputStream;
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
public class OrderDAO {

    private Connection connection = null;

    public OrderDAO() {
        connection = DBConnection.getConnection();
    }

    public List<OrderModel> getAllOrder() {
        List<OrderModel> list = new ArrayList<>();
        try {
            Statement st = null;
            ResultSet rs = null;
            String query = "select * from `order_detail`";
            st = connection.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                list.add(new OrderModel(rs.getString("Order_ID"), rs.getInt("Quantity"), rs.getString("Table_ID"), rs.getString("Food_ID")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getNumberOfOrder() {
        try {
            Statement st = null;
            ResultSet rs = null;
            String query = "SELECT COUNT(Order_ID) as 's' FROM `order_detail`";
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

    public int deleteOrder(String orderID) {
        int count = 0;
        try {
            PreparedStatement pst = null;
            String query = "DELETE FROM `order_detail` WHERE `order_detail`.`Order_ID` = ?";
            pst = connection.prepareStatement(query);
            pst.setString(1, orderID);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int addNewOrder(OrderModel order) {
        int count = 0;
        try {
            String query = "Insert into `order_detail` values (?,?,?,?)";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, order.getOrder_ID());
            pst.setInt(2, order.getQuantity());
            pst.setString(3, order.getTable_ID());
            pst.setString(4, order.getFood_ID());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int getOrderToCalPM(String orderID, String foodID) {
        int amount = 0;
        try {
            String query = "SELECT Quantity, foods.Food_ID from order_detail join foods on foods.Food_ID = order_detail.Food_ID\n"
                    + "WHERE Order_ID = ? AND foods.Food_ID = ?";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, orderID);
            pst.setString(2, foodID);
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                amount = resultSet.getInt("Quantity");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return amount;
    }

    public List<OrderModel> getOrder(String orderID) {
        List<OrderModel> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            String query = "select * from `order_detail` where Order_ID = ?";
            PreparedStatement pst = connection.prepareCall(query);
            pst.setString(1, orderID);
            rs = pst.executeQuery();
            while (rs.next()) {
                list.add(new OrderModel(rs.getString("Order_ID"), rs.getInt("Quantity"), rs.getString("Table_ID"), rs.getString("Food_ID")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public double getTotalPrice(String orderID) {
        OrderDAO or = new OrderDAO();
        FoodDAO fdao = new FoodDAO();
        List<OrderModel> list = new ArrayList<>();
        list = or.getOrder(orderID);
        double totalPrice = 0;
        for (OrderModel orderModel : list) {
            totalPrice += fdao.getFoodPrice(orderModel.getFood_ID())
                    * or.getOrderToCalPM(orderModel.getOrder_ID(), orderModel.getFood_ID());
        }
        return totalPrice;
    }
}
