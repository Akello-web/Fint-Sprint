package tasks.bitlab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tasks.bitlab.db.DBConnection;
import tasks.bitlab.db.News;
import tasks.bitlab.db.User;

import java.io.IOException;

@WebServlet(value = "/add-page_news")
public class AddNewsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser!=null){
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            News news = new News();
            news.setTitle(title);
            news.setContent(content);
            news.setUser(currentUser);

            DBConnection.addNews(news);
            response.sendRedirect("/news");
        }else {
            response.sendRedirect("/login");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser!=null){
            request.getRequestDispatcher("/addNews.jsp").forward(request, response);
        }else {
            response.sendRedirect("/login");
        }
    }
}
