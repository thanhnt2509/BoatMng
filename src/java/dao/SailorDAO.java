/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connectDB.DBUtils;
import dto.Sailors;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Legion
 */
public class SailorDAO {

    public static Sailors login(String sName, String password) throws Exception {
        Sailors sailor = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select [sid],[sname],[password],[rating],[age]\n"
                    + "from [dbo].[sailors]\n"
                    + "where sname=? and password=? COLLATE Latin1_General_CS_AS";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, sName);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int sid = rs.getInt("sid");
                int rating = rs.getInt("rating");
                int age = rs.getInt("age");
                sailor = new Sailors(sid, sName, password, rating, age);
            }
            cn.close();
        }
        return sailor;
    }
    public static boolean register(String username, String pass, String rating, String age) throws Exception {
        boolean result = false;
        Connection conn = DBUtils.makeConnection();
        if (conn != null) {
            String sql = "insert into [dbo].[sailors]([sname],[password],[rating],[age])\n"
                    + "values(?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, pass);
            pst.setString(3, rating);
            pst.setString(4, age);
            
            result = pst.executeUpdate() == 1;
            
            conn.close();
        }
        return result;
    }
}
