package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class ReservationDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public ReservationDAO() {

        Context init;

        try {
            init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int addReservation(ReservationDTO dto) {
        sql = "insert into reservation(resDate, userId, city, branch, room, useDate, time, headcount, pay, paymentMethod, status, orderId, review) values" +
                "(sysdate(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, dto.getUserId());
            ptmt.setString(2, dto.getCity());
            ptmt.setString(3, dto.getBranch());
            ptmt.setString(4, dto.getRoom());
            ptmt.setDate(5, new java.sql.Date(dto.getUseDate().getTime()));
            ptmt.setString(6, dto.getTime());
            ptmt.setInt(7, dto.getHeadcount());
            ptmt.setInt(8, dto.getPay());
            ptmt.setString(9, dto.getPaymentMethod());
            ptmt.setString(10, dto.getStatus());
            ptmt.setString(11, dto.getOrderId());

            return ptmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return 0;
    }

    public ArrayList<ReservationDTO> myReservationList(int userId){

        ArrayList<ReservationDTO> res = new ArrayList<ReservationDTO>();

        sql = "select * from reservation where userId = ? order by resDate desc";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, userId);

            rs = ptmt.executeQuery();
            while(rs.next()){
                ReservationDTO dto = new ReservationDTO();

                dto.setId(rs.getInt("id"));
                dto.setResDate(rs.getDate("resDate"));
                dto.setUserId(rs.getInt("userId"));
                dto.setCity(rs.getString("city"));
                dto.setBranch(rs.getString("branch"));
                dto.setRoom(rs.getString("room"));
                dto.setUseDate(rs.getDate("useDate"));
                dto.setTime(rs.getString("time"));
                dto.setHeadcount(rs.getInt("headcount"));
                dto.setPay(rs.getInt("pay"));
                dto.setPaymentMethod(rs.getString("paymentMethod"));
                dto.setStatus(rs.getString("status"));
                dto.setReview(rs.getInt("review"));

                res.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return res;
    }

    public ArrayList<ReservationDTO> myReservationListWill(int userId, java.util.Date splitDate){

        ArrayList<ReservationDTO> res = new ArrayList<ReservationDTO>();

        sql = "select * from reservation where userId = ? and useDate > DATE_FORMAT(SYSDATE(), '%Y-%m-%d')";

        if(splitDate != null){
            sql += " and useDate < ?";
        }

        sql += " order by useDate desc";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, userId);

            if(splitDate != null){
                ptmt.setDate(2, new java.sql.Date(splitDate.getTime()));
            }

            rs = ptmt.executeQuery();
            while(rs.next()){
                ReservationDTO dto = new ReservationDTO();

                dto.setId(rs.getInt("id"));
                dto.setResDate(rs.getDate("resDate"));
                dto.setUserId(rs.getInt("userId"));
                dto.setCity(rs.getString("city"));
                dto.setBranch(rs.getString("branch"));
                dto.setRoom(rs.getString("room"));
                dto.setUseDate(rs.getDate("useDate"));
                dto.setTime(rs.getString("time"));
                dto.setHeadcount(rs.getInt("headcount"));
                dto.setPay(rs.getInt("pay"));
                dto.setPaymentMethod(rs.getString("paymentMethod"));
                dto.setStatus(rs.getString("status"));
                dto.setReview(rs.getInt("review"));

                res.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return res;
    }
    public ArrayList<ReservationDTO> myReservationListDone(int userId, java.util.Date splitDate){

        ArrayList<ReservationDTO> res = new ArrayList<ReservationDTO>();

        sql = "select * from reservation where userId = ? and useDate < DATE_FORMAT(SYSDATE(), '%Y-%m-%d')";

        if(splitDate != null){
            sql += " and useDate > ?";
        }

        sql += " order by useDate desc";


        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, userId);

            if(splitDate != null){
                ptmt.setDate(2, new java.sql.Date(splitDate.getTime()));
            }

            rs = ptmt.executeQuery();
            while(rs.next()){
                ReservationDTO dto = new ReservationDTO();

                dto.setId(rs.getInt("id"));
                dto.setResDate(rs.getDate("resDate"));
                dto.setUserId(rs.getInt("userId"));
                dto.setCity(rs.getString("city"));
                dto.setBranch(rs.getString("branch"));
                dto.setRoom(rs.getString("room"));
                dto.setUseDate(rs.getDate("useDate"));
                dto.setTime(rs.getString("time"));
                dto.setHeadcount(rs.getInt("headcount"));
                dto.setPay(rs.getInt("pay"));
                dto.setPaymentMethod(rs.getString("paymentMethod"));
                dto.setStatus(rs.getString("status"));
                dto.setReview(rs.getInt("review"));

                res.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return res;
    }
    public ArrayList<ReservationDTO> myReservationListToday(int userId){

        ArrayList<ReservationDTO> res = new ArrayList<ReservationDTO>();

        sql = "select * from reservation where userId = ? and useDate = DATE_FORMAT(SYSDATE(), '%Y-%m-%d') order by useDate desc";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, userId);

            rs = ptmt.executeQuery();
            while(rs.next()){
                ReservationDTO dto = new ReservationDTO();

                dto.setId(rs.getInt("id"));
                dto.setResDate(rs.getDate("resDate"));
                dto.setUserId(rs.getInt("userId"));
                dto.setCity(rs.getString("city"));
                dto.setBranch(rs.getString("branch"));
                dto.setRoom(rs.getString("room"));
                dto.setUseDate(rs.getDate("useDate"));
                dto.setTime(rs.getString("time"));
                dto.setHeadcount(rs.getInt("headcount"));
                dto.setPay(rs.getInt("pay"));
                dto.setPaymentMethod(rs.getString("paymentMethod"));
                dto.setStatus(rs.getString("status"));
                dto.setReview(rs.getInt("review"));

                res.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return res;
    }

    public String soldOutList(String city, String branch, String room, java.util.Date useDate){

        ArrayList<String> arr = new ArrayList<>();

        sql = "select time from reservation where city = ? and branch = ? and room = ? and useDate = ?";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, city);
            ptmt.setString(2, branch);
            ptmt.setString(3, room);
            ptmt.setDate(4, new java.sql.Date(useDate.getTime()));

            rs = ptmt.executeQuery();
            while (rs.next()){
                arr.add(rs.getString("time"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return String.join(", ", arr);
    }

    public ArrayList<ReservationDTO> salesStorefilter(String city, String branch, String useDate){

        ArrayList<ReservationDTO> res = new ArrayList<ReservationDTO>();

        sql = "select city, branch, useDate, pay from reservation where city = ? and branch = ? and useDate = ? ";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, city);
            ptmt.setString(2, branch);
            ptmt.setString(3, useDate);

            rs = ptmt.executeQuery();
            while (rs.next()){
                ReservationDTO reservationDTO = new ReservationDTO();
                reservationDTO.setCity(rs.getString("city"));
                reservationDTO.setBranch(rs.getString("branch"));
                reservationDTO.setUseDate(rs.getDate("useDate"));

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return res;
    }

    public ArrayList<ReservationDTO> storeSalesList() {
        ArrayList<ReservationDTO> res = new ArrayList<>();

        sql = "select * from reservation";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            while (rs.next()) {
                ReservationDTO reservationDTO = new ReservationDTO();
                reservationDTO.setCity(rs.getString("city"));
                reservationDTO.setBranch(rs.getString("branch"));
                reservationDTO.setUseDate(rs.getDate("useDate"));
                reservationDTO.setPay(rs.getInt("pay"));

                res.add(reservationDTO);
            }

        } catch (SQLException e) {

        } finally {
            close();
        }

        return res;
    }

    public boolean reservationWill(String branch){

        sql = "select * from reservation where branch = ? and useDate > DATE_FORMAT(SYSDATE(), '%Y-%m-%d')";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, branch);

            rs =  ptmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return false;
    }

    public ArrayList<ReservationDTO> reservationToday(String branch){

        ArrayList<ReservationDTO> res = new ArrayList<ReservationDTO>();

        sql = "select * from reservation where branch = ? and useDate = DATE_FORMAT(SYSDATE(), '%Y-%m-%d')";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, branch);

            rs = ptmt.executeQuery();
            while(rs.next()){
                ReservationDTO dto = new ReservationDTO();

                dto.setTime(rs.getString("time"));

                res.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }

    public ReservationDTO reservationDetail(int id){

        ReservationDTO reservationDTO = new ReservationDTO();

        sql = "select * from reservation where id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, id);
            rs = ptmt.executeQuery();
            rs.next();

            reservationDTO.setId(rs.getInt("id"));
            reservationDTO.setResDate(rs.getDate("resDate"));
            reservationDTO.setUserId(rs.getInt("userId"));
            reservationDTO.setCity(rs.getString("city"));
            reservationDTO.setBranch(rs.getString("branch"));
            reservationDTO.setRoom(rs.getString("room"));
            reservationDTO.setUseDate(rs.getDate("useDate"));
            reservationDTO.setTime(rs.getString("time"));
            reservationDTO.setHeadcount(rs.getInt("headcount"));
            reservationDTO.setPay(rs.getInt("pay"));
            reservationDTO.setPaymentMethod(rs.getString("paymentMethod"));
            reservationDTO.setStatus(rs.getString("status"));
            reservationDTO.setReview(rs.getInt("review"));

            return reservationDTO;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return null;
    }

    public void close() {
        if(rs!=null) try { rs.close(); } catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close(); } catch (SQLException e) {}
        if(con!=null) try { con.close(); } catch (SQLException e) {}
    }
}
