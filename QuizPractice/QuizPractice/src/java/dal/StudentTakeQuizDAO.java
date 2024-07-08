package dal;

import context.DBContext;
import model.StudentTakeQuiz;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StudentTakeQuizDAO extends DBContext {

    private static StudentTakeQuizDAO instance;
    private static final Object lockPad = new Object();

    private StudentTakeQuizDAO() {
    }

    public static StudentTakeQuizDAO getInstance() {
        if (instance == null) {
            synchronized (lockPad) {
                if (instance == null) {
                    instance = new StudentTakeQuizDAO();
                }
            }
        }
        return instance;
    }

    public StudentTakeQuiz getStudentTakeQuizById(int id) throws SQLException {
        String query = "SELECT * FROM Student_Take_Quiz WHERE Id = ?";
        ps = connection.prepareStatement(query);
        ps.setInt(1, id);
        rs = ps.executeQuery();

        if (rs.next()) {
            return new StudentTakeQuiz(
                    rs.getInt("Id"),
                    rs.getInt("QuizId"),
                    rs.getInt("UserId"),
                    rs.getString("Status"),
                    rs.getInt("NumberCorrect")
            );
        }
        return null;
    }

    public String getSubjectNameById(int subjectId) throws SQLException {
        String query = "SELECT name FROM subjects WHERE id = ?";
        ps = connection.prepareStatement(query);
        ps.setInt(1, subjectId);
        rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getString("name");
        }
        return null;
    }
}
