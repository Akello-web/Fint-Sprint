package tasks.bitlab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tasks.bitlab.db.Comment;
import tasks.bitlab.db.DBConnection;
import tasks.bitlab.db.News;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/news-details")
public class NewsDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        News news = DBConnection.getNewsById(id);
        request.setAttribute("news", news);

        if(news!=null) {
            ArrayList<Comment> comments = DBConnection.getComment(news.getId());
            request.setAttribute("comments", comments);
        }
        request.getRequestDispatcher("/newsdetails.jsp").forward(request, response);
    }
}
