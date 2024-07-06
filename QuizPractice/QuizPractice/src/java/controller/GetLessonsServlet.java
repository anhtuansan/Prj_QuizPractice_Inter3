package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.QuizDAO;
import dto.QuizLessonDTO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GetLessonsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        QuizDAO quizDAO = QuizDAO.getInstance();
        
        List<QuizLessonDTO> lessons = null;
        try {
            lessons = quizDAO.getLessonQuizOfSubject(subjectId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<option value=''>Select Lesson</option>");
        for (QuizLessonDTO lesson : lessons) {
            out.println("<option value='" + lesson.getId() + "'>" + lesson.getName() + "</option>");
        }
        out.close();
    }
}
