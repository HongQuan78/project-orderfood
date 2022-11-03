/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controllers;

import com.DAOS.EmployeeDAO;
import com.Models.Employee;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 *
 * @author vhqua
 */
public class EmployeeController extends HttpServlet {

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
        if (path.startsWith("/employee/infor")) {
            request.getRequestDispatcher("/Profile.jsp").forward(request, response);
        }
        if (path.startsWith("/employee/employeemanager/admin/add")) {
            request.getRequestDispatcher("/test.jsp").forward(request, response);
        }
        if (path.startsWith("/employee/employeemanager/admin/update/")) {
            request.setAttribute("update", "update");
            String[] s = path.split("/");
            String id = s[s.length - 1];
            request.getRequestDispatcher("/createAccount.jsp").forward(request, response);
        }
        if (path.startsWith("/employee/employeemanager/admin/delete/")) {
            request.setAttribute("update", "update");
            String[] s = path.split("/");
            String id = s[s.length - 1];
            EmployeeDAO empdao = new EmployeeDAO();
            empdao.delete(id);
            response.sendRedirect("/admin/employeemanager");
        } else {
            response.sendRedirect("/error");
        }
    }

    public Employee getEmp(HttpServletRequest request, HttpServletResponse response) {

        return null;
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
        if (request.getParameter("btn-add") != null) {

        }
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
