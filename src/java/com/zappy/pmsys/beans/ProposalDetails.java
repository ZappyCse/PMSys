/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zappy.pmsys.beans;

import java.util.Date;

/**
 *
 * @author Arun
 */
public class ProposalDetails {
    private int pId;
    private String title;
    private String dOfAgency;
    private Date dateOfProposal;
    private int duration;
    private String status;	
    private String sectorType;
    
    public ProposalDetails(){
        title="";
        dOfAgency="";
        status="";
        sectorType="";
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

    public String getdOfAgency() {
        return dOfAgency;
    }

    public void setdOfAgency(String dOfAgency) {
        this.dOfAgency = dOfAgency;
    }

    public Date getDateOfProposal() {
        return dateOfProposal;
    }

    public void setDateOfProposal(Date dateOfProposal) {
        this.dateOfProposal = dateOfProposal;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSectorType() {
        return sectorType;
    }

    public void setSectorType(String sectorType) {
        this.sectorType = sectorType;
    }

   

}
