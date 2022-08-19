package model_p;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                dto.setEvent_startdate(rs.getString("event_startdate"));
                dto.setEvent_enddate(rs.getString("event_enddate"));
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
            sql = "select max(id)+1 from eventpp";

            ptmt = con.prepareStatement(sql);
            rs = ptmt.executeQuery();
            rs.next();
            dto.id = rs.getInt(1);

            //System.out.println(dto);


            sql = "insert into eventpp (id,title,event_startdate,event_enddate,content) "
                    + "values (?,?,?,?,?)";

            ptmt =con.prepareStatement(sql);

            ptmt.setInt(1, dto.id);
            ptmt.setString(2,dto.title);
            ptmt.setString(3,dto.event_startdate);
            ptmt.setString(4,dto.event_enddate);
            ptmt.setString(5,dto.content);

            ptmt.executeUpdate();

        } catch (Exception e) {
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
                res.setEvent_startdate(rs.getString("event_startdate"));
                res.setEvent_enddate(rs.getString("event_enddate"));
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
