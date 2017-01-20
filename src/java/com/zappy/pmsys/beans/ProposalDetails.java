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
public class ProposalDetails {
    private int pId;
    private String title;
    private String dOfAgency;
    private Date fromDateOfProposal;
    private Date toDateOfProposal;
    private int duration;
    private String status;	
    private String sectorType;
    
    public void setAll(String pi[]){
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        title=pi[0];
        dOfAgency=pi[1];
        try {
            if(!pi[2].equals(""))
                fromDateOfProposal=df.parse(pi[2]);
            if(!pi[3].equals(""))
                toDateOfProposal=df.parse(pi[3]);
        } catch (ParseException ex) {
            Logger.getLogger(ProposalDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
        duration=pi[4].equals("")?0:Integer.parseInt(pi[4]);
        status=pi[5];
        sectorType=pi[6];
    }
    
    public String[] getAll(){
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        String pi[]=new String[7];
        pi[0]=title==null?"":title;
        pi[1]=dOfAgency==null?"":dOfAgency;
        pi[2]=fromDateOfProposal==null?"":df.format(fromDateOfProposal);
        pi[3]=toDateOfProposal==null?"":df.format(toDateOfProposal);
        pi[4]=duration==0?"":duration+"";
        pi[5]=status==null?"":status+"";
        pi[6]=sectorType==null?"":sectorType;
        return pi;
    }
    
    public Date getFromDateOfProposal() {
        return fromDateOfProposal;
    }

    public void setFromDateOfProposal(Date fromDateOfProposal) {
        this.fromDateOfProposal = fromDateOfProposal;
    }

    public Date getToDateOfProposal() {
        return toDateOfProposal;
    }

    public void setToDateOfProposal(Date toDateOfProposal) {
        this.toDateOfProposal = toDateOfProposal;
    }
    
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
