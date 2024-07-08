package dal;

import context.DBContext;
import dto.AnswerDTO;
import dto.QuizDoneDTO;
import dto.QuizLessonDTO;
import dto.QuizSubjectDTO;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lesson;
import model.Question;

public class QuizDAO extends DBContext {

    private static QuizDAO instance;
    private static Object lockPad = new Object();

    private QuizDAO() {
    }

    /**
     * Provides a global point of access to the UserDAO instance. Implements
     * double-checked locking to ensure thread safety.
     *
     * @return the singleton instance of UserDAO
     */
    public static QuizDAO getInstance() {
        if (instance == null) {
            synchronized (lockPad) {
                if (instance == null) {
                    instance = new QuizDAO();
                }
            }
        }
        return instance;
    }

    public List<QuizSubjectDTO> getSubjectsOfExpert(int creatorId) throws SQLException {
        List<QuizSubjectDTO> subjects = new ArrayList<>();
        String sql = "SELECT id, name FROM subjects WHERE creator_id = ?";

        ps = connection.prepareStatement(sql);
        ps.setInt(1, creatorId);
        rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            QuizSubjectDTO subject = new QuizSubjectDTO(id, name);
            subjects.add(subject);
        }

        return subjects;
    }

    public List<QuizLessonDTO> getLessonQuizOfSubject(int subjectId) throws SQLException {
        List<QuizLessonDTO> lessons = new ArrayList<>();
        String sql = "SELECT id, name FROM lessons WHERE id IN (SELECT lesson_id FROM subject_has_lesson WHERE subject_id = ?) AND Type = 'quiz'";

        ps = connection.prepareStatement(sql);
        ps.setInt(1, subjectId);
        rs = ps.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            QuizLessonDTO lesson = new QuizLessonDTO(id, name);
            lessons.add(lesson);
        }

        return lessons;
    }

    public int addNewQuiz(String name, String level, int numberQuestion, int duration, int createdBy, int subjectId, int lessonId) throws SQLException {
        String sql = "INSERT INTO Quizs "
                + "VALUES (?, ?, ?, ?, null, GETDATE(),?,null, null, ?, ?,1)";

        ps = connection.prepareStatement(sql, ps.RETURN_GENERATED_KEYS);
        ps.setString(1, name);
        ps.setString(2, level);
        ps.setInt(3, numberQuestion);
        ps.setInt(4, duration);
        ps.setInt(5, createdBy);
        ps.setInt(6, subjectId);
        ps.setInt(7, lessonId);

        ps.executeUpdate();

        rs = ps.getGeneratedKeys();
        int generatedId = 0;
        if (rs.next()) {
            generatedId = rs.getInt(1);
        }

        return generatedId;
    }

    public void updateLessonQuizId(int lessonId, int quizId) throws SQLException {
        String sql = "UPDATE lessons SET QuizId = ? WHERE id = ?";

        ps = connection.prepareStatement(sql);
        ps.setInt(1, quizId);
        ps.setInt(2, lessonId);

        ps.executeUpdate();
    }

    public int addNewQuestion(String detail, String suggestion) throws SQLException {
        String sql = "INSERT INTO questions VALUES (?, ?, 1, null)";

        ps = connection.prepareStatement(sql, ps.RETURN_GENERATED_KEYS);
        ps.setString(1, detail);
        ps.setString(2, suggestion);

        ps.executeUpdate();

        rs = ps.getGeneratedKeys();
        int generatedId = 0;
        if (rs.next()) {
            generatedId = rs.getInt(1);
        }

        return generatedId;
    }

    public int addNewAnswer(String detail, int creatorId, int isCorrect) throws SQLException {
        String sql = "INSERT INTO answers VALUES (?, GETDATE(), null, ?, ?)";

        ps = connection.prepareStatement(sql, ps.RETURN_GENERATED_KEYS);
        ps.setString(1, detail);
        ps.setInt(2, creatorId);
        ps.setInt(3, isCorrect);

        ps.executeUpdate();

        rs = ps.getGeneratedKeys();
        int generatedId = 0;
        if (rs.next()) {
            generatedId = rs.getInt(1);
        }

        return generatedId;
    }

    public void addAnswerToQuestion(int questionId, int answerId) throws SQLException {
        String sql = "INSERT INTO question_has_answer VALUES (?, ?)";

        ps = connection.prepareStatement(sql);
        ps.setInt(1, questionId);
        ps.setInt(2, answerId);

        ps.executeUpdate();
    }

    public void addQuestionToQuiz(int quizId, int questionId) throws SQLException {
        String sql = "INSERT INTO Quiz_Has_Question VALUES (?, ?)";

        ps = connection.prepareStatement(sql);
        ps.setInt(1, quizId);
        ps.setInt(2, questionId);

        ps.executeUpdate();
    }

    public List<Question> getSearchQuestionByLessonId(int lessonId) throws SQLException {
        List<Question> questions = new ArrayList<>();
        String sql = "SELECT * FROM questions WHERE id IN (SELECT QuestionId FROM Lesson_Has_Question WHERE LessonId = ?)";

        ps = connection.prepareStatement(sql);
        ps.setInt(1, lessonId);
        rs = ps.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            String detail = rs.getString("detail");
            String suggestion = rs.getString("suggestion");
            String status = rs.getInt("status") + "";
            String media = rs.getString("media");

            Question question = new Question(id, detail, suggestion, status, media);
            questions.add(question);
        }

        return questions;
    }

    public List<Question> getSearchQuestionByQuizId(int quizId) throws SQLException {
        List<Question> questions = new ArrayList<>();
        String sql = "select * from questions where id in (select QuestionId from Quiz_Has_Question where QuizId = ?)";

        ps = connection.prepareStatement(sql);
        ps.setInt(1, quizId);
        rs = ps.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            String detail = rs.getString("detail");
            String suggestion = rs.getString("suggestion");
            String status = rs.getInt("status") + "";
            String media = rs.getString("media");

            Question question = new Question(id, detail, suggestion, status, media);
            questions.add(question);
        }

        return questions;
    }

    public void deleteQuestionFromQuiz(int quizId, int questionId) throws SQLException {
        String sql = "DELETE FROM Quiz_Has_Question WHERE QuizId = ? AND QuestionId = ?";

        ps = connection.prepareStatement(sql);
        ps.setInt(1, quizId);
        ps.setInt(2, questionId);

        ps.executeUpdate();
    }

    public List<AnswerDTO> getAnswersByQuestionId(int questionId) throws SQLException {
        List<AnswerDTO> answers = new ArrayList<>();
        String sql = "SELECT id, answer_detail, is_correct FROM answers WHERE id in "
                + "(select answer_id from question_has_answer where question_id = ?)";
        ps = connection.prepareStatement(sql);
        ps.setInt(1, questionId);
        rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String detail = rs.getString("answer_detail");
            int isCorrect = rs.getInt("is_correct");
            AnswerDTO answer = new AnswerDTO(id, detail, isCorrect);
            answers.add(answer);
        }
        return answers;
    }

    public List<QuizDoneDTO> getDoneQuizzes(int userId, String subjectName, String quizName, int page, int recordsPerPage) throws SQLException {
        List<QuizDoneDTO> doneQuizzes = new ArrayList<>();
        int start = (page - 1) * recordsPerPage;
        String sql = "SELECT q.Id, q.Name AS QuizName, q.Level, q.NumberQuestion, q.Duration, "
                + "(stq.NumberCorrect * 100.0 / q.NumberQuestion) AS Score, s.Name AS SubjectName "
                + "FROM Quizs q "
                + "JOIN Student_Take_Quiz stq ON q.Id = stq.QuizId "
                + "JOIN subjects s ON q.SubjectId = s.id "
                + "WHERE stq.UserId = ? "
                + "AND q.DeleteFlag != 0 "
                + (subjectName != null && !subjectName.isEmpty() ? "AND s.Name LIKE ? " : "")
                + (quizName != null && !quizName.isEmpty() ? "AND q.Name LIKE ? " : "")
                + "ORDER BY q.Id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        ps = connection.prepareStatement(sql);
        int paramIndex = 1;
        ps.setInt(paramIndex++, userId);
        if (subjectName != null && !subjectName.isEmpty()) {
            ps.setString(paramIndex++, "%" + subjectName + "%");
        }
        if (quizName != null && !quizName.isEmpty()) {
            ps.setString(paramIndex++, "%" + quizName + "%");
        }
        ps.setInt(paramIndex++, start);
        ps.setInt(paramIndex++, recordsPerPage);

        rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("Id");
            String quizNameRes = rs.getString("QuizName");
            String level = rs.getString("Level");
            int numberQuestion = rs.getInt("NumberQuestion");
            int duration = rs.getInt("Duration");
            double score = rs.getDouble("Score");
            String subjectNameRes = rs.getString("SubjectName");

            doneQuizzes.add(new QuizDoneDTO(id, quizNameRes, level, numberQuestion, duration, score, subjectNameRes));
        }

        return doneQuizzes;
    }

    public int getTotalDoneQuizzes(int userId, String subjectName, String quizName) throws SQLException {
        String sql = "SELECT COUNT(*) AS Total "
                + "FROM Quizs q "
                + "JOIN Student_Take_Quiz stq ON q.Id = stq.QuizId "
                + "JOIN subjects s ON q.SubjectId = s.id "
                + "WHERE stq.UserId = ? "
                + "AND q.DeleteFlag != 0 "
                + (subjectName != null && !subjectName.isEmpty() ? "AND s.Name LIKE ? " : "")
                + (quizName != null && !quizName.isEmpty() ? "AND q.Name LIKE ? " : "");

        ps = connection.prepareStatement(sql);
        int paramIndex = 1;
        ps.setInt(paramIndex++, userId);
        if (subjectName != null && !subjectName.isEmpty()) {
            ps.setString(paramIndex++, "%" + subjectName + "%");
        }
        if (quizName != null && !quizName.isEmpty()) {
            ps.setString(paramIndex++, "%" + quizName + "%");
        }

        rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt("Total");
        }

        return 0;
    }

    public static void main(String[] args) {
        try {
            QuizDAO quizDAO = QuizDAO.getInstance();

            // Test deleteQuestionFromQuiz
            quizDAO.deleteQuestionFromQuiz(6, 9);
            System.out.println("Deleted Question ID: " + 6 + " from Quiz ID: " + 9);

        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }
}
