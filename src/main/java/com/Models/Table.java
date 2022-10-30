/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Models;

/**
 *
 * @author vhqua
 */
public class Table {
    private String Table_ID;
    private String T_Status;

    public Table(String Table_ID, String T_Status) {
        this.Table_ID = Table_ID;
        this.T_Status = T_Status;
    }

    public String getTable_ID() {
        return Table_ID;
    }

    public void setTable_ID(String Table_ID) {
        this.Table_ID = Table_ID;
    }

    public String getT_Status() {
        return T_Status;
    }

    public void setT_Status(String T_Status) {
        this.T_Status = T_Status;
    }
    
    
}
