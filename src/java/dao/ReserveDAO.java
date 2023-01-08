/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connectDB.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Legion
 */
public class ReserveDAO {

    public static boolean validate(int sid, int bid) throws Exception {
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select [sid],[bid]\n"
                    + "from [dbo].[reserves]\n"
                    + "where [sid]=? and [bid]=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, sid);
            pst.setInt(2, bid);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                return false;
            }
        }
        return true;
    }

    public static boolean makeReserve(int sid, int bid, String day) throws Exception {
        boolean result = false;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "insert into [dbo].[reserves]([sid],[bid],[day])\n"
                    + "values (?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, sid);
            pst.setInt(2, bid);
            pst.setString(3, day);
            try {
                result = pst.executeUpdate() == 1;
            } catch (SQLException e) {
                return false;
            }
            cn.close();
        }
        return result;
    }
}
