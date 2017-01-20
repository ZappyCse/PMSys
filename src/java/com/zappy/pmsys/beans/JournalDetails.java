/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zappy.pmsys.beans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Arun
 */
public class JournalDetails {
    private int pId;
    private String researchTitle;
    private String coauthorNames;
    private String publisherJournalName;
    private String month;
    private int year;
    private String doi;
    private String issn;
    private float ifNumber;
    private float sjrNumber;
    private float snipNumber;
    private float hIndex;
    private float kIndex;
    private char region;
    private char rtype;
    
    public void setAll(String pi[]){
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        researchTitle=pi[0];
        coauthorNames=pi[1];
        publisherJournalName=pi[2];
        month=pi[3];
        year=pi[4].equals("")?0:Integer.parseInt(pi[4]);
        doi=pi[5];
        issn=pi[6];
        ifNumber=pi[7].equals("")?0f:Float.parseFloat(pi[7]);
        sjrNumber=pi[8].equals("")?0f:Float.parseFloat(pi[8]);
        snipNumber=pi[9].equals("")?0f:Float.parseFloat(pi[9]);
        hIndex=pi[10].equals("")?0f:Float.parseFloat(pi[10]);
        kIndex=pi[11].equals("")?0f:Float.parseFloat(pi[11]);
        region=pi[12].equals("")?'\u0000':pi[12].charAt(0);
        rtype=pi[13].equals("")?'\u0000':pi[13].charAt(0);
    }
    
    public String[] getAll(){
        String pi[]=new String[14];
        pi[0]=researchTitle==null?"":researchTitle;
        pi[1]=coauthorNames==null?"":coauthorNames;
        pi[2]=publisherJournalName==null?"":publisherJournalName;
        pi[3]=month==null?"":month;
        pi[4]=year==0?"":year+"";
        pi[5]=doi==null?"":doi;
        pi[6]=issn==null?"":issn;
        pi[7]=((int)ifNumber)==0?"":ifNumber+"";
        pi[8]=((int)sjrNumber)==0?"":sjrNumber+"";
        pi[9]=((int)snipNumber)==0?"":snipNumber+"";
        pi[10]=((int)hIndex)==0?"":hIndex+"";
        pi[11]=((int)kIndex)==0?"":kIndex+"";
        pi[12]=region=='\u0000'?"":region+"";
        pi[13]=rtype=='\u0000'?"":rtype+"";
        return pi;
    }
    public float getkIndex() {
        return kIndex;
    }

    public void setkIndex(float kIndex) {
        this.kIndex = kIndex;
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
    
    public JournalDetails(){
        researchTitle="";
        coauthorNames="";
        publisherJournalName="";
        month="";
        doi="";
        issn="";
        
    }

    public String getResearchTitle() {
        return researchTitle;
    }

    public void setResearchTitle(String researchTitle) {
        this.researchTitle = researchTitle;
    }

    public String getCoauthorNames() {
        return coauthorNames;
    }

    public void setCoauthorNames(String coauthorNames) {
        this.coauthorNames = coauthorNames;
    }

    public String getPublisherJournalName() {
        return publisherJournalName;
    }

    public void setPublisherJournalName(String publisherJournalName) {
        this.publisherJournalName = publisherJournalName;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getDoi() {
        return doi;
    }

    public void setDoi(String doi) {
        this.doi = doi;
    }

    public String getIssn() {
        return issn;
    }

    public void setIssn(String issn) {
        this.issn = issn;
    }

    public float gethIndex() {
        return hIndex;
    }

    public void sethIndex(float hIndex) {
        this.hIndex = hIndex;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public float getIfNumber() {
        return ifNumber;
    }

    public void setIfNumber(float ifNumber) {
        this.ifNumber = ifNumber;
    }

    public float getSjrNumber() {
        return sjrNumber;
    }

    public void setSjrNumber(float sjrNumber) {
        this.sjrNumber = sjrNumber;
    }

    public float getSnipNumber() {
        return snipNumber;
    }

    public void setSnipNumber(float snipNumber) {
        this.snipNumber = snipNumber;
    }

}
