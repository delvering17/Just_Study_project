package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BranchDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public BranchDAO() {

        try {
            Context init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<BranchDTO> branchList() {
        ArrayList<BranchDTO> res;

        sql = "select * from branch order by name";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            res = new ArrayList<>();

            while (rs.next()) {
                BranchDTO branchDTO = new BranchDTO();
                branchDTO.setCity(rs.getString("city"));
                branchDTO.setName(rs.getString("name"));
                branchDTO.setRooms(rs.getString("rooms"));
                branchDTO.setPrice(rs.getInt("price"));
                branchDTO.setOpen(rs.getInt("open"));
                branchDTO.setClose(rs.getInt("close"));
                branchDTO.setFacilities(rs.getString("facilities"));
                branchDTO.setAddress(rs.getString("address"));
                branchDTO.setAddressDetail(rs.getString("addressDetail"));
                branchDTO.setPhone(rs.getString("phone"));
                branchDTO.setImg(rs.getString("img"));
                branchDTO.setLatitude(rs.getDouble("latitude"));
                branchDTO.setLongitude(rs.getDouble("longitude"));
                res.add(branchDTO);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return res;
    }

    public ArrayList<String> branchNameList() {
        ArrayList<String> res = new ArrayList<>();

        sql = "select name from branch";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            while(rs.next()) {
                res.add(rs.getString("name"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }

    public ArrayList<BranchDTO> branchSearchList(String filter, String word){
        ArrayList<BranchDTO> res = new ArrayList<BranchDTO>();

        sql = "select * from branch where "+filter+" like ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, "%"+word+"%");
            System.out.println(ptmt);
            rs = ptmt.executeQuery();

            while (rs.next()) {
                BranchDTO branchDTO = new BranchDTO();
                branchDTO.setCity(rs.getString("city"));
                branchDTO.setName(rs.getString("name"));
                branchDTO.setRooms(rs.getString("rooms"));
                branchDTO.setPrice(rs.getInt("price"));
                branchDTO.setOpen(rs.getInt("open"));
                branchDTO.setClose(rs.getInt("close"));
                branchDTO.setFacilities(rs.getString("facilities"));
                branchDTO.setAddress(rs.getString("address"));
                branchDTO.setAddressDetail(rs.getString("addressDetail"));
                branchDTO.setPhone(rs.getString("phone"));
                branchDTO.setImg(rs.getString("img"));

                res.add(branchDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
    }

    public BranchDTO branchDetail(String name) {
        BranchDTO branchDTO = new BranchDTO();

        sql = "select * from branch where name = ? ";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, name);
            rs = ptmt.executeQuery();

            if(rs.next()) {
                branchDTO.setCity(rs.getString("city"));
                branchDTO.setName(rs.getString("name"));
                branchDTO.setRooms(rs.getString("rooms"));
                branchDTO.setPrice(rs.getInt("price"));
                branchDTO.setOpen(rs.getInt("open"));
                branchDTO.setClose(rs.getInt("close"));
                branchDTO.setFacilities(rs.getString("facilities"));
                branchDTO.setAddress(rs.getString("address"));
                branchDTO.setAddressDetail(rs.getString("addressDetail"));
                branchDTO.setPhone(rs.getString("phone"));
                branchDTO.setImg(rs.getString("img"));

            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }


        return  branchDTO;
    }

    public BranchDTO detail(String branchName){

        BranchDTO branchDTO = new BranchDTO();

        sql = "select * from branch where name = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, branchName);

            rs = ptmt.executeQuery();
            while(rs.next()){
                branchDTO.setCity(rs.getString("city"));
                branchDTO.setName(rs.getString("name"));
                branchDTO.setRooms(rs.getString("rooms") != null ? rs.getString("rooms") : "");
                branchDTO.setPrice(rs.getInt("price"));
                branchDTO.setOpen(rs.getInt("open"));
                branchDTO.setClose(rs.getInt("close"));
                branchDTO.setFacilities(rs.getString("facilities") != null ? rs.getString("facilities") : "");
                branchDTO.setAddress(rs.getString("address") != null ? rs.getString("address") : "");
                branchDTO.setAddressDetail(rs.getString("addressDetail") != null ? rs.getString("addressDetail") : "");
                branchDTO.setPhone(rs.getString("phone") != null ? rs.getString("phone") : "");
                branchDTO.setImg(rs.getString("img") != null ? rs.getString("img") : "");
                branchDTO.setLatitude(rs.getDouble("latitude"));
                branchDTO.setLongitude(rs.getDouble("longitude"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }


        return branchDTO;
    }

    public int modify(String cityName, String branchName, BranchDTO dto){
        sql = "update branch set rooms = ?, price = ?, open = ?, close = ?, facilities = ?, address = ?, addressDetail = ?, phone = ?, img = ?, latitude = ?, longitude = ?" +
                " where city = ? and name = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, dto.getRooms());
            ptmt.setInt(2, dto.getPrice());
            ptmt.setInt(3, dto.getOpen());
            ptmt.setInt(4, dto.getClose());
            ptmt.setString(5, dto.getFacilities());
            ptmt.setString(6, dto.getAddress());
            ptmt.setString(7, dto.getAddressDetail());
            ptmt.setString(8, dto.getPhone());
            ptmt.setString(9, dto.getImg());
            ptmt.setDouble(10, dto.getLatitude());
            ptmt.setDouble(11, dto.getLongitude());
            ptmt.setString(12, cityName);
            ptmt.setString(13, branchName);


            return ptmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
          close();
        }

        return 0;
    }

    public int delete(String branchName){

        sql = "delete from branch where name = ?";

        int res;

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, branchName);

            res = ptmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return res;
    }

    public int insert(BranchDTO branchDTO){

        sql = "insert into branch (city, name, rooms, price, open, close, facilities, address, addressDetail, phone, img, latitude, longitude) values " +
                "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, branchDTO.getCity());
            ptmt.setString(2, branchDTO.getName());
            ptmt.setString(3, branchDTO.getRooms());
            ptmt.setInt(4, branchDTO.getPrice());
            ptmt.setInt(5, branchDTO.getOpen());
            ptmt.setInt(6, branchDTO.getClose());
            ptmt.setString(7, branchDTO.getFacilities());
            ptmt.setString(8, branchDTO.getAddress());
            ptmt.setString(9, branchDTO.getAddressDetail());
            ptmt.setString(10, branchDTO.getPhone());
            ptmt.setString(11, branchDTO.getImg());
            ptmt.setDouble(12, branchDTO.getLatitude());
            ptmt.setDouble(13, branchDTO.getLongitude());

            return ptmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 0;
    }

    public int imgDelete(BranchDTO branchDTO){

        sql = "update branch set img = ? where name = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, "");
            ptmt.setString(2, branchDTO.getName());

            return ptmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
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
