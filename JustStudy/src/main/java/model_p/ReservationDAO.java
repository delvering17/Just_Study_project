package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    public ArrayList<BranchDTO> branchList(){

        ArrayList<BranchDTO> res = new ArrayList<BranchDTO>();

        sql = "select * from branch";
        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            while(rs.next()){
                BranchDTO dto = new BranchDTO();
                dto.setCity(rs.getString("city"));
                dto.setName(rs.getString("name"));
                dto.setRooms(rs.getString("rooms"));
                dto.setPrice(rs.getInt("price"));
                dto.setOpen(rs.getInt("open"));
                dto.setClose(rs.getInt("close"));
                dto.setFacilities(rs.getString("facilities"));
                dto.setAddress(rs.getString("address"));
                dto.setPhone(rs.getString("phone"));
                res.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return res;
    }

    public int addReservation(ReservationDTO dto) {
        sql = "insert into reservation(resDate, userId, city, branch, room, useDate, time, headcount, pay, paymentMethod, status, orderId) values" +
                "(sysdate(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, dto.getUserId());
            ptmt.setString(2, dto.getCity());
            ptmt.setString(3, dto.getBranch());
            ptmt.setString(4, dto.getRoom());
            ptmt.setString(5, dto.getUseDate());
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
                dto.setUseDate(rs.getString("useDate"));
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

    public String soldOutList(String city, String branch, String room, String useDate){

        ArrayList<String> arr = new ArrayList<>();

        sql = "select time from reservation where city = ? and branch = ? and room = ? and useDate = ?";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, city);
            ptmt.setString(2, branch);
            ptmt.setString(3, room);
            ptmt.setString(4, useDate);

            rs = ptmt.executeQuery();
            while (rs.next()){
                arr.add(rs.getString("time"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return String.join(", ", arr);
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
                reservationDTO.setUseDate(rs.getString("useDate"));
                reservationDTO.setPay(rs.getInt("pay"));

                res.add(reservationDTO);
            }

        } catch (SQLException e) {

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
