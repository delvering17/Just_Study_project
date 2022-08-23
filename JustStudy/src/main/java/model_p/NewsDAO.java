package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NewsDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public NewsDAO(){
        Context init;

        try {
            init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<NewsDTO> list(){
        ArrayList<NewsDTO> res = new ArrayList<NewsDTO>();

        sql = "select * from news";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            while(rs.next()) {
                NewsDTO dto = new NewsDTO();

                dto.setNews_id(rs.getInt("news_id"));
                dto.setNews_title(rs.getString("news_title"));
                dto.setNews_reg_date(rs.getTimestamp("news_reg_date"));
                dto.setNews_content(rs.getString("news_content"));
                dto.setNews_img(rs.getString("news_img"));

                res.add(dto);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }finally {
            close();
        }

        return res;
    }

    public void insert(NewsDTO dto) {

        sql = "SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'news' AND table_schema = DATABASE( )";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();
            if (rs.next()) {
                dto.setNews_id(rs.getInt(1));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        try {


            sql = "insert into news (news_id,news_title,news_content,news_img,news_reg_date) "
                    + "values (?,?,?,?,sysdate())";

            ptmt =con.prepareStatement(sql);

            ptmt.setInt(1, dto.news_id);
            ptmt.setString(2,dto.news_title);
            ptmt.setString(3,dto.news_content);
            ptmt.setString(4,dto.news_img);


            ptmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close();
        }


    }


    public NewsDTO detail(int id) {
        NewsDTO res = null;

        sql = "select * from news where news_id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, id);
            rs = ptmt.executeQuery();

            if(rs.next()) {
                res = new NewsDTO();
                res.setNews_id(rs.getInt("news_id"));
                res.setNews_title(rs.getString("news_title"));
                res.setNews_content(rs.getString("news_content"));
                res.setNews_img(rs.getString("news_img"));
                res.setNews_reg_date(rs.getTimestamp("news_reg_date"));

            }


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            close();
        }

        return res;
    }


    public int modify(NewsDTO dto, String img){

        sql = "update news set news_title = ? ,news_content = ?, news_img = ? where news_id = ?";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, dto.getNews_title());
            ptmt.setString(2, dto.getNews_content());
            ptmt.setString(3, dto.getNews_img());
            ptmt.setInt(4, dto.getNews_id());


            return ptmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
    }

    public int delete(int id) {

        try {
            sql = "delete from news where news_id = ?";

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


    public int imgDelete(NewsDTO dto, int id){

        sql = "update news set news_img = ? where news_id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, "");
            ptmt.setInt(2, id);

            return ptmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
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
