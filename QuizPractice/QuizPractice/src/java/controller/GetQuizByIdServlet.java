package controller;

import dal.QuizDAO;
import dto.QuizDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "GetQuizByIdServlet", urlPatterns = {"/getQuizById"})
public class GetQuizByIdServlet extends HttpServlet {

    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        QuizDAO quizDAO = QuizDAO.getInstance();
        try {
            QuizDTO quiz = quizDAO.getQuizById(id);
            if (quiz != null) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write(gson.toJson(quiz));
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Quiz not found.");
            }
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }
}
