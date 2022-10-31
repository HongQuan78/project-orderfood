/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controllers;

import com.DAOS.FoodDAO;
import com.DAOS.MakePaymentDAO;
import com.DAOS.OrderDAO;
import com.Models.Employee;
import com.Models.MakePayment;
import com.Models.OrderModel;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 *
 * @author vhqua
 */
public class OrderController extends HttpServlet {

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
        if (request.getParameter("btnOrder1") != null) {
            String orderString = request.getParameter("bind-value");
            orderString = orderString.substring(1);
            HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
            // split the String by a comma
            String parts[] = orderString.split("/");
            // iterate the parts and add them to a HashMap
            String tableID = request.getParameter("tableID");
            String orderID;
            Random generator = new Random();
            orderID = "OD" + generator.nextInt();
            OrderDAO orderdao = new OrderDAO();
            for (String part : parts) {
                // split the student data by colon to get the
                // name and roll number
                String orderData[] = part.split(",");
                String OrderFoodID = orderData[0].trim();
                int OrderFoodAmount = Integer.parseInt(orderData[1].trim());
                // Add to map
                hashMap.put(OrderFoodID, OrderFoodAmount);

                for (String foodID : hashMap.keySet()) {
                    orderdao.addNewOrder(new OrderModel(orderID, hashMap.get(foodID), tableID, foodID));
                }
            }
            HttpSession session = request.getSession();
            session.setAttribute("tableID", tableID);
            List<OrderModel> list = orderdao.getOrder(orderID);
            session.setAttribute("ListOrder", list);
            request.getRequestDispatcher("/payment.jsp").forward(request, response);
        }

    }

//        response.sendRedirect("/order/payment");
 

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
