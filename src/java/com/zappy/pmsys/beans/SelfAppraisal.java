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
public class SelfAppraisal {
    private int pId;
    private String strengths;
    private String weaknesses;

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getStrengths() {
        return strengths;
    }

    public void setStrengths(String strengths) {
        this.strengths = strengths;
    }

    public String getWeaknesses() {
        return weaknesses;
    }

    public void setWeaknesses(String weaknesses) {
        this.weaknesses = weaknesses;
    }
    
    public String[] getAll(){
        String[] pi=new String[2];
        pi[0]=strengths==null?"":strengths;
        pi[1]=weaknesses==null?"":weaknesses;
        return pi;
    }
    
    public void setAll(String pi[]){
        strengths=pi[0];
        weaknesses=pi[1];
    }
    
}
