package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

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

    public ArrayList<ArrayList> totalList(String filter, String word){

        ArrayList<ArrayList> res = new ArrayList<ArrayList>();

        sql = "SELECT review.id, reservId, orderId, mem_userid, mem_realname, city, branch, room, useDate, time, content" +
                " FROM review JOIN reservation ON review.reservId = reservation.id JOIN member ON memId = member.mem_id";

        if(filter != null){
            sql += " where "+filter+" like ?";
        }

        try {
            ptmt = con.prepareStatement(sql);
            if(filter != null){
                ptmt.setString(1, "%"+word+"%");
            }
            rs = ptmt.executeQuery();

            while(rs.next()){
                ArrayList arr = new ArrayList();

                ReviewDTO reviewDTO = new ReviewDTO();
                MemberDTO memberDTO = new MemberDTO();
                ReservationDTO reservationDTO = new ReservationDTO();

                reviewDTO.setId(rs.getInt("id"));
                reviewDTO.setReservId(rs.getInt("reservId"));
                reservationDTO.setOrderId(rs.getString("orderId"));
                memberDTO.setMem_userid(rs.getString("mem_userid"));
                memberDTO.setMem_realname(rs.getString("mem_realname"));
                reservationDTO.setCity(rs.getString("city"));
                reservationDTO.setBranch(rs.getString("branch"));
                reservationDTO.setRoom(rs.getString("room"));
                reservationDTO.setUseDate(rs.getDate("useDate"));
                reservationDTO.setTime(rs.getString("time"));
                reviewDTO.setContent(rs.getString("content"));

                arr.add(reviewDTO);
                arr.add(memberDTO);
                arr.add(reservationDTO);

                res.add(arr);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }

    public int insert(ReviewDTO reviewDTO){

        try {

            sql = "SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'review' AND table_schema = DATABASE( )";

            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();
            rs.next();
            reviewDTO.id = rs.getInt(1);

            sql = "insert into review (id, reservId, memId, reviewDate, star, content) values (?, ?, ?, sysdate(), ?, ?)";

            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, reviewDTO.getId());
            ptmt.setInt(2, reviewDTO.getReservId());
            ptmt.setInt(3, reviewDTO.getMemId());
            ptmt.setDouble(4, reviewDTO.getStar());
            ptmt.setString(5, reviewDTO.getContent());

            return ptmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return 0;
    }

    public ReviewDTO detail(int reservId){

        ReviewDTO reviewDTO = new ReviewDTO();

        sql = "select * from review where reservId = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, reservId);

            rs = ptmt.executeQuery();
            while(rs.next()){
                reviewDTO.setId(rs.getInt("id"));
                reviewDTO.setReservId(rs.getInt("reservId"));
                reviewDTO.setMemId(rs.getInt("memId"));
                reviewDTO.setReviewDate(rs.getDate("reviewDate"));
                reviewDTO.setStar(rs.getDouble("star"));
                reviewDTO.setContent(rs.getString("content"));

                return reviewDTO;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
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
        } finally {
            close();
        }
        return 0;
    }



    public ArrayList<ReviewDTO> branchReview(String branchName){
        ArrayList<ReviewDTO> res = new ArrayList<ReviewDTO>();

        sql = "SELECT branch, mem_nickname, reviewDate, star, content FROM review JOIN reservation ON reservId = reservation.id" +
                " JOIN member ON reservation.userId = member.mem_id WHERE branch = ? limit 5";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, branchName);
            rs = ptmt.executeQuery();

            while(rs.next()){
                ReviewDTO reviewDTO = new ReviewDTO();
                reviewDTO.setBranch(rs.getString("branch"));
                reviewDTO.setUserNickname(rs.getString("mem_nickname"));
                reviewDTO.setReviewDate(rs.getTimestamp("reviewDate"));
                reviewDTO.setStar(rs.getDouble("star"));
                reviewDTO.setContent(rs.getString("content"));

                res.add(reviewDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }


    public float branchAverage(String branchName){
        ArrayList<ReviewDTO> arr_reviewDTO = new ArrayList<ReviewDTO>();
        int total = 0;
        float sum = 0;
        float avg = 0;
        sql = "SELECT branch, mem_nickname, reviewDate, star, content FROM review JOIN reservation ON reservId = reservation.id" +
                " JOIN member ON reservation.userId = member.mem_id WHERE branch = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, branchName);
            rs = ptmt.executeQuery();

            while(rs.next()){
                ReviewDTO reviewDTO = new ReviewDTO();
                reviewDTO.setBranch(rs.getString("branch"));
                reviewDTO.setUserNickname(rs.getString("mem_nickname"));
                reviewDTO.setReviewDate(rs.getTimestamp("reviewDate"));
                reviewDTO.setStar(rs.getDouble("star"));
                reviewDTO.setContent(rs.getString("content"));

                arr_reviewDTO.add(reviewDTO);

                sum += rs.getDouble("star");

            }

            total = arr_reviewDTO.size();

            avg  = sum / total;
            avg = (float) (Math.round(avg * 10) / 10.0);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return avg;
    }

    public int delete(int reservId){

        try {
            sql = "delete from review where reservId = ?";

            ptmt =con.prepareStatement(sql);
            ptmt.setInt(1, reservId);
            return ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }

        return 0;
    }
    public int changeReviewStatus(int reservId){

        try {
            sql = "update reservation set review = 0 where id = ?";

            ptmt =con.prepareStatement(sql);
            ptmt.setInt(1, reservId);

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
