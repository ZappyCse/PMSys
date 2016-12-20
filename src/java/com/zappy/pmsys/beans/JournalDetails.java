/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zappy.pmsys.beans;

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
