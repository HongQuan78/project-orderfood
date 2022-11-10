/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controllers;

import com.DAOS.EmployeeDAO;
import com.Filter.MD5en;
import com.Models.Employee;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vhqua
 */
public class AccountController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        HttpSession session = request.getSession();
        if (path.startsWith("/account/signout")) {
            session.invalidate();
            response.sendRedirect("/home");
        } else {
            response.sendRedirect("/error");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (request.getParameter("btnCreate") != null) {
            Employee emp = getEmployee(request, response);
            EmployeeDAO dao = new EmployeeDAO();
            int count;
            MD5en md5 = new MD5en();
            try {
                emp.setPassword(md5.encrypt(emp.getPassword()));
            } catch (NoSuchAlgorithmException | UnsupportedEncodingException ex) {
                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                count = dao.addNew(emp);
            } catch (SQLException ex) {
                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("error", "Tài khoản đã tồn tại");
                request.getRequestDispatcher("/addemp.jsp").forward(request, response);
                return;
            }
            response.sendRedirect("/admin/employeemanager");
        }

        if (request.getParameter("btnUpdate") != null) {
            Employee emp = getEmployee(request, response);
            EmployeeDAO dao = new EmployeeDAO();
            MD5en md5 = new MD5en();
            try {
                emp.setPassword(md5.encrypt(emp.getPassword()));
            } catch (NoSuchAlgorithmException | UnsupportedEncodingException ex) {
                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
            }
            int count = dao.update(emp);

            if (count > 0) {
                response.sendRedirect("/admin/employeemanager");
                return;
            } else {
                response.sendRedirect("/error");
                return;

            }
        }
    }

    public Employee getEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //viet code getParam vào dây
        String empID = request.getParameter("empID");
        String empName = request.getParameter("empName");
        String emp_birthday = request.getParameter("birthdayDate");
        String emp_gender = request.getParameter("gender");
        String empPhone = request.getParameter("empPhone");
        String address = request.getParameter("address");
        String role = request.getParameter("role");
        String empUsername = request.getParameter("empUsername");
        String empPass = request.getParameter("empPass");
        Employee emp = new Employee(empID, empName, Date.valueOf(emp_birthday), emp_gender, empPhone, address, role, empUsername, empPass);
        return emp;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
