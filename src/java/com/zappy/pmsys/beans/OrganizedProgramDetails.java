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
public class OrganizedProgramDetails {
    private int pId;
    private String programmeName;
    private String sponsoredBy;
    private String actedAs;
    private Date fromDate;
    private Date toDate;
    private int duration;
    private String convener;
    private char region;
    private char rtype;
    
    public String[] getAll(){
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String[] pi=new String[9];
        pi[0]=programmeName==null?"":programmeName;
        pi[1]=sponsoredBy==null?"":sponsoredBy;
        pi[2]=actedAs==null?"":actedAs;
        pi[3]=fromDate==null?"":dateFormat.format(fromDate);
        pi[4]=toDate==null?"":dateFormat.format(toDate);
        pi[5]=duration==0?"":duration+"";
        pi[6]=convener==null?"":convener;
        pi[7]=region=='\u0000'?"":region+"";
        pi[8]=rtype=='\u0000'?"":rtype+"";
        return pi;
    }
    
    public void setAll(String pi[]){
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        programmeName=pi[0];
        sponsoredBy=pi[1];
        actedAs=pi[2];
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
        duration=pi[5].equals("")?0:Integer.parseInt(pi[5]);
        convener=pi[6];
        region=pi[7].equals("")?'\u0000':pi[7].charAt(0);
        rtype=pi[8].equals("")?'\u0000':pi[8].charAt(0);
    }
    
    public char getRegion() {
        return region;
    }

    public void setRegion(char region) {
        this.region = region;
    }

    public char getRtype() {
        return rtype;
    }

    public void setRtype(char rtype) {
        this.rtype = rtype;
    }
    
    public OrganizedProgramDetails(){
        programmeName="";
        sponsoredBy="";
        actedAs="";
        convener="";
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

    public String getSponsoredBy() {
        return sponsoredBy;
    }

    public void setSponsoredBy(String sponsoredBy) {
        this.sponsoredBy = sponsoredBy;
    }

    public String getActedAs() {
        return actedAs;
    }

    public void setActedAs(String actedAs) {
        this.actedAs = actedAs;
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

    public String getConvener() {
        return convener;
    }

    public void setConvener(String convener) {
        this.convener = convener;
    }
    
}
