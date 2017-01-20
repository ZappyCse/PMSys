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
public class MembershipDetails {
    private int pId;
    private String membershipId;
    private String organization;
    public MembershipDetails(){
        membershipId="";
        organization="";
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getMembershipId() {
        return membershipId;
    }

    public void setMembershipId(String membershipId) {
        this.membershipId = membershipId;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }
    
    public void setAll(String[] pi){
        membershipId=pi[0];
        organization=pi[1];
    }
    
    public String[] getAll(){
        String pi[]=new String[2];
        pi[0]=membershipId==null?"":membershipId;
        pi[1]=organization==null?"":organization;
        return pi;
    }
}
