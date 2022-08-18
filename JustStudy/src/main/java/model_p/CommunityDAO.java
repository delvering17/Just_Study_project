package model_p;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
                dto.setLocation(rs.getString("location"));
                dto.setStartdate(rs.getString("startdate"));
                dto.setEnddate(rs.getString("enddate"));
                dto.setTitle(rs.getString("title"));
                dto.setPname(rs.getString("pname"));
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


            sql = "insert into studygroup (id,location,startdate,enddate,title, pname,people,studykind,content) "
                    + "values (?,?,?,?,?,?,?,?,?)";

            ptmt =con.prepareStatement(sql);
            ptmt.setInt(1, dto.id);
            ptmt.setString(2, dto.location);
            ptmt.setString(3, dto.startdate);
            ptmt.setString(4, dto.enddate);
            ptmt.setString(5, dto.title);
            ptmt.setString(6, dto.pname);
            ptmt.setInt(7,dto.people);
            ptmt.setString(8, dto.studykind);
            ptmt.setString(9, dto.content);

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
                res.setTitle(rs.getString("location"));
                res.setStartdate(rs.getString("startdate"));
                res.setEnddate(rs.getString("enddate"));
                res.setTitle(rs.getString("title"));
                res.setPname(rs.getString("pname"));
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
