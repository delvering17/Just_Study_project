package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class CommunityDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public CommunityDAO(){
        Context init;

        try {
            init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<CommunityDTO> list(){
        ArrayList<CommunityDTO> res = new ArrayList<CommunityDTO>();

        sql = "select * from studygroup";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            while(rs.next()) {
                CommunityDTO dto = new CommunityDTO();

                dto.setId(rs.getInt("id"));
                dto.setMemId(rs.getInt("memId"));
                dto.setLocation(rs.getString("location"));
                dto.setStartdate(rs.getDate("startdate"));
                dto.setEnddate(rs.getDate("enddate"));
                dto.setTitle(rs.getString("title"));
                dto.setPeople(rs.getInt("people"));
                dto.setStudykind(rs.getString("studykind"));
                dto.setContent(rs.getString("content"));

                res.add(dto);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }finally {
            close();
        }

        return res;
    }

    public void insert(CommunityDTO dto) {

        try {
            sql = "select max(id)+1 from studygroup";

            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();
            rs.next();
            dto.id = rs.getInt(1);

            //System.out.println(dto);


            sql = "insert into studygroup (id,memId,location,startdate,enddate,title,people,studykind,content) "
                    + "values (?,?,?,?,?,?,?,?,?)";

            ptmt =con.prepareStatement(sql);
            ptmt.setInt(1, dto.getId());
            ptmt.setInt(2, dto.getMemId());
            ptmt.setString(3, dto.getLocation());
            ptmt.setDate(4, (Date) dto.getStartdate());
            ptmt.setDate(5, (Date) dto.getEnddate());
            ptmt.setString(6, dto.getTitle());
            ptmt.setInt(7,dto.getPeople());
            ptmt.setString(8, dto.getStudykind());
            ptmt.setString(9, dto.getContent());

            ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }


    }


    public CommunityDTO detail(int id) {
        CommunityDTO res = null;

        sql = "select * from studygroup where id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, id);
            rs = ptmt.executeQuery(); //실행~

            if(rs.next()) { // rs가 존재한다면~ 가지고 나가거라~(pw를 제외하고 다 가져옴)
                res = new CommunityDTO();
                res.setId(rs.getInt("id"));
                res.setMemId(rs.getInt("memId"));
                res.setLocation(rs.getString("location"));
                res.setStartdate(rs.getDate("startdate"));
                res.setEnddate(rs.getDate("enddate"));
                res.setTitle(rs.getString("title"));
                res.setPeople(rs.getInt("people"));
                res.setStudykind(rs.getString("studykind"));
                res.setContent(rs.getString("content"));

            }


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            close();
        }

        return res;
    }



    public void close() {
        if(rs!=null) try {rs.close();} catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close();} catch (SQLException e) {}
        if(con!=null) try { con.close();} catch (SQLException e) {}
    }


}
