package dal;

import model.Question;
import model.Answer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import context.DBContext;

public class QuestionsDAO extends DBContext {

    private static QuestionsDAO instance;
    private static Object lockPad = new Object();

    private QuestionsDAO() {
    }

    public static QuestionsDAO getInstance() {
        if (instance == null) {
            synchronized (lockPad) {
                if (instance == null) {
                    instance = new QuestionsDAO();
                }
            }
        }
        return instance;
    }

    public Question getQuestionById(int questionId) throws SQLException {
        String query = "SELECT * FROM questions WHERE id = ?";
        ps = connection.prepareStatement(query);
        ps.setInt(1, questionId);
        rs = ps.executeQuery();

        if (rs.next()) {
            Question question = new Question(
                    rs.getInt("id"),
                    rs.getString("detail"),
                    rs.getString("Suggestion"),
                    rs.getString("Status"),
                    rs.getString("Media")
            );
            return question;
        }
        return null;
    }

    public List<Answer> getAnswersByQuestionId(int questionId) throws SQLException {
        String query = "SELECT a.* FROM answers a JOIN question_has_answer qha ON a.id = qha.answer_id WHERE qha.question_id = ?";
        ps = connection.prepareStatement(query);
        ps.setInt(1, questionId);
        rs = ps.executeQuery();

        List<Answer> answers = new ArrayList<>();
        while (rs.next()) {
            Answer answer = new Answer(
                    rs.getInt("id"),
                    rs.getString("answer_detail"),
                    rs.getTimestamp("created_at"),
                    rs.getTimestamp("updated_at"),
                    rs.getInt("creator_id"),
                    rs.getBoolean("is_correct")
            );
            answers.add(answer);
        }
        return answers;
    }

    public List<Question> getQuestionsByPracticeId(int practiceId) throws SQLException {
        String query = "SELECT q.* FROM questions q JOIN practice_question pq ON q.id = pq.question_id WHERE pq.practice_id = ?";
        ps = connection.prepareStatement(query);
        ps.setInt(1, practiceId);
        rs = ps.executeQuery();

        List<Question> questions = new ArrayList<>();
        while (rs.next()) {
            Question question = new Question(
                    rs.getInt("id"),
                    rs.getString("detail"),
                    rs.getString("Suggestion"),
                    rs.getString("Status"),
                    rs.getString("Media")
            );
            questions.add(question);
        }
        return questions;
    }

    public List<Question> getQuestionsBySubject(int subjectId) throws SQLException {
        String query = "SELECT q.* FROM questions q JOIN Lesson_Has_Question lhq ON q.id = lhq.QuestionId JOIN subject_has_lesson shl ON lhq.LessonId = shl.lesson_id WHERE shl.subject_id = ?";
        ps = connection.prepareStatement(query);
        ps.setInt(1, subjectId);
        rs = ps.executeQuery();
        List<Question> questions = new ArrayList<>();
        while (rs.next()) {
            questions.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getInt(4)+"",rs.getString(5)));
        }
        return questions;

    }

    public List<Question> getQuestionsByLesson(int lessonId) throws SQLException {
        String query = "SELECT q.* FROM Question q JOIN Lesson_Has_Question lhq ON q.id = lhq.QuestionId WHERE lhq.LessonId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, lessonId);
            try (ResultSet rs = ps.executeQuery()) {
                List<Question> questions = new ArrayList<>();
                while (rs.next()) {
                    questions.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getInt(4)+"",rs.getString(5)));
                }
                return questions;
            }
        }
    }

    public List<Question> getQuestionsByLessonName(String lessonName) throws SQLException {
        String query = "SELECT q.* FROM Question q JOIN Lesson_Has_Question lhq ON q.id = lhq.QuestionId JOIN Lesson l ON lhq.LessonId = l.id WHERE l.name = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, lessonName);
            try (ResultSet rs = ps.executeQuery()) {
                List<Question> questions = new ArrayList<>();
                while (rs.next()) {
                    questions.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getInt(4)+"",rs.getString(5)));
                }
                return questions;
            }
        }
    }
}
