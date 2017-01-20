/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zappy.pmsys.beans;

import java.text.SimpleDateFormat;

/**
 *
 * @author Arun
 */
public class Monographs {
    private int pId;
    private String title;
    private String coAuthorName;
    private String publisherName;
    private int year;
    private char rtype;
    
    public void setAll(String pi[]){
        title=pi[0];
        coAuthorName=pi[1];
        publisherName=pi[2];
        year=pi[3].equals("")?0:Integer.parseInt(pi[3]);
        rtype=pi[4].equals("")?'\u0000':pi[4].charAt(0);
    }
    
    public String[] getAll(){
        String pi[]=new String[5];
        pi[0]=title==null?"":title;
        pi[1]=coAuthorName==null?"":coAuthorName;
        pi[2]=publisherName==null?"":publisherName;
        pi[3]=year==0?"":year+"";
        pi[4]=rtype=='\u0000'?"":rtype+"";
        return pi;
    }

    public char getRtype() {
        return rtype;
    }

    public void setRtype(char rtype) {
        this.rtype = rtype;
    }
    public Monographs(){
        title="";
        coAuthorName="";
        publisherName="";
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCoAuthorName() {
        return coAuthorName;
    }

    public void setCoAuthorName(String coAuthorName) {
        this.coAuthorName = coAuthorName;
    }


    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    
}
