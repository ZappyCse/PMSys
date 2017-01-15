package com.zappy.pmsys.main;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.zappy.pmsys.admin.Administrator;
import com.zappy.pmsys.beans.Address;
import com.zappy.pmsys.beans.AreaOfInterest;
import com.zappy.pmsys.beans.Experience;
import com.zappy.pmsys.beans.Faculty;
import com.zappy.pmsys.beans.HandledSubjects;
import com.zappy.pmsys.beans.Industry;
import com.zappy.pmsys.beans.PersonalInfo;
import com.zappy.pmsys.beans.Qualification;
import com.zappy.pmsys.beans.TeachingFaculty;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;

/**
 *
 * @author Arun
 */
public class MainServlet extends HttpServlet {
    public static DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
    public static void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String uN=request.getParameter("UN");
        String pW=request.getParameter("PW");
        String status=new Administrator().validateUser(uN, pW);
        if(status.equals("Incorrect UserName")){
            request.setAttribute("eMsg", "Incorrect UserName");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else if(status.equals("Currently Active")){
            request.setAttribute("eMsg", "User Already Active");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else if(status.equals("Incorrect Password")){
            request.setAttribute("eMsg", "Incorrect Password");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else{
            request.getSession().setAttribute("facultyId", uN);
            Faculty st=new Administrator().getUser(uN);
            request.getSession().setAttribute("facultyName", st==null?"":st.getName());
            request.getRequestDispatcher("/home.jsp").include(request, response);
        }
    }
    public static void insertPersonalInfo(HttpServletRequest request, HttpServletResponse response) throws ParseException{
        try {
            Faculty faculty=new Administrator().getUser((String)request.getSession().getAttribute("facultyId"));
            
            if(faculty==null){
                faculty=new TeachingFaculty();
                faculty.setFacultyId((String)request.getSession().getAttribute("facultyId"));
            }
            
            PersonalInfo personalInfo;
            
            if(faculty.getPersonalInfo()!=null)
                personalInfo=faculty.getPersonalInfo();
            else{
                personalInfo=new PersonalInfo();
                faculty.setPersonalInfo(personalInfo);
            }
            
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
            
            List<Address> al;
            
            if(faculty.getPersonalInfo().getAddress()==null){
                al=new ArrayList<>();
                Address address=new Address();
                al.add(address);
                address=new Address();
                al.add(address);
            }
            else{
                al=faculty.getPersonalInfo().getAddress();
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
            request.getRequestDispatcher("personalInformation.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    protected void insertSkillSet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("com.zappy.pmsys.main.MainServlet.insertSkillSet()");
        Enumeration<String> en=request.getParameterNames();
        TeachingFaculty faculty=(TeachingFaculty)new Administrator().getUser((String)request.getSession().getAttribute("facultyId"));
        
        if(faculty==null){
            faculty=new TeachingFaculty();
            faculty.setFacultyId((String)request.getSession().getAttribute("facultyId"));
        }
        
        List<Qualification> qualifications=faculty.getQualification();
        if(qualifications==null)
            qualifications=new ArrayList<>();
        Qualification qualification;
        String qual[]=new String[8];
        String pname="";
        int index=0;
        int qi=qualifications.size();
        pname=en.nextElement();
        while(!pname.equals("tb1")){
            if(index<qi){
                qualification=qualifications.get(index);
                qualifications.remove(index);
            }
            else
                qualification=new Qualification();
            for(int i=0;i<8;i++){
                qual[i]=request.getParameter(pname);
                pname=en.nextElement();
            }
            qualification.setAll(qual);
            qualifications.add(index, qualification);
            ++index;
            if(pname.equals("tb1")){
                while(index<qualifications.size()){
                    qualifications.remove(index);
                }
            }
        }
        faculty.setQualification(qualifications);
        
        List<AreaOfInterest> areaOfInterests=faculty.getAreaOfInterest();
        if(areaOfInterests==null)
            areaOfInterests=new ArrayList<>();
        index=0;
        pname=en.nextElement();
        qi=areaOfInterests.size();
        AreaOfInterest areaOfInterest;
        while(!pname.equals("tb2")){
            if(index<qi){
                areaOfInterest=areaOfInterests.get(index);
                areaOfInterests.remove(index);
            }
            else
                areaOfInterest=new AreaOfInterest();
     
            areaOfInterest.setAll(request.getParameter(pname));
            pname=en.nextElement();
            areaOfInterests.add(index, areaOfInterest);
            ++index;
            if(pname.equals("tb2")){
                while(index<areaOfInterests.size()){
                    areaOfInterests.remove(index);
                }
            }
        }
        faculty.setAreaOfInterest(areaOfInterests);
        
        List<HandledSubjects> handledSubjectses=faculty.getHandledSubjects();
        if(handledSubjectses==null)
            handledSubjectses=new ArrayList<>();
        index=0;
        pname=en.nextElement();
        qi=handledSubjectses.size();
        HandledSubjects handledSubjects;
        qual=new String[8];
        while(!pname.equals("tb3")){
            if(index<qi){
                handledSubjects=handledSubjectses.get(index);
                handledSubjectses.remove(index);
            }
            else
                handledSubjects=new HandledSubjects();
            for(int i=0;i<8;i++){
                qual[i]=request.getParameter(pname);
                pname=en.nextElement();
            }
            handledSubjects.setAll(qual);
            handledSubjectses.add(index, handledSubjects);
            ++index;
            if(pname.equals("tb3")){
                while(index<handledSubjectses.size()){
                    handledSubjectses.remove(index);
                }
            }
        }
        faculty.setHandledSubjects(handledSubjectses);
        
        List<Industry> industrys=faculty.getIndustry();
        if(industrys==null)
            industrys=new ArrayList<>();
        index=0;
        pname=en.nextElement();
        qi=industrys.size();
        Industry industry;
        qual=new String[5];
        
        while(!pname.equals("tb4")){
            if(index<qi){
                industry=industrys.get(index);
                industrys.remove(index);
            }
            else
                industry=new Industry();
            for(int i=0;i<5;i++){
                qual[i]=request.getParameter(pname);
                pname=en.nextElement();
            }
            industry.setAll(qual);
            industrys.add(index, industry);
            ++index;
            if(pname.equals("tb4")){
                while(index<industrys.size()){
                    industrys.remove(index);
                }
            }
        }
        faculty.setIndustry(industrys);
        
        List<Experience> experiences=faculty.getExperience();
        if(experiences==null)
            experiences=new ArrayList<>();
        index=0;
        pname=en.nextElement();
        qi=experiences.size();
        Experience experience;
        qual=new String[5];
        
        while(!pname.equals("action")){
            if(index<qi){
                experience=experiences.get(index);
                experiences.remove(index);
            }
            else
                experience=new Experience();
            for(int i=0;i<5;i++){
                qual[i]=request.getParameter(pname);
                pname=en.nextElement();
            }
            experience.setAll(qual);
            experiences.add(index, experience);
            ++index;
            if(pname.equals("action")){
                while(index<experiences.size()){
                    experiences.remove(index);
                }
            }
        }
        faculty.setExperience(experiences);
        
        new Administrator().setUser(faculty);
        request.getRequestDispatcher("skillset.jsp").forward(request, response);
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
        else if(request.getParameter("action").equals("skillset")){
            insertSkillSet(request, response);
        }
    }
}
