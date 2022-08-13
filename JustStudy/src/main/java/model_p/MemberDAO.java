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

    public MemberDTO login(String input_email, String input_password) {
        MemberDTO memberDTO = new MemberDTO();
        sql = "select * from member where mem_email = ? and mem_password = ?";
        try {

            ptmt = con.prepareStatement(sql);
            ptmt.setString(1,input_email);
            ptmt.setString(2,input_password);
            rs = ptmt.executeQuery();
            if(rs.next()) {
                memberDTO.setMem_id(rs.getInt("member_id"));
                memberDTO.setMem_social(rs.getInt("member_social"));
                memberDTO.setMem_email(rs.getString("member_email"));
                memberDTO.setMem_password(rs.getString("member_password"));
                memberDTO.setMem_nickname(rs.getString("member_nickname"));
                memberDTO.setMem_realname(rs.getString("member_realname"));
                memberDTO.setMem_phone(rs.getString("member_phone"));
                memberDTO.setMem_address1(rs.getString("member_address1"));
                memberDTO.setMem_address2(rs.getString("member_address2"));
                memberDTO.setMem_level(rs.getInt("member_level"));
                memberDTO.setMem_socialid(rs.getString("member_socialid"));
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return memberDTO;
    }





}
