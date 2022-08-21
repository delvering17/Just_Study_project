package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FaqDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public FaqDAO(){
        Context init;

        try {
            init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<FaqDTO> list(String category){

        ArrayList<FaqDTO> res = new ArrayList<FaqDTO>();

        sql = "select * from faq where category = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, category);
            rs = ptmt.executeQuery();

            while(rs.next()){
                FaqDTO faqDTO = new FaqDTO();
                faqDTO.setId(rs.getInt("id"));
                faqDTO.setQuestion(rs.getString("question"));
                faqDTO.setAnswer(rs.getString("answer"));
                faqDTO.setCategory(rs.getString("category"));

                res.add(faqDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }

    public void close() {
        if(rs!=null) try {rs.close();} catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close();} catch (SQLException e) {}
        if(con!=null) try { con.close();} catch (SQLException e) {}
    }
}
