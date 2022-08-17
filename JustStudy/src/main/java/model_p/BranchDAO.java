package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
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

        sql = "select * from branch ";

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


    public void close() {
        if(rs!=null) try { rs.close(); } catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close(); } catch (SQLException e) {}
        if(con!=null) try { con.close(); } catch (SQLException e) {}
    }

}
