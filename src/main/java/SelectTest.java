import com.mysql.jdbc.Driver;

import java.sql.*;

/**
 * Created by caoyuncong on
 * 2017/5/23 16:55
 * forgetMe.
 */
public class SelectTest {
    private static final String URL = "jdbc:mysql:///?user=root&password=system";
    private static final String SQL ="SELECT count(*) FROM db_ip.ip WHERE geo RLIKE ?" ;
    public static void main(String[] args) throws SQLException {
        new Driver();
        Connection connection= DriverManager.getConnection(URL);
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);
        preparedStatement.setString(1, "拉萨市");
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        System.out.println(resultSet.getInt(1));

        resultSet.close();
        preparedStatement.close();
        connection.close();
    }
}