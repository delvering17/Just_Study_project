package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
        } finally {
            close();
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
        } finally {
            close();
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
        } finally {
            close();
        }


        return res;
    }
    public void signIn(MemberDTO memberDTO) {
        sql = " insert into member (mem_social , mem_userid , mem_password , mem_nickname , mem_realname , mem_phone, mem_address1, mem_address2,  mem_level, mem_socialid) values " +
                "(?,?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            ptmt = con.prepareStatement(sql);

            ptmt.setInt(1,memberDTO.getMem_social());
            ptmt.setString(2, memberDTO.getMem_userid());
            ptmt.setString(3, memberDTO.getMem_password());
            ptmt.setString(4, memberDTO.getMem_nickname());
            ptmt.setString(5, memberDTO.getMem_realname());
            ptmt.setString(6, memberDTO.getMem_phone());
            ptmt.setString(7, memberDTO.getMem_address1());
            ptmt.setString(8, memberDTO.getMem_address2());
            ptmt.setInt(9, memberDTO.getMem_level());
            ptmt.setString(10, memberDTO.getMem_socialid());

            ptmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
    }

    public ArrayList<MemberDTO> list() {
        ArrayList<MemberDTO> res = new ArrayList<>();

        sql = "select * from member";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            while (rs.next()) {
                MemberDTO memberDTO = new MemberDTO();
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

                res.add(memberDTO);
            }
        } catch (SQLException e) {

        } finally {
            close();
        }
        return res;
    }

    public ArrayList<MemberDTO> userListFilter(String filter, String value) {
        ArrayList<MemberDTO> res = new ArrayList<>();

        sql = "select * from member where "+filter+" like ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, "%"+value+"%");
            rs = ptmt.executeQuery();

            while (rs.next()) {
                MemberDTO memberDTO = new MemberDTO();
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

                res.add(memberDTO);
            }
        } catch (SQLException e) {

        } finally {
            close();
        }
        return res;
    }


        public MemberDTO detail(int mem_id) {
        MemberDTO memberDTO = new MemberDTO();

        sql = "select * from member where mem_id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, mem_id);
            rs = ptmt.executeQuery();
            if(rs.next()) {

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
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return memberDTO;
    }

    public int delete(int mem_id) {

        try {
            sql = "delete from member where mem_id = ?";

            ptmt =con.prepareStatement(sql);
            ptmt.setInt(1, mem_id);
            return ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }

        return 0;
    }

    public void modifyInformation(MemberDTO memberDTO) {
        sql = "update member set mem_realname = ?, mem_nickname = ?, mem_phone = ?, mem_address1 = ?, mem_address2 = ? where mem_id = ?";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, memberDTO.getMem_realname());
            ptmt.setString(2, memberDTO.getMem_nickname());
            ptmt.setString(3, memberDTO.getMem_phone());
            ptmt.setString(4, memberDTO.getMem_address1());
            ptmt.setString(5, memberDTO.getMem_address2());
            ptmt.setInt(6, memberDTO.getMem_id());
            int a = ptmt.executeUpdate();
            System.out.println(a);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
    }

    public void changePassword(MemberDTO memberDTO) {
        sql = "update member set mem_password = ? where mem_id= ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, memberDTO.getMem_password());
            ptmt.setInt(2, memberDTO.getMem_id());

            ptmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }


    }

    public void signOut(int mem_id) {
        sql = "delete from member where mem_id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, mem_id);
            ptmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

    }

    public void close() {
        if(rs!=null) try { rs.close(); } catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close(); } catch (SQLException e) {}
        if(con!=null) try { con.close(); } catch (SQLException e) {}
    }

}
