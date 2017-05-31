import com.mysql.jdbc.Driver;

import java.sql.*;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by caoyuncong on
 * 2017/5/26 21:54
 * forgetMe.
 */
public class Astrology {
    private static final String URL = "jdbc:mysql:///?user=root&password=system";
    private static final String SQL = "SELECT count(*)" +
            " FROM db_1702.v_password" +
            " WHERE substr(password,5,4) BETWEEN ? AND ?";

    public static void main(String[] args) throws SQLException {
        Map<String, String> map = new LinkedHashMap<>();
        map.put("白羊座", "0321 0419");
        map.put("金牛座", "0420 0520");
        map.put("双子座", "0521 0621");
        map.put("巨蟹座", "0622 0722");
        map.put("狮子座", "0723 0822");
        map.put("处女座", "0823 0922");
        map.put("天秤座", "0923 1023");
        map.put("天蝎座", "1024 1121");
        map.put("射手座", "1122 1220");
        map.put("摩羯座1", "1221 1231");
        map.put("摩羯座2", "0101 0120");
        map.put("水瓶座", "0121 0219");
        map.put("双鱼座", "0220 0320");

        new Driver();
        Connection connection = DriverManager.getConnection(URL);
        PreparedStatement statement = connection.prepareStatement(SQL);

        for (Map.Entry<String, String> entry : map.entrySet()) {
            String from = entry.getValue().split(" ")[0];
            String to = entry.getValue().split(" ")[1];
            statement.setString(1, from);
            statement.setString(2, to);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
            int counter = resultSet.getInt(1);
            System.out.println(entry.getKey() + "\t" + counter);
            resultSet.close();
        }

        statement.close();
        connection.close();
    }
}
//白羊座	22896
//金牛座	23678
//        双子座	26464
//        巨蟹座	25291
//        狮子座	26451
//        处女座	29102
//        天秤座	47599
//        天蝎座	43056
//        射手座	44054
//        摩羯座1	16188
//        摩羯座2	17921
//        水瓶座	29566
//        双鱼座	26249