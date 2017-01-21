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
public class Experience {
    private int pId;
    private String instituteName;
    private String designation;
    private String natureOfWork;
    private Date fromDate;
    private Date toDate;
    public Experience(){
        instituteName="";
        designation="";
        natureOfWork="";                
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }
    
    public String getInstituteName() {
        return instituteName;
    }

    public void setInstituteName(String instituteName) {
        this.instituteName = instituteName;
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

    public void setFromDate(Date from) {
        this.fromDate = from;
    }

    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date to) {
        this.toDate = to;
    }

    public void setAll(String pi[]){
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        instituteName=pi[0];
        designation=pi[1];
        natureOfWork=pi[2];
        if(!pi[3].equals("")){
            try {
                fromDate=df.parse(pi[3]);
            } catch (ParseException ex) {
                Logger.getLogger(Industry.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else
            fromDate=null;
        if(!pi[4].equals("")){
            try {
                toDate=df.parse(pi[4]);
            } catch (ParseException ex) {
                Logger.getLogger(Industry.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else
            toDate=null;
    }
    
    public String[] getAll(){
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String[] pi=new String[5];
        pi[0]=instituteName==null?"":instituteName;
        pi[1]=designation==null?"":designation;
        pi[2]=natureOfWork==null?"":natureOfWork;
        pi[3]=fromDate==null?"":dateFormat.format(fromDate);
        pi[4]=toDate==null?"":dateFormat.format(toDate);
        return pi;
    }
}
