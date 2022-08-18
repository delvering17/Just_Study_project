package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReviewDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public ReviewDAO() {

        Context init;

        try {
            init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int insert(ReviewDTO reviewDTO){

        try {
            sql = "select max(id)+1 from review";

            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();
            rs.next();
            reviewDTO.id = rs.getInt(1);

            sql = "insert into review (id, reservId, memId, content) values (?, ?, ?, ?)";

            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, reviewDTO.getId());
            ptmt.setDouble(2, reviewDTO.getReservId());
            ptmt.setDouble(3, reviewDTO.getMemId());
            ptmt.setString(4, reviewDTO.getContent());

            return ptmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return 0;
    }

    public ReviewDTO detail(int id){

        ReviewDTO reviewDTO = new ReviewDTO();

        sql = "select * from review where id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, id);

            rs = ptmt.executeQuery();
            while(rs.next()){
                reviewDTO.setId(rs.getInt("id"));
                reviewDTO.setReservId(rs.getInt("reservId"));
                reviewDTO.setMemId(rs.getInt("memId"));
                reviewDTO.setContent(rs.getString("content"));

                return reviewDTO;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int reviewDone(ReviewDTO reviewDTO){
        sql = "update reservation set review = 1 where id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, reviewDTO.getReservId());

            return ptmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void close() {
        if(rs!=null) try { rs.close(); } catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close(); } catch (SQLException e) {}
        if(con!=null) try { con.close(); } catch (SQLException e) {}
    }
}
