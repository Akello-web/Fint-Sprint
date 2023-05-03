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

@WebServlet(value = "/save-author")
public class SaveAuthorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("currentUser");
        if(user!=null) {

            int id = Integer.parseInt(request.getParameter("author_page_id"));
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String description = request.getParameter("author_description");

            Author author = DBConnection.getAuthor(id);
            if (author != null) {
                author.setFirstName(firstName);
                author.setLastName(lastName);
                author.setDescription(description);

                DBConnection.updateAuthor(author);
                response.sendRedirect("/detailsAuthor?author_page_id=" + id);
            } else {
                response.sendRedirect("/");
            }

        }else {
            response.sendRedirect("/login");
        }
    }
}
