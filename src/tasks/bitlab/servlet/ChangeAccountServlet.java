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

@WebServlet(value = "/change_acc")
public class ChangeAccountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if(currentUser!=null) {
            String email = request.getParameter("user_email");
            String fullName = request.getParameter("userName");
            String password = request.getParameter("userPassword");

            User user = DBConnection.getUser(email);
            if (user != null) {
                user.setFullName(fullName);
                user.setPassword(password);

                DBConnection.updateUser(user);
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);//to update session's name
                response.sendRedirect("/profile");
            } else {
                response.sendRedirect("/");
            }
        }
            else {
                response.sendRedirect("/");
            }
        }
    }
