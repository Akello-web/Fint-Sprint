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


@WebServlet(value = "/home.html")//если в браузере открыть "/home.html", заработает программа
public class HomeServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String key = request.getParameter("key");
        if(key!=null){
            ArrayList<Book> books = DBConnection.searchBooks("%"+key+"%");
            request.setAttribute("buks", books);
        }else {
            ArrayList<Book> books = DBConnection.getBooks();
            request.setAttribute("buks", books);
        }



        ArrayList<Author> authors = DBConnection.getAuthors();
        request.setAttribute("avtorlar", authors);
        request.getRequestDispatcher("/books.jsp").forward(request, response);
    };
}
