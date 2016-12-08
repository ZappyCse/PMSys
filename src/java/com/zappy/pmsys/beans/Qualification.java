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
public class Qualification {
    private int pId;
    private String degree;
    private String specialization;
    private String instituteName;
    private String university;
    private int yoa;
    private int yoc;
    private String classOfMarks;
    private int percent;

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

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

}
