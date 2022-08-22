package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BlackDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public BlackDAO() {
        try {
            Context init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<BlackDTO> blackList(){

        ArrayList<BlackDTO> res = new ArrayList<>();
        sql = "SELECT black_id, mem_userid, black_reason FROM blacklist JOIN member ON black_id = mem_id";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            while (rs.next()) {
                BlackDTO blackDTO = new BlackDTO();
                blackDTO.setBlack_id(rs.getInt("black_id"));
                blackDTO.setMem_userid(rs.getString("mem_userid"));
                blackDTO.setBlack_reason(rs.getString("black_reason"));
                res.add(blackDTO);
            }

        } catch (SQLException e) {

        } finally {
            close();
        }

        return res;
    }

    public void add(BlackDTO blackDTO) {

        try {
            sql = "insert into blacklist (black_id, black_reason)"
                    + "values (?,?)";

            ptmt =con.prepareStatement(sql);
            ptmt.setInt(1, blackDTO.black_id);
            ptmt.setString(2, blackDTO.black_reason);
            
            ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }
    }

    public int delete(int black_id) {

        try {
            sql = "delete from blacklist where black_id = ?";

            ptmt =con.prepareStatement(sql);
            ptmt.setInt(1, black_id);
            return ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }

        return 0;
    }


    public void close() {
        if(rs!=null) try { rs.close(); } catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close(); } catch (SQLException e) {}
        if(con!=null) try { con.close(); } catch (SQLException e) {}
    }



}
