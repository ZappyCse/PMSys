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
public class Qualification {
    private int pId;
    private String degree;
    private String specialization;
    private String instituteName;
    private String university;
    private int yoa;
    private int yoc;
    private String classOfMarks;
    private float percent;

    public Qualification() {
        this.degree = "";
        this.specialization = "";
        this.instituteName = "";
        this.university = "";
        this.classOfMarks = "";
    }

    public String[] getAll(){
        String[] pi=new String[8];
        pi[0]=degree==null?"":degree;
        pi[1]=specialization==null?"":specialization;
        pi[2]=instituteName==null?"":instituteName;
        pi[3]=university==null?"":university;
        pi[4]=yoa==0?"":yoa+"";
        pi[5]=yoc==0?"":yoc+"";
        pi[6]=classOfMarks==null?"":classOfMarks;
        pi[7]=((int)percent)==0?"":percent+"";
        return pi;
    }
    
    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getInstituteName() {
        return instituteName;
    }

    public void setInstituteName(String instituteName) {
        this.instituteName = instituteName;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public int getYoa() {
        return yoa;
    }

    public void setYoa(int yoa) {
        this.yoa = yoa;
    }

    public int getYoc() {
        return yoc;
    }

    public void setYoc(int yoc) {
        this.yoc = yoc;
    }

    public String getClassOfMarks() {
        return classOfMarks;
    }

    public void setClassOfMarks(String classOfMarks) {
        this.classOfMarks = classOfMarks;
    }

    public float getPercent() {
        return percent;
    }

    public void setPercent(float percent) {
        this.percent = percent;
    }
    
    public void setAll(String pn[]){
        degree=pn[0];
        specialization=pn[1];
        instituteName=pn[2];
        university=pn[3];
        if(!pn[4].equals(""))
            yoa=Integer.parseInt(pn[4]);
        if(!pn[5].equals(""))
            yoc=Integer.parseInt(pn[5]);
        classOfMarks=pn[6];
        if(!pn[7].equals(""))
            percent=Float.parseFloat(pn[7]);
    }
}
