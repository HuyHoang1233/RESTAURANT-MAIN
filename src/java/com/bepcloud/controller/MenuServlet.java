package com.bepcloud.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MenuServlet", urlPatterns = { "/menu" })
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // In the future, fetch categories and menu items from DAO
        // request.setAttribute("categories", categoryDAO.getAll());
        // request.setAttribute("menuItems", menuItemDAO.getAll());

        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
