/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zappy.pmsys.beans;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Arun
 */
public class PersonalInfo{
    private String facultyId;
    private Faculty faculty;
    private Date dob;
    private Character gender;
    private String bloodGroup;
    private Date doj;
    private Date dor;
    private Long phoneNumber;
    private Long secPhoneNumber;
    private String mailId;
    private String secMailId;
    private List<Address> address;
    public PersonalInfo(){
    facultyId="";
    gender = '\u0000';
    bloodGroup="";
    mailId="";
    secMailId="";
    }

    public List<Address> getAddress() {
        return address;
    }

    public void setAddress(List<Address> address) {
        this.address = address;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty teachingFaculty) {
        this.faculty = teachingFaculty;
    }

    public String getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(String facultyId) {
        this.facultyId = facultyId;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }
   
    public Character getGender() {
        return gender;
    }

    public void setGender(Character gender) {
        this.gender = gender;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public Date getDoj() {
        return doj;
    }

    public void setDoj(Date doj) {
        this.doj = doj;
    }

    public Date getDor() {
        return dor;
    }

    public void setDor(Date dor) {
        this.dor = dor;
    }

    public Long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Long getSecPhoneNumber() {
        return secPhoneNumber;
    }

    public void setSecPhoneNumber(Long secPhoneNumber) {
        this.secPhoneNumber = secPhoneNumber;
    }

    public String getMailId() {
        return mailId;
    }

    public void setMailId(String mailId) {
        this.mailId = mailId;
    }

    public String getSecMailId() {
        return secMailId;
    }

    public void setSecMailId(String secMailId) {
        this.secMailId = secMailId;
    }
    
}
