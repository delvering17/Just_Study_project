package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NoticeDAO {
    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public NoticeDAO(){
        Context init;

        try {
            init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<NoticeDTO> list(){
        ArrayList<NoticeDTO> res = new ArrayList<NoticeDTO>();

        sql = "select * from notice";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            while(rs.next()) {
                NoticeDTO dto = new NoticeDTO();

                dto.setId(rs.getInt("id"));
                dto.setTitle(rs.getString("title"));
                dto.setReg_date(rs.getTimestamp("reg_date"));
                dto.setContent(rs.getString("content"));

                res.add(dto);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }finally {
            close();
        }

        return res;
    }





    public void insert(NoticeDTO dto) {

        sql = "select max(id) from notice";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();
            if (rs.next()) {
                dto.setId(rs.getInt(1)+1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        try {

            sql = "insert into notice (id,title,content,reg_date) "
                    + "values (?,?,?,sysdate())";

            ptmt =con.prepareStatement(sql);

            ptmt.setInt(1, dto.id);
            ptmt.setString(2,dto.title);
            ptmt.setString(3,dto.content);

            ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }


    }

    public NoticeDTO detail(int id) {
        NoticeDTO res = null;

        sql = "select * from notice where id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, id);
            rs = ptmt.executeQuery();

            if(rs.next()) {
                res = new NoticeDTO();
                res.setId(rs.getInt("id"));
                res.setTitle(rs.getString("title"));
                res.setReg_date(rs.getTimestamp("reg_date"));
                res.setContent(rs.getString("content"));

            }


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            close();
        }

        return res;
    }


    public int modify(NoticeDTO dto){

        sql = "update notice set title = ?, content = ? where id = ?";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, dto.getTitle());
            ptmt.setString(2, dto.getContent());
            ptmt.setInt(3, dto.id);


            return ptmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
    }

    public int delete(int id) {

        try {
            sql = "delete from notice where id = ?";

            ptmt =con.prepareStatement(sql);
            ptmt.setInt(1, id);
            return ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }

        return 0;
    }



    public void close() {
        if(rs!=null) try {rs.close();} catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close();} catch (SQLException e) {}
        if(con!=null) try { con.close();} catch (SQLException e) {}
    }

}
