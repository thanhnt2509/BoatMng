/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;

/**
 *
 * @author Legion
 */
public class Boats implements Serializable{
    private int bid;
    private String bName;
    private String bColor;

    public Boats() {
    }

    public Boats(int bid, String bName, String bColor) {
        this.bid = bid;
        this.bName = bName;
        this.bColor = bColor;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName;
    }

    public String getbColor() {
        return bColor;
    }

    public void setbColor(String bColor) {
        this.bColor = bColor;
    }
    
}
