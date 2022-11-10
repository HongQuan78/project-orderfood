package com.DAOS;

import com.DBConnection.DBConnection;
import com.Models.Employee;

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
public class EmployeeDAO {

    private Connection connection = null;

    public EmployeeDAO() {
        connection = DBConnection.getConnection();
    }

    public List<Employee> getAll() {
        ResultSet rs = null;
        Statement st;
        List<Employee> list = new ArrayList<>();
        try {
            String query = "select * from employee";
            st = connection.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                list.add(new Employee(rs.getString("Emp_ID"), rs.getString("Emp_name"), rs.getDate("Emp_birthday"), rs.getString("Emp_gender"), rs.getString("Emp_phone"), rs.getString("Emp_address"), rs.getString("Emp_role"), rs.getString("Username"), rs.getString("Password")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public Employee getAccountInfor(String username, String password) {
        Employee emp = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            String query = "SELECT * FROM `employee` WHERE Username = ? and Password = ? ";
            pst = connection.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password);
            rs = pst.executeQuery();
            while (rs.next()) {
                emp = new Employee(rs.getString("Emp_ID"), rs.getString("Emp_name"), rs.getDate("Emp_birthday"), rs.getString("Emp_gender"), rs.getString("Emp_phone"), rs.getString("Emp_address"), rs.getString("Emp_role"), rs.getString("Username"), rs.getString("Password"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return emp;
    }

    public int addNew(Employee employee) throws SQLException {
        int count = 0;
        String query = "Insert into employee values (?,?,?,?,?,?,?,?,?)";
        PreparedStatement pst = connection.prepareStatement(query);
        pst.setString(1, employee.getEmp_ID());
        pst.setString(2, employee.getEmp_name());
        pst.setDate(3, employee.getEmp_birthday());
        pst.setString(4, employee.getEmp_gender());
        pst.setString(5, employee.getEmp_phone());
        pst.setString(6, employee.getEmp_address());
        pst.setString(7, employee.getEmp_role());
        pst.setString(8, employee.getUsername());
        pst.setString(9, employee.getPassword());
        count = pst.executeUpdate();
        return count;
    }

    public int delete(String Emp_ID) {
        int count = 0;
        try {
            String query = "DELETE FROM employee WHERE employee.Emp_ID = ?";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, Emp_ID);
            count = pst.executeUpdate();
            System.out.println(count);
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int update(Employee employee) {
        int count = 0;
        try {
            String query = "UPDATE `employee` SET `Emp_name` = ?, `Emp_birthday` = ?, `Emp_address` = ?, `Emp_role` = ?, `Password` = ? WHERE `employee`.`Emp_ID` = ?";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, employee.getEmp_name());
            pst.setDate(2, employee.getEmp_birthday());
            pst.setString(3, employee.getEmp_address());
            pst.setString(4, employee.getEmp_role());
            pst.setString(5, employee.getPassword());
            pst.setString(6, employee.getEmp_ID());
            count = pst.executeUpdate();
            System.out.println(count);
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public Employee getEmp(String id) {
        Employee emp = null;
        try {
            String query = "select * from employee where Emp_ID = ?";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                emp = new Employee(rs.getString("Emp_ID"), rs.getString("Emp_name"), rs.getDate("Emp_birthday"), rs.getString("Emp_gender"), rs.getString("Emp_phone"), rs.getString("Emp_address"), rs.getString("Emp_role"), rs.getString("Username"), rs.getString("Password"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emp;
    }
}
