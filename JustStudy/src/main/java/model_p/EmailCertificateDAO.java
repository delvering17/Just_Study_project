package model_p;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.Date;

public class EmailCertificateDAO {

    Connection con;
    PreparedStatement ptmt;
    ResultSet rs;
    String sql;

    public EmailCertificateDAO() {



        try {
            Context init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/qwer");
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean checkDoubleEmail(String email) {
        boolean res = false;

        sql = "select * from emailCertificate where certificate_email = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, email);
            rs = ptmt.executeQuery();

            if(rs.next()) {
                res = rs.next();

            }



        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return res;
    }


    public Date insertCertificate_num(String email, int certificate_num) {

        sql = "insert into emailCertificate value (?,?,sysdate())";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, email);
            ptmt.setInt(2, certificate_num);

            ptmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return new EmailCertificateDAO().selectCertificate_date(email);
    }

    public Date insertDoubleEmail(String email, int certificate_num) {

        sql = "Update emailCertificate set certificate_num = ?, certificate_date = sysdate() where certificate_email = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setInt(1, certificate_num);
            ptmt.setString(2, email);

            ptmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return new EmailCertificateDAO().selectCertificate_date(email);
    }

    public Date selectCertificate_date(String email) {
        Date certificate_date = null;
        sql = "select certificate_date from emailCertificate where certificate_email = ?";

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, email);
            rs = ptmt.executeQuery();

            if(rs.next()) {
                certificate_date = rs.getTimestamp("certificate_date");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }

        return certificate_date;
    }

    public boolean certificateNum(String email, int certificate_num, Date dd) {
        boolean res = false;
        sql = "select * from emailCertificate where certificate_email = ? and certificate_num = ? and certificate_date >= ?";

        Timestamp s = new Timestamp(dd.getTime());

        try {
            ptmt = con.prepareStatement(sql);
            ptmt.setString(1, email);
            ptmt.setInt(2, certificate_num);
            ptmt.setTimestamp(3,  s);
            rs = ptmt.executeQuery();

            if(rs.next()) {
                res = true;
            }

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
