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
public class HandledSubjects {
    private int pId;
    private int academicYearFrom;
    private int academicYearTo;
    private char semester;
    private String subjectName;
    private int year;
    private String department;
    private char section;
    private float passPercent;
    
    public HandledSubjects(){
        semester ='\u0000';
        subjectName="";
        department="";
        section='\u0000'; 
    }
    
    public String[] getAll(){
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String[] pi=new String[8];
        pi[0]=academicYearFrom==0?"":academicYearFrom+"";
        pi[1]=academicYearTo==0?"":academicYearTo+"";
        pi[2]=semester=='\u0000'?"":semester+"";
        pi[3]=subjectName==null?"":subjectName;
        pi[4]=year==0?"":year+"";
        pi[5]=department==null?"":department;
        pi[6]=section=='\u0000'?"":section+"";
        pi[7]=((int)passPercent)==0?"":passPercent+"";
        return pi;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public int getAcademicYearFrom() {
        return academicYearFrom;
    }

    public void setAcademicYearFrom(int academicYearFrom) {
        this.academicYearFrom = academicYearFrom;
    }

    public int getAcademicYearTo() {
        return academicYearTo;
    }

    public void setAcademicYearTo(int academicYearTo) {
        this.academicYearTo = academicYearTo;
    }

    public char getSemester() {
        return semester;
    }

    public void setSemester(char semester) {
        this.semester = semester;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public char getSection() {
        return section;
    }

    public void setSection(char section) {
        this.section = section;
    }

    public float getPassPercent() {
        return passPercent;
    }

    public void setPassPercent(float passPercent) {
        this.passPercent = passPercent;
    }
    
    public void setAll(String pi[]){
        if(!pi[0].equals(""))
            academicYearFrom=Integer.parseInt(pi[0]);
        if(!pi[1].equals(""))
            academicYearTo=Integer.parseInt(pi[1]);
        if(pi[2].equalsIgnoreCase("O"))
            semester='O';
        else
            semester='E';
        subjectName=pi[3];
        if(!pi[4].equals(""))
            year=Integer.parseInt(pi[4]);
        department=pi[5];
        if(!pi[6].equals(""))
            section=pi[6].charAt(0);
        if(!pi[7].equals(""))
            passPercent=Float.parseFloat(pi[7]);
    }
}
