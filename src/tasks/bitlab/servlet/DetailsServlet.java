package tasks.bitlab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tasks.bitlab.db.Author;
import tasks.bitlab.db.Book;
import tasks.bitlab.db.DBConnection;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = -1;
        try {
            id = Integer.parseInt(req.getParameter("book_id"));//присвоил айди
        }catch (Exception e){
        }

        Book book = DBConnection.getBook(id);//Нашел с базы подходящую книгу по айди
        req.setAttribute("kniga", book);//записал под ключ

        ArrayList<Author> authors = DBConnection.getAuthors();
        req.setAttribute("avtorlar", authors);
        req.getRequestDispatcher("/details.jsp").forward(req, resp);//перенаправил на сайт
    }
}
