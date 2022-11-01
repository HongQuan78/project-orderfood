/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controllers;

import com.DAOS.EmployeeDAO;
import com.DAOS.FoodDAO;
import com.DAOS.MakePaymentDAO;
import com.DAOS.OrderDAO;
import com.Models.Employee;
import com.Models.Foods;
import com.Models.MakePayment;
import com.Models.OrderModel;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author vhqua
 */
public class AdminController extends HttpServlet {

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
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("/home");
            return;
        } else if (path.endsWith("/admin") || path.endsWith("/admin/employeemanager")) {
            EmployeeDAO empDAO = new EmployeeDAO();
            List<Employee> listEmp = empDAO.getAll();
            request.setAttribute("listEmp", listEmp);
            request.getRequestDispatcher("/employeemanager.jsp").forward(request, response);
        } else if (path.endsWith("/admin/foodmanager")) {
            FoodDAO foodDAO = new FoodDAO();
            List<Foods> list = foodDAO.getAllFood();
            request.setAttribute("listFood", list);
            request.getRequestDispatcher("/foodmanager.jsp").forward(request, response);
        } else if (path.endsWith("/admin/report")) {
            MakePaymentDAO mpdao = new MakePaymentDAO();
            List<MakePayment> mp = mpdao.getAllMakePM();
            request.setAttribute("list", mp);
            request.getRequestDispatcher("/report.jsp").forward(request, response);
        } else if (path.startsWith("/admin/paymentdetail/")) {
            String[] s = path.split("/");
            String id = s[s.length - 1];
            OrderDAO ordao = new OrderDAO();
            List<OrderModel> list = ordao.getOrder(id.substring(2));
            request.setAttribute("id", id.substring(2));
            request.setAttribute("list", list);
            request.getRequestDispatcher("/report_detail.jsp").forward(request, response);
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

//       
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
