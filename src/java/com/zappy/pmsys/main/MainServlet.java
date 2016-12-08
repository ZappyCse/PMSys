package com.zappy.pmsys.main;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.zappy.pmsys.admin.Administrator;
import com.zappy.pmsys.beans.Address;
import com.zappy.pmsys.beans.Faculty;
import com.zappy.pmsys.beans.PersonalInfo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Arun
 */
public class MainServlet extends HttpServlet {
    public static DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
    public static void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String uN=request.getParameter("UN");
        String pW=request.getParameter("PW");
        int status=new Administrator().validateUser(uN, pW);
        if(status==1){
            request.getSession().setAttribute("faculty", new Administrator().getUser(uN));
            request.getRequestDispatcher("/personalInformation.jsp").include(request, response);
        }
        else if(status==0){
            request.setAttribute("eMsg", "Incorrect UserName/Password");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else{
            request.setAttribute("eMsg", "User Already Active");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
    public static void insertPersonalInfo(HttpServletRequest request, HttpServletResponse response) throws ParseException{
        Faculty faculty=new Administrator().getUser(request.getParameter("empId"));
        PersonalInfo personalInfo=faculty.getPersonalInfo();
        
        if(personalInfo==null)
              personalInfo=new PersonalInfo();
        faculty.setName(request.getParameter("empName"));
        
        personalInfo.setBloodGroup(request.getParameter("bg"));
        personalInfo.setDob(df.parse(request.getParameter("dob")));
       
        personalInfo.setDoj(df.parse(request.getParameter("doj")));
        personalInfo.setDor(df.parse(request.getParameter("dor")));
        personalInfo.setFaculty(faculty);
        personalInfo.setGender(request.getParameter("gender").toUpperCase().charAt(0));
        personalInfo.setMailId(request.getParameter("mail"));
        personalInfo.setSecMailId(request.getParameter("secmail"));
        
        personalInfo.setPhoneNumber(Long.parseLong(request.getParameter("ph")));
        
        if(!(request.getParameter("secph").equals("")))
            personalInfo.setSecPhoneNumber(Long.parseLong(request.getParameter("secph")));
        
        List<Address> al=faculty.getPersonalInfo().getAddress();
        
        if(al.size()==0){
            al=new ArrayList<>();
            Address address=new Address();
            al.add(address);
            address=new Address();
            al.add(address);
        }
        Address address1=al.get(0);
        Address address2=al.get(1);
        address1.setCity(request.getParameter("Pcity"));
        address1.setCountry(request.getParameter("Pcountry"));
        address1.setDistrict(request.getParameter("Pdistrict"));
        address1.setPinCode(Integer.parseInt(request.getParameter("Ppincode")));
        address1.setState(request.getParameter("Pstate"));
        address1.setStreet(request.getParameter("Pstreet"));
        address2.setCity(request.getParameter("Ccity"));
        address2.setCountry(request.getParameter("Ccountry"));
        address2.setDistrict(request.getParameter("Cdistrict"));
        address2.setPinCode(Integer.parseInt(request.getParameter("Cpincode")));
        address2.setState(request.getParameter("Cstate"));
        address2.setStreet(request.getParameter("Cstreet"));
        personalInfo.setAddress(al);
        new Administrator().setUser(faculty);             
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("action").equals("login")){
            login(request, response);
        }
        else if(request.getParameter("action").equals("personalinfo")){
            try {
                insertPersonalInfo(request, response);
            } catch (ParseException ex) {
                Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
