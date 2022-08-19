package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class ApplyStudyDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public ApplyStudyDAO() {

        try {
            Context init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ApplyStudyDTO detail() {
        ApplyStudyDTO res = null;

        sql = "select * from applystudy";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            if(rs.next()) {
                res = new ApplyStudyDTO();
                res.setAs_id(rs.getInt("as_id"));
                res.setAs_purpose(rs.getInt("as_purpose"));
                res.setAs_mem_id(rs.getInt("as_mem_id"));
                res.setAs_content(rs.getString("as_content"));
                res.setAs_state(rs.getInt("as_state"));

            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }

    public void insertApply(int input_purpose,int input_id, String input_content) {

        sql = "insert into applystudy (as_purpose, as_mem_id, as_content, as_state) values (?, ?, ?, 1);";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, input_purpose);
            ptmt.setInt(2, input_id);
            ptmt.setString(3,input_content);

            ptmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public ArrayList<ApplyStudyDTO> myApplyList(int id){

        ArrayList<ApplyStudyDTO> res = new ArrayList<ApplyStudyDTO>();

        sql = "select * from applystudy where as_mem_id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, id);

            rs = ptmt.executeQuery();
            while(rs.next()){
                ApplyStudyDTO applyStudyDTO = new ApplyStudyDTO();
                applyStudyDTO.setAs_id(rs.getInt("as_id"));
                applyStudyDTO.setAs_purpose(rs.getInt("as_purpose"));
                applyStudyDTO.setAs_mem_id(rs.getInt("as_mem_id"));
                applyStudyDTO.setAs_content(rs.getString("as_content"));
                applyStudyDTO.setAs_state(rs.getInt("as_state"));

                res.add(applyStudyDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }

    public void close() {
        if(rs!=null) try { rs.close(); } catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close(); } catch (SQLException e) {}
        if(con!=null) try { con.close(); } catch (SQLException e) {}
    }

}
