package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminDAO {
    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public AdminDAO() {
        Context init;

        try {
            init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public ArrayList<AdminDTO> userList(){
        ArrayList<AdminDTO> res = new ArrayList<>();
        sql = "select * from user";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            while(rs.next()){
                AdminDTO dto = new AdminDTO();
                dto.setName(rs.getString("pname"));
                dto.setNickname(rs.getString("nickname"));
                dto.setPid(rs.getString("pid"));
                dto.setSituation(rs.getString("situation"));
                dto.setPhone_num(rs.getString("phone_num"));
                dto.setHome_num(rs.getString("home_num"));
                dto.setSms(rs.getBoolean("sms"));
                dto.setInfo_open(rs.getBoolean("info_open"));
                dto.setSelf_Authentication(rs.getBoolean("self_Authentication"));
                dto.setEmail_receive(rs.getBoolean("email_receive"));
                dto.setBlock(rs.getBoolean("block"));
                dto.setLast_study(rs.getDate("last_study"));
                dto.setJoin_date(rs.getDate("join_date"));

                res.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            close();
        }
        return res;
    }

    public void close() {
        if(rs!=null) try { rs.close();} catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close();} catch (SQLException e) {}
        if(con!=null) try { con.close();} catch (SQLException e) {}
    }
}
