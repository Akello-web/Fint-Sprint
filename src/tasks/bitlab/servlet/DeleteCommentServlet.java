package tasks.bitlab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tasks.bitlab.db.DBConnection;
import tasks.bitlab.db.User;

import java.io.IOException;

@WebServlet(value = "/delete-comment")
public class DeleteCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if(currentUser!=null) {
            int id = Integer.parseInt(request.getParameter("comment_id"));
            int news_id = Integer.parseInt(request.getParameter("news_id"));
            DBConnection.deleteComment(id);
            response.sendRedirect("/news-details?id="+news_id);
        }else {
            response.sendRedirect("/login");
        }
    }
}
