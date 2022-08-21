package model_p;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class EventDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;



    public EventDAO(){
        Context init;

        try {
            init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<EventDTO> list(){
        ArrayList<EventDTO> res = new ArrayList<EventDTO>();

        sql = "select * from eventpp";

        try {
            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();

            while(rs.next()) {
                EventDTO dto = new EventDTO();

                dto.setId(rs.getInt("id"));
                dto.setTitle(rs.getString("title"));
                dto.setReg_date(rs.getTimestamp("reg_date"));
                dto.setEvent_startdate(rs.getTimestamp("event_startdate"));
                dto.setEvent_enddate(rs.getTimestamp("event_enddate"));
                dto.setImg(rs.getString("img"));
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


    public void insert(EventDTO dto) {

        try {


            sql = "insert into eventpp (title,reg_date,event_startdate,event_enddate,content,img) "
                    + "values (?,sysdate(),?,?,?,?)";

            ptmt =con.prepareStatement(sql);


            ptmt.setString(1,dto.title);
            ptmt.setDate(2, new java.sql.Date(dto.getEvent_startdate().getTime()));
            ptmt.setDate(3, new java.sql.Date(dto.getEvent_enddate().getTime()));
            ptmt.setString(4,dto.content);
            ptmt.setString(5,dto.img);

            ptmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close();
        }


    }

    public EventDTO detail(int id) {
        EventDTO res = null;

        sql = "select * from eventpp where id = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, id);
            rs = ptmt.executeQuery(); //실행~

            if(rs.next()) { // rs가 존재한다면~ 가지고 나가거라~(pw를 제외하고 다 가져옴)
                res = new EventDTO();
                res.setId(rs.getInt("id"));
                res.setTitle(rs.getString("title"));
                res.setEvent_startdate(rs.getDate("event_startdate"));
                res.setEvent_enddate(rs.getDate("event_enddate"));
                res.setContent(rs.getString("content"));
                res.setImg(rs.getString("img"));
                System.out.println(res.getImg());
            }


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            close();
        }

        return res;
    }


    public int modify(EventDTO dto, String img){

        sql = "update eventpp set title = ?, event_startdate = ?, event_enddate = ?, content = ?, img = ? where id = ?";
        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, dto.getTitle());
            ptmt.setDate(2,new java.sql.Date(dto.getEvent_startdate().getTime()));
            ptmt.setDate(3, new java.sql.Date(dto.getEvent_enddate().getTime()));
            ptmt.setString(4, dto.getContent());
            ptmt.setString(5, dto.getImg());
            ptmt.setInt(6, dto.id);


            return ptmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
    }

    public int delete(int id) {

        try {
            sql = "delete from eventpp where id = ?";

            ptmt =con.prepareStatement(sql);
            ptmt.setInt(1, id);
            return ptmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
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
