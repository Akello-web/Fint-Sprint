package tasks.bitlab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tasks.bitlab.db.Author;
import tasks.bitlab.db.DBConnection;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/add-page_author")
public class AddAuthorPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Author> authors = DBConnection.getAuthors();
        req.setAttribute("avtorlar", authors);
        req.getRequestDispatcher("/addAuthor.jsp").forward(req, resp);
    }
}
