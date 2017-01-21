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
public class Responsibilities {
    private int pId;
    private String workDetails;

    public Responsibilities() {
        this.workDetails = "";
        this.workAllottedBy = "";
    }
    private String workAllottedBy;
    private Date fromDate;
    private Date toDate;
    private int duration;
    private char rtype;
    
    public String[] getAll(){
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        String pi[]=new String[6];
        pi[0]=workDetails==null?"":workDetails;
        pi[1]=workAllottedBy==null?"":workAllottedBy;
        pi[2]=fromDate==null?"":df.format(fromDate);
        pi[3]=toDate==null?"":df.format(toDate);
        pi[4]=duration==0?"":duration+"";
        pi[5]=rtype=='\u0000'?"":rtype+"";
        return pi;
    }
    
    public void setAll(String pi[]){
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        workDetails=pi[0];
        workAllottedBy=pi[1];
        try {
            if(!pi[2].equals(""))
                fromDate=df.parse(pi[2]);
            else
                fromDate=null;
            if(!pi[3].equals(""))
                toDate=df.parse(pi[3]);
            else
                toDate=null;
        } catch (ParseException ex) {
            Logger.getLogger(Responsibilities.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(!pi[4].equals(""))
            duration=Integer.parseInt(pi[4]);
        else
            duration=0;
        if(!pi[5].equals(""))
            rtype=pi[5].charAt(0);
        else
            rtype='\u0000';
    }
    
    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getWorkDetails() {
        return workDetails;
    }

    public void setWorkDetails(String workDetails) {
        this.workDetails = workDetails;
    }

    public String getWorkAllottedBy() {
        return workAllottedBy;
    }

    public void setWorkAllottedBy(String workAllottedBy) {
        this.workAllottedBy = workAllottedBy;
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

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public char getRtype() {
        return rtype;
    }

    public void setRtype(char rtype) {
        this.rtype = rtype;
    }

}
