package controller;

import dal.PracticeDAO;

import dal.QuestionsDAO;
import dto.DimensionDTO;
import dto.SubjectPracticeDTO;
import model.Practice;
import model.Question;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "NewPracticeController", urlPatterns = {"/newPractice"})
public class NewPracticeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PracticeDAO practiceDAO = PracticeDAO.getInstance();

       List<DimensionDTO> listDimension = practiceDAO.getListDimension();
        List<SubjectPracticeDTO> listSubject = practiceDAO.getListSubject();

        request.setAttribute("listDimension", listDimension);
        request.setAttribute("listSubject", listSubject);

        // Forward the request to newPractice.jsp
        request.getRequestDispatcher("newPractice.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String dimension = request.getParameter("dimension");
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        String lessonName = request.getParameter("lessonName"); 
        int numQuestions = Integer.parseInt(request.getParameter("questions"));
        int duration = Integer.parseInt(request.getParameter("duration"));

        PracticeDAO practiceDAO = PracticeDAO.getInstance();
        QuestionsDAO questionDAO = QuestionsDAO.getInstance();

        try {
            Practice practice = new Practice();
            practice.setUserId(user.getUserId());
            practice.setSubjectId(subjectId);
            practice.setLessonName(lessonName.equals("All") ? "All" : lessonName);
            practice.setNumberQuestion(numQuestions);
            practice.setDuration(duration);

            int practiceId = practiceDAO.createPractice(practice);

            List<Question> questions;
            if (lessonName.equals("All")) {
                questions = questionDAO.getQuestionsBySubject(subjectId);
            } else {
                questions = questionDAO.getQuestionsByLessonName(lessonName);
            }

            Collections.shuffle(questions);
            List<Question> selectedQuestions = questions.subList(0, Math.min(numQuestions, questions.size()));

            for (Question question : selectedQuestions) {
                practiceDAO.addQuestionToPractice(practiceId, question.getId());
            }

            // Redirect to the practice page or another appropriate page
            response.sendRedirect("practice?id=" + practiceId);
        } catch (SQLException e) {
            throw new ServletException("Database access error.", e);
        }
    }
}
