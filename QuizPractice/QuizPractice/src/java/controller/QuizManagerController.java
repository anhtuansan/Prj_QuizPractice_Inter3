package controller;

import dal.QuizDAO;
import dal.SubjectDAO;
import dto.QuizDTO;
import dto.SubjectDTO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "QuizManagerController", urlPatterns = {"/quizManager"})
public class QuizManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("/QuizPractice");
            return;
        }

        String subjectName = request.getParameter("subjectName");
        String quizName = request.getParameter("quizName");

        int currentPage = 1;
        int recordsPerPage = 5;
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }

        try {
            QuizDAO quizDAO = QuizDAO.getInstance();
            List<QuizDTO> quizzes = quizDAO.searchQuizzes(subjectName, quizName, currentPage, recordsPerPage);
            int totalRecords = quizDAO.getTotalRecords(subjectName, quizName);
            int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

            SubjectDAO subjectDAO = SubjectDAO.getInstance();
            List<dto.Subject> subjects = subjectDAO.getAllSubjects();

            request.setAttribute("quizzes", quizzes);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("subjects", subjects);

            request.setAttribute("subjectName", subjectName);
            request.setAttribute("quizName", quizName);

            request.getRequestDispatcher("/QuizManager.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Database access error.", e);
        }
    }
}
