package com.DAOS;

import com.DBConnection.DBConnection;
import com.Models.MakePayment;
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
public class MakePaymentDAO {

    private Connection connection = null;

    public MakePaymentDAO() {
        connection = DBConnection.getConnection();
    }

    public List<MakePayment> getAllMakePM() {
        List<MakePayment> list = new ArrayList<>();
        try {
            Statement st = null;
            ResultSet rs = null;
            String query = "select * from `make_payments`";
            st = connection.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                list.add(new MakePayment(rs.getString("Pay_ID"),
                        rs.getDate("Pay_date"),
                        rs.getDouble("Price_total"),
                        rs.getString("MP_Status"),
                        rs.getString("Emp_ID"),
                        rs.getString("Table_ID")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getNumberOfMakePM() {
        try {
            Statement st = null;
            ResultSet rs = null;
            String query = "SELECT COUNT(Pay_ID) as 's' FROM `make_payments`";
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

    public int deleteMakePM(String PayID) {
        int count = 0;
        try {
            PreparedStatement pst = null;
            String query = "DELETE FROM `make_payments` WHERE `make_payments`.`Pay_ID` = ?";
            pst = connection.prepareStatement(query);
            pst.setString(1, PayID);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int addNewMakePM(MakePayment makePayment) {
        int count = 0;
        try {
            String query = "Insert into `make_payments` values (?,NOW(),?,?,?,?)";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, makePayment.getPay_ID());
//            pst.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            pst.setDouble(2, makePayment.getPrice_total());
            pst.setString(3, makePayment.getMP_Status());
            pst.setString(4, makePayment.getEmp_ID());
            pst.setString(5, makePayment.getTable_ID());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int setMakePMStatus(String PayID, String status) {
        int count = 0;
        try {
            PreparedStatement pst = null;
            String query = "UPDATE `make_payments` SET `MP_Status` = ? WHERE `make_payments`.`Pay_ID` = ?";
            pst = connection.prepareStatement(query);
            pst.setString(1, status);
            pst.setString(2, PayID);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public MakePayment getPaymentID(String paymentID) {
        MakePayment mp = null;
        try {
            PreparedStatement pst = null;
            String query = "SELECT * FROM `make_payments` WHERE make_payments.Pay_ID = ?";
            pst = connection.prepareStatement(query);
            pst.setString(1, paymentID);
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                mp = new MakePayment(resultSet.getString("Pay_ID"), resultSet.getDate("Pay_date"), resultSet.getDouble("Price_total"), resultSet.getString("MP_Status"), resultSet.getString("Emp_ID"), resultSet.getString("Table_ID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mp;
    }
}
