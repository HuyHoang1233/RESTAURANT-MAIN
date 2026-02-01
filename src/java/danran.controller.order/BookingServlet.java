package danran.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/booking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // Handle booking submission
        String branch = request.getParameter("branch");
        String partySize = request.getParameter("partySize");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String notes = request.getParameter("notes");

        // Save booking to database
        // For now, redirect to success page with booking code
        String bookingCode = "BC" + System.currentTimeMillis() % 100000;

        request.setAttribute("bookingCode", bookingCode);
        request.setAttribute("branch", branch);
        request.setAttribute("partySize", partySize);
        request.setAttribute("date", date);
        request.setAttribute("time", time);
        request.setAttribute("fullName", fullName);
        request.setAttribute("phone", phone);
        request.setAttribute("notes", notes);

        request.getRequestDispatcher("/booking-success.jsp").forward(request, response);
    }
}

