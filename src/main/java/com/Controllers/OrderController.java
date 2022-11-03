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
        HttpSession session = request.getSession();
        String path = request.getRequestURI();
        if (path.startsWith("/order/dec/")) {
            String[] s = path.split("/");
            String id = s[s.length - 1];
            HashMap<String, Integer> hash = (HashMap<String, Integer>) session.getAttribute("hash");
            hash.put(id, hash.get(id) > 0 ? hash.get(id) - 1 : 0);
            if (hash.get(id) == 0) {
                hash.remove(id);
            }
            session.setAttribute("hash", hash);
            response.sendRedirect("/order");
            return;
        }
        if (path.startsWith("/order/inc/")) {
            String[] s = path.split("/");
            String id = s[s.length - 1];
            HashMap<String, Integer> hash = (HashMap<String, Integer>) session.getAttribute("hash");
            hash.put(id, hash.get(id) + 1);
            session.setAttribute("hash", hash);
            response.sendRedirect("/order");
            return;
        }
        if (path.startsWith("/order/del/")) {
            String[] s = path.split("/");
            String id = s[s.length - 1];
            HashMap<String, Integer> hash = (HashMap<String, Integer>) session.getAttribute("hash");
            hash.remove(id);
            session.setAttribute("hash", hash);
            response.sendRedirect("/order");
            return;
        }

        request.getRequestDispatcher("/payment.jsp").forward(request, response);
    }

    public HashMap<String, Integer> getOrderList(String param) {
        HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
        String parts[] = param.split("/");
        for (String part : parts) {
            String orderData[] = part.split(",");
            String OrderFoodID = orderData[0].trim();
            int OrderFoodAmount = Integer.parseInt(orderData[1].trim());
            hashMap.put(OrderFoodID, OrderFoodAmount);
        }
        return hashMap;
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
            if(orderString.isEmpty()){
                response.sendRedirect("/food/list");
                return; 
            }
            HashMap<String, Integer> hashMap = getOrderList(orderString.substring(1));
            session.setAttribute("hash", hashMap);
            session.setAttribute("checkOrder", true);
            response.sendRedirect("/order");
        }
        if (request.getParameter("btnPay") != null) {
            HashMap<String, Integer> hash = (HashMap<String, Integer>) session.getAttribute("hash");
            if (hash.isEmpty()) {
                response.sendRedirect("/home");
                return;
            }
            String tableID = session.getAttribute("tableID").toString();
            Employee emp = (Employee) session.getAttribute("employee");
            Random generator = new Random();
            OrderDAO orderdao = new OrderDAO();
            MakePaymentDAO mpdao = new MakePaymentDAO();
            String orderID = "OD" + generator.nextInt();
            for (String foodID : hash.keySet()) {
                orderdao.addNewOrder(new OrderModel(orderID, hash.get(foodID), tableID, foodID));
            }
            double totalPrice = orderdao.getTotalPrice(orderID);
            String paymentID = "PM" + orderID;
            mpdao.addNewMakePM(new MakePayment(paymentID, totalPrice, "false", emp.getEmp_ID(), tableID));
            session.setAttribute("checkOrder", null);
            session.setAttribute("hash", null);
            session.setAttribute("tableID", null);
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
