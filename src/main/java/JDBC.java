import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by caoyuncong on
 * 2017/5/16 17:31
 * forgetMe.
 */
public class JDBC {
    public static void main(String[] args) throws SQLException {
        new Driver();
        Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/db_1702", "root", "system");
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO db_1702.course VALUES (NULL ,'Front',2)");
        preparedStatement.executeUpdate();
    }
}
