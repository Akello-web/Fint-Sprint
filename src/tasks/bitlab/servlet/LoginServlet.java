package tasks.bitlab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tasks.bitlab.db.DBConnection;
import tasks.bitlab.db.User;

import java.io.IOException;
@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = DBConnection.getUser(email);
        if (user!=null && user.getPassword().equals(password)){
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            response.sendRedirect("/profile");
        }else {
            response.sendRedirect("/login?error");
        }
    }
}
