package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class AdminReservDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public AdminReservDAO() {

        Context init;

        try {
            init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<AdminReservDTO> totalList() {

        ArrayList<AdminReservDTO> res = new ArrayList<AdminReservDTO>();

        sql = "select reservation.id, reservation.orderId, reservation.resDate, member.mem_userid, member" +
                ".mem_realname, reservation.city, reservation.branch, reservation.room, reservation.useDate, " +
                "reservation.time, reservation.headcount, reservation.pay, status from reservation join member on " +
                "reservation.userId = member.mem_id";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();
            while(rs.next()){
                AdminReservDTO adminReservDTO = new AdminReservDTO();

                adminReservDTO.setId(rs.getInt("id"));
                adminReservDTO.setOrderId(rs.getString("orderId"));
                adminReservDTO.setResDate(rs.getTimestamp("resDate"));
                adminReservDTO.setMem_userid(rs.getString("mem_userid"));
                adminReservDTO.setMem_realname(rs.getString("mem_realname"));
                adminReservDTO.setCity(rs.getString("city"));
                adminReservDTO.setBranch(rs.getString("branch"));
                adminReservDTO.setRoom(rs.getString("room"));
                adminReservDTO.setUseDate(rs.getString("useDate"));
                adminReservDTO.setTime(rs.getString("time"));
                adminReservDTO.setHeadcount(rs.getInt("headcount"));
                adminReservDTO.setPay(rs.getInt("pay"));
                adminReservDTO.setStatus(rs.getString("status"));

                res.add(adminReservDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;

    }

    public ArrayList<AdminReservDTO> listFilter(String filter, String word) {

        ArrayList<AdminReservDTO> res = new ArrayList<AdminReservDTO>();

        sql = "select reservation.id, reservation.orderId, reservation.resDate, member.mem_userid, member" +
                ".mem_realname, reservation.city, reservation.branch, reservation.room, reservation.useDate, " +
                "reservation.time, reservation.headcount, reservation.pay, status from reservation join member on " +
                "reservation.userId = member.mem_id where "+filter+" like ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, "%"+word+"%");
            rs = ptmt.executeQuery();
            while(rs.next()){
                AdminReservDTO adminReservDTO = new AdminReservDTO();

                adminReservDTO.setId(rs.getInt("id"));
                adminReservDTO.setOrderId(rs.getString("orderId"));
                adminReservDTO.setResDate(rs.getTimestamp("resDate"));
                adminReservDTO.setMem_userid(rs.getString("mem_userid"));
                adminReservDTO.setMem_realname(rs.getString("mem_realname"));
                adminReservDTO.setCity(rs.getString("city"));
                adminReservDTO.setBranch(rs.getString("branch"));
                adminReservDTO.setRoom(rs.getString("room"));
                adminReservDTO.setUseDate(rs.getString("useDate"));
                adminReservDTO.setTime(rs.getString("time"));
                adminReservDTO.setHeadcount(rs.getInt("headcount"));
                adminReservDTO.setPay(rs.getInt("pay"));
                adminReservDTO.setStatus(rs.getString("status"));

                res.add(adminReservDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;

    }


        public void close() {
        if (rs != null) try {
            rs.close();
        } catch (SQLException e) {
        }
        if (ptmt != null) try {
            ptmt.close();
        } catch (SQLException e) {
        }
        if (con != null) try {
            con.close();
        } catch (SQLException e) {
        }
    }
}
