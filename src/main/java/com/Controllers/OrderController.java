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

import java.util.HashMap;
import java.util.List;

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
        if (path.startsWith("/order/submit")) {
            HttpSession session = request.getSession();
            if (session.getAttribute("checkOrder") != null) {
                HashMap<String, Integer> hash = (HashMap<String, Integer>) session.getAttribute("mapOrder");
                String tableID = session.getAttribute("tableID").toString();
                String orderID = session.getAttribute("orderID").toString();
                OrderDAO orderdao = new OrderDAO();
                if (session.getAttribute("checkOrder") == null) {
                    response.sendRedirect("/home");
                    return;
                }
                for (String foodID : hash.keySet()) {
                    orderdao.addNewOrder(new OrderModel(orderID, hash.get(foodID), tableID, foodID));
                }
                double totalPrice = orderdao.getTotalPrice(orderID);
                MakePaymentDAO mpdao = new MakePaymentDAO();
                Employee emp = (Employee) session.getAttribute("employee");
                List<OrderModel> ListOrder = orderdao.getOrder(orderID);
                session.setAttribute("ListOrder", ListOrder);
                String paymentID = "PM" + orderID;
                mpdao.addNewMakePM(new MakePayment(paymentID, totalPrice, "false", emp.getEmp_ID(), tableID));
                MakePayment makePayment = mpdao.getPaymentID(paymentID);
                session.setAttribute("makepayment", makePayment);
            }
            request.getRequestDispatcher("/payment.jsp").forward(request, response);
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
        if (request.getParameter("btnOrder1") != null) {
            String orderString = request.getParameter("bind-value");
            orderString = orderString.substring(1);
            HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
            String parts[] = orderString.split("/");
            String tableID = request.getParameter("tableID");
            String orderID;
            Random generator = new Random();
            orderID = "OD" + generator.nextInt();
            OrderDAO orderdao = new OrderDAO();
            for (String part : parts) {
                String orderData[] = part.split(",");
                String OrderFoodID = orderData[0].trim();
                int OrderFoodAmount = Integer.parseInt(orderData[1].trim());
                hashMap.put(OrderFoodID, OrderFoodAmount);
            }
            session.setAttribute("checkOrder", true);
            session.setAttribute("mapOrder", hashMap);
            session.setAttribute("orderID", orderID);
            session.setAttribute("tableID", tableID);
            session.setAttribute("checkOrder", true);
            response.sendRedirect("/order/submit");

        }
        if (request.getParameter("btnPay") != null) {
            session.setAttribute("checkOrder", null);
            request.getRequestDispatcher("/completedOrder.jsp").forward(request, response);
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
