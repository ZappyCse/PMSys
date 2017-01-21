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
public class WorkshopSeminarDetails {
    
    private int pId;
    private String programmeName;
    private String organizedBy;
    private Date fromDate;
    private Date toDate;
    private int duration;
    private char region;
    private char rtype;
    
    public String[] getAll(){
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String[] pi=new String[7];
        pi[0]=programmeName==null?"":programmeName;
        pi[1]=organizedBy==null?"":organizedBy;
        pi[2]=fromDate==null?"":dateFormat.format(fromDate);
        pi[3]=toDate==null?"":dateFormat.format(toDate);
        pi[4]=duration==0?"":duration+"";
        pi[5]=region=='\u0000'?"":region+"";
        pi[6]=rtype=='\u0000'?"":rtype+"";
        return pi;
    }
    
    public void setAll(String pi[]){
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        programmeName=pi[0];
        organizedBy=pi[1];
        if(!pi[2].equals("")){
            try {
                fromDate=df.parse(pi[2]);
            } catch (ParseException ex) {
                Logger.getLogger(Industry.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else
            fromDate=null;
        if(!pi[3].equals("")){
            try {
                toDate=df.parse(pi[3]);
            } catch (ParseException ex) {
                Logger.getLogger(Industry.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else
            toDate=null;
        duration=pi[4].equals("")?0:Integer.parseInt(pi[4]);
        region=pi[5].equals("")?'\u0000':pi[5].charAt(0);
        rtype=pi[6].equals("")?'\u0000':pi[6].charAt(0);
    }
    
    public char getRegion() {
        return region;
    }

    public void setRegion(char region) {
        this.region = region;
    }
    
    public WorkshopSeminarDetails(){
        programmeName="";
        organizedBy="";
        rtype='\u0000';
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getProgrammeName() {
        return programmeName;
    }

    public void setProgrammeName(String programmeName) {
        this.programmeName = programmeName;
    }

    public String getOrganizedBy() {
        return organizedBy;
    }

    public void setOrganizedBy(String organizedBy) {
        this.organizedBy = organizedBy;
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
