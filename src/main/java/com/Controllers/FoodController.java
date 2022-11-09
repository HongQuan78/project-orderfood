/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controllers;

import com.DAOS.CategoryDAO;
import com.DAOS.FoodDAO;
import com.Models.Foods;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author vhqua
 */
public class FoodController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
        if (session.getAttribute("employee") == null) {
            response.sendRedirect("/home");
            return;
        }
        if (path.startsWith("/food/list")) {
            FoodDAO foodDAO = new FoodDAO();
            CategoryDAO cateDAO = new CategoryDAO();
            request.setAttribute("listCate", cateDAO.getAllCate());
            request.getRequestDispatcher("/listfood.jsp").forward(request, response);
        } else if (path.startsWith("/food/admin/")) {
            if (session.getAttribute("admin") == null) {
                response.sendRedirect("/home");
                return;
            }
            if (path.startsWith("/food/admin/add")) {
                session.setAttribute("add_update", null);
                session.setAttribute("FOOD", null);
                request.getRequestDispatcher("/AddNewFood.jsp").forward(request, response);
            } else if (path.startsWith("/food/admin/update/")) {
                String[] s = path.split("/");
                String id = s[s.length - 1];
                FoodDAO dao = new FoodDAO();
                Foods st = dao.getFoodById(id);
                if (st == null) {
                    response.sendRedirect("/food/list");
                } else {
                    session.setAttribute("FOOD", st);
                    session.setAttribute("add_update", "update");
                    request.getRequestDispatcher("/AddNewFood.jsp").forward(request, response);
                }
            } else if (path.startsWith("/food/admin/delete/")) {
                String[] s = path.split("/");
                String id = s[s.length - 1];
                FoodDAO dao = new FoodDAO();
                dao.deleteFood(id);
                response.sendRedirect("/admin/foodmanager");
            } else if (path.startsWith("/food/admin/false-")) {
                String[] s = path.split("-");
                String id = s[s.length - 1];
                FoodDAO dao = new FoodDAO();
                dao.setFoodStatus(id, "false");
                response.sendRedirect("/admin/foodmanager");
            } else if (path.startsWith("/food/admin/true-")) {
                String[] s = path.split("-");
                String id = s[s.length - 1];
                FoodDAO dao = new FoodDAO();
                dao.setFoodStatus(id, "true");
                response.sendRedirect("/admin/foodmanager");
            }
        } else {
            response.sendRedirect("/error");
        }
        // code thêm cái sua xoa o day
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
        String path = request.getRequestURI();
        if (request.getParameter("btnAddNewFood") != null) {
            String Food_ID = request.getParameter("f_id");
            String Food_name = request.getParameter("f_name");
            String Food_Price = request.getParameter("f_price");
            String URL_img = request.getParameter("f_img");
            String Category_ID = request.getParameter("Category_id");
            FoodDAO fdao = new FoodDAO();
            Foods f = new Foods(Food_ID, Food_name, Double.parseDouble(Food_Price), "true", URL_img, Category_ID);
            int check = fdao.addNewFood(f);
            if (check <= 0) {
                request.setAttribute("error", "This ID already exist!");
                response.sendRedirect(path);
                return;
            }
            response.sendRedirect("/admin/foodmanager");
        } else if (request.getParameter("btnUpdate") != null) {
            String Food_ID = request.getParameter("f_id");
            String Food_name = request.getParameter("f_name");
            String Food_Price = request.getParameter("f_price");
            String URL_img = request.getParameter("f_img");
            String Category_ID = request.getParameter("Category_id");
            FoodDAO fdao = new FoodDAO();
            String fstatus = fdao.getFoodStatus(Food_ID);
            Foods food = new Foods(Food_ID, Food_name, Double.parseDouble(Food_Price), fstatus, URL_img, Category_ID);
            int check = fdao.updateFood(food);
            if (check <= 0) {
                request.setAttribute("error", "This ID already exist!");
                response.sendRedirect(path);
                return;
            }
            response.sendRedirect("/admin/foodmanager");
        }
    }

    private void foodPost(String s_redirect, String e_redirect, String type, HttpServletRequest request,
            HttpServletResponse response)
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
