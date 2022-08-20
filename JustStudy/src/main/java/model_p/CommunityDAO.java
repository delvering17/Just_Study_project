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
                dto.setRegDate(rs.getDate("regDate"));
                dto.setOpenChatting(rs.getString("openChatting"));

                res.add(dto);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }finally {
            close();
        }

        return res;
    }

    public void insert(CommunityDTO communityDTO) {

        try {
            sql = "select max(id)+1 from studygroup";

            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();
            rs.next();
            communityDTO.id = rs.getInt(1);

            //System.out.println(dto);


            sql = "insert into studygroup (id,memId,location,startdate,enddate,title,people,studykind,content,regDate,openChatting) "
                    + "values (?,?,?,?,?,?,?,?,?,sysdate(),?)";

            ptmt =con.prepareStatement(sql);
            ptmt.setInt(1, communityDTO.getId());
            ptmt.setInt(2, communityDTO.getMemId());
            ptmt.setString(3, communityDTO.getLocation());
            ptmt.setDate(4, new java.sql.Date(communityDTO.getStartdate().getTime()));
            ptmt.setDate(5, new java.sql.Date(communityDTO.getEnddate().getTime()));
            ptmt.setString(6, communityDTO.getTitle());
            ptmt.setInt(7,communityDTO.getPeople());
            ptmt.setString(8, communityDTO.getStudykind());
            ptmt.setString(9, communityDTO.getContent());
            ptmt.setString(10, communityDTO.getOpenChatting());

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
                res.setRegDate(rs.getDate("regDate"));
                res.setOpenChatting(rs.getString("openChatting"));

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            close();
        }

        return res;
    }

    public int modify(CommunityDTO communityDTO){

        sql = "update studygroup set location = ?, startdate = ?, enddate = ?, title = ?, people = ?, studykind = ?, content = ?, openChatting = ? where id = ?";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, communityDTO.getLocation());
            ptmt.setDate(2, new java.sql.Date(communityDTO.getStartdate().getTime()));
            ptmt.setDate(3, new java.sql.Date(communityDTO.getEnddate().getTime()));
            ptmt.setString(4, communityDTO.getTitle());
            ptmt.setInt(5,communityDTO.getPeople());
            ptmt.setString(6, communityDTO.getStudykind());
            ptmt.setString(7, communityDTO.getContent());
            ptmt.setInt(8, communityDTO.getId());
            ptmt.setString(9, communityDTO.getOpenChatting());

            return ptmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
    }

    public int delete(int id) {
        sql = "delete from studygroup where id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, id);

            return ptmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return 0;
    }

    public ArrayList<CommunityDTO> makedList(int id){

        ArrayList<CommunityDTO> res = new ArrayList<CommunityDTO>();

        sql = "select * from studygroup where memId = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, id);
            rs = ptmt.executeQuery();

            while(rs.next()){
                CommunityDTO communityDTO = new CommunityDTO();

                communityDTO.setId(rs.getInt("id"));
                communityDTO.setMemId(rs.getInt("memId"));
                communityDTO.setLocation(rs.getString("location"));
                communityDTO.setStartdate(rs.getDate("startdate"));
                communityDTO.setEnddate(rs.getDate("enddate"));
                communityDTO.setTitle(rs.getString("title"));
                communityDTO.setPeople(rs.getInt("people"));
                communityDTO.setStudykind(rs.getString("studykind"));
                communityDTO.setContent(rs.getString("content"));
                communityDTO.setRegDate(rs.getDate("regDate"));
                communityDTO.setOpenChatting(rs.getString("openChatting"));

                res.add(communityDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return res;
    }

    public int applyAnswer(int as_id, int answer){

        sql = "update applystudy set as_state = ? where as_id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, answer);
            ptmt.setInt(2, as_id);

            return ptmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return 0;
    }


    public void close() {
        if(rs!=null) try {rs.close();} catch (SQLException e) {}
        if(ptmt!=null) try { ptmt.close();} catch (SQLException e) {}
        if(con!=null) try { con.close();} catch (SQLException e) {}
    }
}
