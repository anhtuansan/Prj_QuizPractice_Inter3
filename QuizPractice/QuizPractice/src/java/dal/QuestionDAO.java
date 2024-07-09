package dal;

import dto.Lesson;
import dto.Subject;
import model.Question;
import context.DBContext;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO extends DBContext {

    private static QuestionDAO instance;
    private static final Object lockPad = new Object();

    private QuestionDAO() {
    }

    public static QuestionDAO getInstance() {
        if (instance == null) {
            synchronized (lockPad) {
                if (instance == null) {
                    instance = new QuestionDAO();
                }
            }
        }
        return instance;
    }

  

    public boolean toggleQuestionStatus(int questionId, int status) throws SQLException {
        String query = "UPDATE questions SET Status = ? WHERE id = ?";
        ps = connection.prepareStatement(query);
        ps.setInt(1, status);
        ps.setInt(2, questionId);
        return ps.executeUpdate() > 0;
    }

   
}
