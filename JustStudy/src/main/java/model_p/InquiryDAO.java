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

    public ArrayList<InquiryDTO> inquiryList() {
        ArrayList<InquiryDTO> res = new ArrayList<>();

        sql = "select * from inquiry where inquiry_level = 1 ";
        try {
            ptmt = con.prepareStatement(sql);

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

    public ArrayList<InquiryDTO> inquiryUnanswered() {
        ArrayList<InquiryDTO> res = new ArrayList<>();

        sql = "select * from inquiry where inquiry_level = 1 and inquiry_state = 1";
        try {
            ptmt = con.prepareStatement(sql);

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


    public ArrayList<InquiryDTO> inquiryPeriodList(int mem_id, int first, int limit, String date_before, String date_after) {
        ArrayList<InquiryDTO> res = new ArrayList<>();

        sql = "select * from inquiry where inquiry_writer =  ? and inquiry_date >= ? and inquiry_date <= ? and inquiry_level = 1 order by inquiry_date desc, inquiry_id limit ?,? ";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, mem_id);
            ptmt.setString(2, date_before );
            ptmt.setString(3, date_after);
            ptmt.setInt(4, first);
            ptmt.setInt(5, limit);


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
    public ArrayList<InquiryDTO> inquiryDateList(int mem_id, int first, int limit, String date_before, String date_after) {
        ArrayList<InquiryDTO> res = new ArrayList<>();

        sql = "select * from inquiry where inquiry_writer =  ? and inquiry_date >= ? and inquiry_date <= ? and inquiry_level = 1 order by inquiry_date desc, inquiry_id limit ?,? ";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, mem_id);
            ptmt.setString(2, date_before );
            ptmt.setString(3, date_after);
            ptmt.setInt(4, first);
            ptmt.setInt(5, limit);


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

    public int inquiryTotal (int mem_id, String date_before, String date_after) {

        sql = "select count(*) from inquiry where inquiry_writer = ? and inquiry_date >= ? and inquiry_date <= ? and inquiry_level = 1";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, mem_id);
            ptmt.setString(2, date_before );
            ptmt.setString(3, date_after);

            rs = ptmt.executeQuery();

            rs.next();
            return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }

        return 0;
    }

    public InquiryDTO inquiryDetail(int inquiry_id) {
        InquiryDTO inquiryDTO = new InquiryDTO();
        sql = "select * from inquiry where inquiry_id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1,inquiry_id);

            rs = ptmt.executeQuery();
            if(rs.next()) {
                inquiryDTO = new InquiryDTO();

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

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return inquiryDTO;
    }

    public InquiryDTO answerDetail(int inquiry_id) {
        InquiryDTO inquiryDTO = new InquiryDTO();
        sql = "select * from inquiry where inquiry_level = 2 and inquiry_purpose = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1,inquiry_id);

            rs = ptmt.executeQuery();
            if(rs.next()) {
                inquiryDTO = new InquiryDTO();

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
                inquiryDTO.setInquiry_purpose(rs.getInt("inquiry_purpose"));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return inquiryDTO;
    }

    public void answerInsert(InquiryDTO inquiryDTO) {
        sql = "insert into inquiry (inquiry_title,inquiry_content,inquiry_writer,inquiry_date,inquiry_level, inquiry_purpose) " +
                "values (?,?,?,sysdate(),2,?)";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, inquiryDTO.inquiry_title);
            ptmt.setString(2, inquiryDTO.inquiry_content);
            ptmt.setInt(3, inquiryDTO.inquiry_writer);
            ptmt.setInt(4, inquiryDTO.inquiry_purpose);
            ptmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        sql = "update inquiry set inquiry_state = 2 where inquiry_id = ?";


        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, inquiryDTO.inquiry_purpose);
            ptmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
    }

    public void answerModify(InquiryDTO inquiryDTO) {
        sql = "update inquiry set inquiry_title = ?,inquiry_content = ?,inquiry_writer = ?,inquiry_date = sysdate() where inquiry_id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, inquiryDTO.getInquiry_title());
            ptmt.setString(2, inquiryDTO.getInquiry_content());
            ptmt.setInt(3, inquiryDTO.getInquiry_writer());
            ptmt.setInt(4,inquiryDTO.getInquiry_id());

            ptmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

    }

    public void answerDelete(int answer_id, int inquiry_purpose) {
        sql = "delete from inquiry where inquiry_id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, answer_id);
            ptmt.executeUpdate();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        sql = "update inquiry set inquiry_state = 1 where inquiry_id = ?";


        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, inquiry_purpose);
            ptmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }


    }

    public int userInsert(InquiryDTO inquiryDTO) {
        int res = 0;
        sql = "SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'inquiry' AND table_schema = DATABASE( )";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();
            if(rs.next()) {
                res = rs.getInt(1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        sql = "insert into inquiry (inquiry_title,inquiry_content,inquiry_writer,inquiry_category,inquiry_type,inquiry_branch, inquiry_date,inquiry_state, inquiry_level) " +
                "values (?,?,?,?,?,?,sysdate(),1, 1)";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, inquiryDTO.inquiry_title);
            ptmt.setString(2, inquiryDTO.inquiry_content);
            ptmt.setInt(3, inquiryDTO.inquiry_writer);
            ptmt.setString(4, inquiryDTO.inquiry_category);
            ptmt.setString(5, inquiryDTO.inquiry_type);
            ptmt.setString(6, inquiryDTO.inquiry_branch);

            ptmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
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
