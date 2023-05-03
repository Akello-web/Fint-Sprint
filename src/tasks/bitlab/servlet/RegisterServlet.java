package tasks.bitlab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tasks.bitlab.db.DBConnection;
import tasks.bitlab.db.User;

import java.io.IOException;

@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String full_name = request.getParameter("full_name");
        String re_password = request.getParameter("re-password");

        User user = DBConnection.getUser(email);
        if(user == null){
            if(password.equals(re_password)){
            User createUser = new User();
            createUser.setEmail(email);
            createUser.setPassword(password);
            createUser.setFullName(full_name);
            createUser.setRole(2);

            DBConnection.addUser(createUser);
            response.sendRedirect("/register?success");
            }else {
            response.sendRedirect("/register?passworderror");}
        }else {
            response.sendRedirect("/register?emailerror");
        }
    }
}
