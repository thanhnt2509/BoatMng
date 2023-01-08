/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Legion
 */
public class Reserves implements Serializable{
    private int sid;
    private int bid;
    private Date day;

    public Reserves() {
    }

    public Reserves(int sid, int bid, Date day) {
        this.sid = sid;
        this.bid = bid;
        this.day = day;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }
    
}
