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

@WebServlet(name = "EditQuizServlet", urlPatterns = {"/editQuiz"})
public class EditQuizServlet extends HttpServlet {

    private final Gson gson = new Gson();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("quizName");
        String level = request.getParameter("level");
        int numberQuestion = Integer.parseInt(request.getParameter("numberQuestion"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));

        QuizDTO quiz = new QuizDTO(id, name, null, level, numberQuestion, duration);
        quiz.setSubjectId(subjectId);

        QuizDAO quizDAO = QuizDAO.getInstance();
        try {
            boolean success = quizDAO.updateQuiz(quiz);
            if (success) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write(gson.toJson(new ResponseMessage("Quiz updated successfully")));
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update quiz.");
            }
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }

    private static class ResponseMessage {
        private final String message;

        public ResponseMessage(String message) {
            this.message = message;
        }

        public String getMessage() {
            return message;
        }
    }
}
