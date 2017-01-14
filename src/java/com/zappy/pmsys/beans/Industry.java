/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zappy.pmsys.beans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Arun
 */
public class Industry {
    private int pId;
    private String organization;
    private String designation;
    private String natureOfWork;
    private Date fromDate;
    private Date toDate;
    public Industry(){
        organization="";
        designation="";
        natureOfWork="";
            }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getNatureOfWork() {
        return natureOfWork;
    }

    public void setNatureOfWork(String natureOfWork) {
        this.natureOfWork = natureOfWork;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public void setAll(String pi[]){
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        organization=pi[0];
        designation=pi[1];
        natureOfWork=pi[2];
        if(!pi[3].equals("")){
            try {
                fromDate=df.parse(pi[3]);
            } catch (ParseException ex) {
                Logger.getLogger(Industry.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if(!pi[4].equals("")){
            try {
                toDate=df.parse(pi[4]);
            } catch (ParseException ex) {
                Logger.getLogger(Industry.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
