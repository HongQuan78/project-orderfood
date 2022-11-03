/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controllers;

import com.DAOS.TableDAO;
import com.Models.Table;
import java.io.IOException;
import java.io.PrintWriter;
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
public class TableController extends HttpServlet {

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
        if(path.startsWith("/table/admin/change/")){
        
        }
        
        if (path.startsWith("/table/booking")) {
            TableDAO tableDAO = new TableDAO();
            List<Table> list = tableDAO.getAllTable();
            request.setAttribute("list", list);
            request.getRequestDispatcher("/tablebooking.jsp").forward(request, response);
        }
        
        if (path.startsWith("/table/change/")) {
            String[] s = path.split("/");
            String id = s[s.length - 1];
            TableDAO tableDAO = new TableDAO();
            Table t = tableDAO.getTable(id);
            tableDAO.setTableStatus(id, t.getT_Status().equals("true") ? "false" : "true");
            HttpSession session = request.getSession();
            if (t.getT_Status().equals("true")) {
                session.setAttribute("tableID", id);
                response.sendRedirect("/food/list");
                return;
            }
            session.setAttribute("tableID", null);
            response.sendRedirect("/table/booking");
//            response.sendRedirect("/table/booking");

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
