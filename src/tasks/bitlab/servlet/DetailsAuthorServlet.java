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

@WebServlet(value = "/detailsAuthor")
public class DetailsAuthorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = -1;
        try {
            id = Integer.parseInt(request.getParameter("author_page_id"));//присвоил айди
        }catch (Exception e){
        }

        Author author = DBConnection.getAuthor(id);//Нашел с базы подходящую книгу по айди
        request.setAttribute("totAvtor", author);//записал под ключ

        ArrayList<Author> authors = DBConnection.getAuthors();
        request.setAttribute("avtorlar", authors);
        request.getRequestDispatcher("/detailsAuthor.jsp").forward(request, response);//перенаправил на сайт
    }
}
