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
                res.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return res;
    }

    public void addReservation(ReservationDTO dto){
        sql = "insert into reservation(city, branch, room, resDate, time, headcount, pay) values" +
                "(?, ?, ?, ?, ?, ?, ?)";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, dto.getCity());
            ptmt.setString(2, dto.getBranch());
            ptmt.setString(3, dto.getRoom());
            ptmt.setString(4, dto.getResDate());
            ptmt.setString(5, dto.getTime());
            ptmt.setInt(6, dto.getHeadcount());
            ptmt.setInt(7, dto.getPay());

            ptmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

    }

    public void close() {
        if(rs!=null) try { rs.close(); } catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close(); } catch (SQLException e) {}
        if(con!=null) try { con.close(); } catch (SQLException e) {}
    }
}
