package controller;

import dal.QuestionDAO;
import dal.QuizQuestionDAO;
import model.Question;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import model.QuestionListDTO;

@WebServlet(name = "GetQuestionByIdController", urlPatterns = {"/getQuestionById"})
public class GetQuestionByIdController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int questionId = Integer.parseInt(request.getParameter("id"));
        QuizQuestionDAO questionDAO = QuizQuestionDAO.getInstance();

        try {
            QuestionListDTO question = questionDAO.getQuestionById(questionId);
            request.setAttribute("question", question);
            request.getRequestDispatcher("/EditQuestionForm.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database access error.", e);
        }
    }
}
