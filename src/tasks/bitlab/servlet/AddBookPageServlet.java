package tasks.bitlab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tasks.bitlab.db.Author;
import tasks.bitlab.db.DBConnection;
import tasks.bitlab.db.User;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/add-page_book")
public class AddBookPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if(currentUser!=null){
            if(currentUser.getRole()==1) {
                ArrayList<Author> authors = DBConnection.getAuthors();
                request.setAttribute("avtorlar", authors);
                request.getRequestDispatcher("/addBook.jsp").forward(request, response);
            }else {
                request.getRequestDispatcher("/403.jsp").forward(request, response);
            }
        }else {
            response.sendRedirect("/login");
        }

    }
}
