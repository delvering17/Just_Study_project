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

    public MemberDTO login(String input_id, String input_password) {
        MemberDTO memberDTO = null;
        sql = "select * from member where mem_userid = ? and mem_password = ?";
        try {

            ptmt = con.prepareStatement(sql);
            ptmt.setString(1,input_id);
            ptmt.setString(2,input_password);
            rs = ptmt.executeQuery();
            if(rs.next()) {
                memberDTO = new MemberDTO();

                memberDTO.setMem_id(rs.getInt("mem_id"));
                memberDTO.setMem_social(rs.getInt("mem_social"));
                memberDTO.setMem_userid(rs.getString("mem_userid"));
                memberDTO.setMem_password(rs.getString("mem_password"));
                memberDTO.setMem_nickname(rs.getString("mem_nickname"));
                memberDTO.setMem_realname(rs.getString("mem_realname"));
                memberDTO.setMem_phone(rs.getString("mem_phone"));
                memberDTO.setMem_address1(rs.getString("mem_address1"));
                memberDTO.setMem_address2(rs.getString("mem_address2"));
                memberDTO.setMem_level(rs.getInt("mem_level"));
                memberDTO.setMem_socialid(rs.getString("mem_socialid"));
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return memberDTO;
    }

    public boolean idDoubleCheck(String input_userid) {
        boolean res = false;

        sql = "select * from member where mem_userid = ?";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, input_userid);
            rs = ptmt.executeQuery();

            res = rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return  res;
    }

    public boolean nicknameDoubleCheck(String input_nickname) {
        boolean res = false;

        sql = "select * from member where mem_nickname = ?";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, input_nickname);
            rs = ptmt.executeQuery();

            res = rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return  res;
    }



}
