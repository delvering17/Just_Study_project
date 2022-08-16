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
        ArrayList<BranchDTO> res ;

        sql = "select * from branch ";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            res = new ArrayList<>();

            while(rs.next()) {
                BranchDTO branchDTO = new BranchDTO();
                branchDTO.setCity(rs.getString("city"));
                branchDTO.setName(rs.getString("name"));
                branchDTO.setRooms(rs.getString("rooms"));
                branchDTO.setPrice(rs.getInt("price"));
                branchDTO.setOpen(rs.getInt("open"));
                branchDTO.setClose(rs.getInt("close"));
                branchDTO.setFacilities(rs.getString("facilities"));
                branchDTO.setAddress(rs.getString("address"));
                branchDTO.setPhone(rs.getString("phone"));
                branchDTO.setImg(rs.getString("img"));

                res.add(branchDTO);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return res;
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
                branchDTO.setPhone(rs.getString("phone") != null ? rs.getString("phone") : "");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }


        return branchDTO;
    }

    public int modify(String cityName, String branchName, BranchDTO dto){
        sql = "update branch set rooms = ?, price = ?, open = ?, close = ?, facilities = ?, address = ?, phone = ? " +
                "where city = ? and name = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, dto.getRooms());
            ptmt.setInt(2, dto.getPrice());
            ptmt.setInt(3, dto.getOpen());
            ptmt.setInt(4, dto.getClose());
            ptmt.setString(5, dto.getFacilities());
            ptmt.setString(6, dto.getAddress());
            ptmt.setString(7, dto.getPhone());
            ptmt.setString(8, cityName);
            ptmt.setString(9, branchName);

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



    public void close() {
        if(rs!=null) try { rs.close(); } catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close(); } catch (SQLException e) {}
        if(con!=null) try { con.close(); } catch (SQLException e) {}
    }

}
