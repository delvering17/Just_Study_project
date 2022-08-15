package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class InquiryDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public InquiryDAO() {



        try {
            Context init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<InquiryDTO> inquiryList(int mem_id, int first, int limit) {
        ArrayList<InquiryDTO> res = new ArrayList<>();

        sql = "select * from inquiry where inquiry_writer = ? order by inquiry_date desc, inquiry_id limit ?,? ";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, mem_id);
            ptmt.setInt(2, first);
            ptmt.setInt(3, limit);
            rs = ptmt.executeQuery();

            while(rs.next()) {
                InquiryDTO inquiryDTO = new InquiryDTO();

                inquiryDTO.setInquiry_id(rs.getInt("inquiry_id"));
                inquiryDTO.setInquiry_title(rs.getString("inquiry_title"));
                inquiryDTO.setInquiry_content(rs.getString("inquiry_content"));
                inquiryDTO.setInquiry_writer(rs.getInt("inquiry_writer"));
                inquiryDTO.setInquiry_category(rs.getString("inquiry_category"));
                inquiryDTO.setInquiry_type(rs.getString("inquiry_type"));
                inquiryDTO.setInquiry_branch(rs.getString("inquiry_branch"));
                inquiryDTO.setInquiry_date(rs.getDate("inquiry_date"));
                inquiryDTO.setInquiry_level(rs.getInt("inquiry_level"));
                inquiryDTO.setInquiry_state(rs.getInt("inquiry_state"));

                res.add(inquiryDTO);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }finally {
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
