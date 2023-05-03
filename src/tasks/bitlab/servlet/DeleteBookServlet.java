package tasks.bitlab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tasks.bitlab.db.DBConnection;
import tasks.bitlab.db.User;

import java.io.IOException;

@WebServlet(value = "/delete-book")
public class DeleteBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if(currentUser!=null && currentUser.getRole()==1) {
            int id = Integer.parseInt(request.getParameter("id"));
            DBConnection.deleteBook(id);
            response.sendRedirect("/");
        }else {
            response.sendRedirect("/login");
        }
    }
}
