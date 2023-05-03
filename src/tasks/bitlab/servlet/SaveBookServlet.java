package tasks.bitlab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tasks.bitlab.db.Author;
import tasks.bitlab.db.Book;
import tasks.bitlab.db.DBConnection;
import tasks.bitlab.db.User;

import java.io.IOException;

@WebServlet(value = "/save-book")
public class SaveBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("currentUser");
        if(user!=null) {
            int id = Integer.parseInt(request.getParameter("book_id"));
            String name = request.getParameter("book_name");
            int authorId = Integer.parseInt(request.getParameter("book_author"));
            String genre = request.getParameter("book_genre");
            double price = Double.parseDouble(request.getParameter("book_price"));
            String description = request.getParameter("book_description");

            Book book = DBConnection.getBook(id);
            Author author = DBConnection.getAuthor(authorId);
            if (book != null && author != null) {
                book.setName(name);
                book.setGenre(genre);
                book.setPrice(price);
                book.setAuthor(author);
                book.setDescription(description);

                DBConnection.updateBook(book);
                response.sendRedirect("/details?book_id=" + id);
            } else {
                response.sendRedirect("/");
            }
        }else {
            response.sendRedirect("/login");
        }
    }
}
