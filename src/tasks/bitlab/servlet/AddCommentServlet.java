package tasks.bitlab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tasks.bitlab.db.Comment;
import tasks.bitlab.db.DBConnection;
import tasks.bitlab.db.News;
import tasks.bitlab.db.User;

import java.io.IOException;

@WebServlet(value = "/add-comment")
public class AddCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser!=null){
            String commentText = request.getParameter("comment");
            int newsId = Integer.parseInt(request.getParameter("news_id"));

            News news = DBConnection.getNewsById(newsId);
            if(news != null){
                Comment comment = new Comment();
                comment.setComment(commentText);
                comment.setNews(news);
                comment.setUser(currentUser);

                DBConnection.addComment(comment);
                response.sendRedirect("/news-details?id="+newsId);
            }else {
                response.sendRedirect("/");
            }


        }else {
            response.sendRedirect("/login");
        }
    }
}
