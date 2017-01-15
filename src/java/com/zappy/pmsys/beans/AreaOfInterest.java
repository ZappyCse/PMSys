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
public class AreaOfInterest {
    private int pId;
    private String areaOfInterest;
    public AreaOfInterest(){
        areaOfInterest="";
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }
   
    public String getAreaOfInterest() {
        return areaOfInterest;
    }

    public void setAreaOfInterest(String areaOfInterest) {
        this.areaOfInterest = areaOfInterest;
    }
        
    public void setAll(String st){
        areaOfInterest=st;
    }
    
    public String getAll(){
        if(areaOfInterest==null)
            return "";
        return areaOfInterest;
    }
}
