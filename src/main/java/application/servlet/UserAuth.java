package application.servlet;

import dao.impl.*;
import domain.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.IUserService;
import service.exception.UserException;
import service.impl.UserServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet(name="user auth", urlPatterns={"/UserAuth"})
public class UserAuth extends HttpServlet {

    private final IUserService userService = new UserServiceImpl(
            new UserDaoImpl(),
            new QuizDaoImpl(),
            new StrawPollDaoImpl(),
            new KahootDaoImpl(),
            new QuestionTextDaoImpl(),
            new QuestionChoiceDaoImpl()
    );

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String username = req.getParameter("username");

        try {
            userService.createUser(username);
        } catch (UserException ignored) {
        }
        //Liste utilisateur
        List<User> users = userService.getAll();

        // Ajout de la liste dans l'objet request
        req.setAttribute("utilisateurs", users);

        // Redirection vers la page JSP
        req.getRequestDispatcher("index.jsp").forward(req , resp);




    }
}
