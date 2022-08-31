package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;


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

        sql = "select reservation.id, reservation.orderId, reservation.resDate, member.mem_userid, member.mem_nickname, member" +
                ".mem_realname, reservation.city, reservation.branch, reservation.room, reservation.useDate, " +
                "reservation.time, reservation.headcount, reservation.pay, status, cancel_reason from reservation left outer join member on " +
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
                adminReservDTO.setMem_nickname(rs.getString("mem_nickname"));
                adminReservDTO.setMem_realname(rs.getString("mem_realname"));
                adminReservDTO.setCity(rs.getString("city"));
                adminReservDTO.setBranch(rs.getString("branch"));
                adminReservDTO.setRoom(rs.getString("room"));
                adminReservDTO.setUseDate(rs.getDate("useDate"));
                adminReservDTO.setTime(rs.getString("time"));
                adminReservDTO.setHeadcount(rs.getInt("headcount"));
                adminReservDTO.setPay(rs.getInt("pay"));
                adminReservDTO.setStatus(rs.getString("status"));
                adminReservDTO.setCancelReason(rs.getString("cancel_reason"));

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
                adminReservDTO.setUseDate(rs.getDate("useDate"));
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

    public ArrayList<AdminReservDTO> userSalesList(){

        ArrayList<AdminReservDTO> res = new ArrayList<AdminReservDTO>();

        sql="select mem_userid, mem_realname, mem_nickname, city, branch, time, room, useDate, pay from reservation" +
                " join member on reservation.userId = member.mem_id where status='결제완료'";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();
            while(rs.next()){
                AdminReservDTO adminReservDTO = new AdminReservDTO();
                adminReservDTO.setMem_userid(rs.getString("mem_userid"));
                adminReservDTO.setMem_realname(rs.getString("mem_realname"));
                adminReservDTO.setMem_nickname(rs.getString("mem_nickname"));
                adminReservDTO.setCity(rs.getString("city"));
                adminReservDTO.setBranch(rs.getString("branch"));
                adminReservDTO.setTime(rs.getString("time"));
                adminReservDTO.setRoom(rs.getString("room"));
                adminReservDTO.setUseDate(rs.getDate("useDate"));
                adminReservDTO.setPay(rs.getInt("pay"));


                res.add(adminReservDTO);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            close();
        }

        return res;
    }

    public ArrayList<AdminReservDTO> viewStoreDetails(String city, String branch, LocalDate useDate) {

        ArrayList<AdminReservDTO> res = new ArrayList<AdminReservDTO>();

        sql = "select reservation.id, reservation.orderId, reservation.resDate, member.mem_userid, member" +
                ".mem_realname, reservation.city, reservation.branch, reservation.room, reservation.useDate, " +
                "reservation.time, reservation.headcount, reservation.pay, status from reservation left outer join member on " +
                "reservation.userId = member.mem_id where city = ? and branch = ? and useDate = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, city);
            ptmt.setString(2, branch);
            ptmt.setDate(3, java.sql.Date.valueOf(useDate));

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
                adminReservDTO.setUseDate(rs.getDate("useDate"));
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

    public ArrayList<AdminReservDTO> salesUserDetailSearch(String filter, String id, String city, String branch, java.sql.Date sqlUseStartDate, java.sql.Date sqlUseEndDate){

        ArrayList<AdminReservDTO> res = new ArrayList<AdminReservDTO>();
        String cityFilter = "";
        String branchFilter = "";
        String useDateFilter = "";

        if(!city.equals("전체")){
            cityFilter = "and city = ?";
        }

        if(!branch.equals("전체")){
            branchFilter = "and branch = ?";
        }

        if(sqlUseStartDate!=null && sqlUseEndDate!=null){
            useDateFilter = "and useDate >= ? and useDate <= ?";
        }

        sql="select mem_userid, mem_realname, mem_nickname, city, branch, time, room, useDate, pay from reservation join member on " +
                "reservation.userId = member.mem_id where status = '결제완료' and "+filter+" like ?"+cityFilter+" "+branchFilter+" "+useDateFilter+" ";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, "%"+id+"%");

            if(!city.equals("전체")){
                ptmt.setString(2, city);
            }
            if(!branch.equals("전체")){
                ptmt.setString(3, branch);
            }

            if(city.equals("전체") && branch.equals("전체") && sqlUseStartDate!=null && sqlUseEndDate!=null){
                ptmt.setDate(2, sqlUseStartDate);
                ptmt.setDate(3, sqlUseEndDate);
            }else if(branch.equals("전체") && sqlUseStartDate!=null && sqlUseEndDate!=null){
                ptmt.setDate(3, sqlUseStartDate);
                ptmt.setDate(4, sqlUseEndDate);
            }else if(!city.equals("전체") && !branch.equals("전체") && sqlUseStartDate!=null && sqlUseEndDate!=null){
                ptmt.setDate(4, sqlUseStartDate);
                ptmt.setDate(5, sqlUseEndDate);
            }

            rs = ptmt.executeQuery();
            while(rs.next()){
                AdminReservDTO adminReservDTO = new AdminReservDTO();
                adminReservDTO.setMem_userid(rs.getString("mem_userid"));
                adminReservDTO.setMem_realname(rs.getString("mem_realname"));
                adminReservDTO.setMem_nickname(rs.getString("mem_nickname"));
                adminReservDTO.setCity(rs.getString("city"));
                adminReservDTO.setBranch(rs.getString("branch"));
                adminReservDTO.setTime(rs.getString("time"));
                adminReservDTO.setRoom(rs.getString("room"));
                adminReservDTO.setUseDate(rs.getDate("useDate"));
                adminReservDTO.setPay(rs.getInt("pay"));

                res.add(adminReservDTO);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            close();
        }
        return res;
    }

    public ArrayList<AdminReservDTO> salesStorefilter(String city, String branch, String startDate, String endDate, String month, String year) {

        ArrayList<AdminReservDTO> res = new ArrayList<AdminReservDTO>();

        sql = "select city, branch, useDate, pay where "+city+" "+branch+" "+startDate+" "+endDate+" like ?";


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
                adminReservDTO.setUseDate(rs.getDate("useDate"));
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

    public ArrayList<AdminReservDTO> salesStoreList(String city, String branch, String period, java.util.Date startDate, Date endDate, String filter, String word){

        ArrayList<AdminReservDTO> res = new ArrayList<AdminReservDTO>();

        sql = "select id, orderId, resDate, ifnull(member.mem_userid, '회원정보없음') AS mem_userid, IFNULL(member.mem_nickname, '회원정보없음') " +
                "AS mem_nickname, ifnull(member.mem_realname, '회원정보없음') AS mem_realname, reservation.city, " +
                "reservation.branch, reservation.room, reservation.useDate, " +
                "reservation.time, reservation.pay, reservation.headcount, reservation.status from reservation left outer join member on " +
                "reservation.userId = member.mem_id where city = ? and branch = ? and reservation.status = '결제완료'";

        if(period!=null) {
            sql += " and useDate >= ? and useDate < ?";
        }

        if(filter!=null){
            sql += " and "+filter+" like ?";
        }

        try {
            ptmt = con.prepareStatement(sql);
                ptmt.setString(1, city);
                ptmt.setString(2, branch);

                if(period!=null){
                    ptmt.setDate(3, new java.sql.Date(startDate.getTime()));
                    ptmt.setDate(4, new java.sql.Date(endDate.getTime()));
                }

                if(period == null & filter!=null){
                    ptmt.setString(3,"%"+word+"%");
                } else if(period != null & filter!=null){
                    ptmt.setString(5,"%"+word+"%");
                }

            rs = ptmt.executeQuery();
            while(rs.next()){
                AdminReservDTO adminReservDTO = new AdminReservDTO();
                adminReservDTO.setId(rs.getInt("id"));
                adminReservDTO.setOrderId(rs.getString("orderId"));
                adminReservDTO.setResDate(rs.getDate("resDate"));
                adminReservDTO.setMem_userid(rs.getString("mem_userid"));
                adminReservDTO.setMem_realname(rs.getString("mem_realname"));
                adminReservDTO.setMem_nickname(rs.getString("mem_nickname"));
                adminReservDTO.setCity(rs.getString("city"));
                adminReservDTO.setBranch(rs.getString("branch"));
                adminReservDTO.setRoom(rs.getString("room"));
                adminReservDTO.setUseDate(rs.getDate("useDate"));
                adminReservDTO.setUseDate(rs.getDate("useDate"));
                adminReservDTO.setTime(rs.getString("time"));
                adminReservDTO.setHeadcount(rs.getInt("headcount"));
                adminReservDTO.setPay(rs.getInt("pay"));
                adminReservDTO.setStatus(rs.getString("status"));

                res.add(adminReservDTO);
            }

            return res;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return null;
    }


        public void close() {
        if (rs != null) try {rs.close();} catch (SQLException e) {}
        if (ptmt != null) try {ptmt.close();} catch (SQLException e) {}
        if (con != null) try {con.close();} catch (SQLException e) {}
    }
}
