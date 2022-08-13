package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public MemberDAO() {



        try {
            Context init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String login(String input_email, String input_password) {
        String user_nickname = null;
        sql = "select * from member where mem_email = ? and mem_password = ?";
        try {

            ptmt = con.prepareStatement(sql);
            ptmt.setString(1,input_email);
            ptmt.setString(2,input_password);
            rs = ptmt.executeQuery();
            if(rs.next()) {
                user_nickname = rs.getString("mem_nickname");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user_nickname;
    }





}
