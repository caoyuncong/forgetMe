import com.mysql.jdbc.Driver;

import java.sql.*;
import java.util.Scanner;

/**
 * Created by caoyuncong on
 * 2017/5/18 17:48
 * forgetMe.
 */
public class IpSearch {
    private static final String URL = "jdbc:mysql:///?user=root&password=system";
    private static final String SQL =
            "SELECT * FROM db_ip.ip WHERE inet_aton(?) BETWEEN inet_aton(min) AND inet_aton(max)";

    public static void main(String[] args) throws SQLException {
        new Driver();
        Connection connection = DriverManager.getConnection(URL);
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);

        Scanner scanner = new Scanner(System.in);
        System.out.println("input ip address: ");
        String ip = scanner.nextLine();

        preparedStatement.setString(1, ip);

        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        System.out.println("geo: " + resultSet.getString("geo"));
        resultSet.close();
        preparedStatement.close();
        connection.close();
    }
}
