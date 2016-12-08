/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zappy.pmsys.main;

import com.zappy.pmsys.beans.Address;
import com.zappy.pmsys.beans.Faculty;
import com.zappy.pmsys.beans.JournalDetails;
import com.zappy.pmsys.beans.PersonalInfo;
import com.zappy.pmsys.beans.TeachingFaculty;
import com.zappy.pmsys.beans.WorkshopSeminarDetails;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Arun
 */
public class TestMain {
    public static void insert() throws ParseException{
        Configuration cfg=new Configuration();
        cfg.configure("hibernate.cfg.xml");
        SessionFactory fact=cfg.buildSessionFactory();
        Session s=fact.openSession();
        Query q=s.createQuery("from TeachingFaculty where facultyId='hod'");
       
        TeachingFaculty tF=(TeachingFaculty)q.list().get(0);
        System.out.println(tF.getName()+" "+tF.getPersonalInfo().getAddress().get(0).getCity());
        
        s.close();
        fact.close();
    }
    public static void fetch() throws ParseException{
         DateFormat df=new SimpleDateFormat("dd-MM-yyyy");
        Configuration cfg=new Configuration();
        cfg.configure("hibernate.cfg.xml");
        SessionFactory fact=cfg.buildSessionFactory();
        Session s=fact.openSession();
        Query q=s.createQuery("from WorkshopSeminarDetails where facultyid='CS156'");
        //System.out.println(((TeachingFaculty)q.list().get(0)).getWorkshopSeminarDetails().get(0).getProgrammeName());
        WorkshopSeminarDetails workshopSeminarDetails=new WorkshopSeminarDetails();
        workshopSeminarDetails.setDuration(1);
        workshopSeminarDetails.setFromDate(df.parse("25-02-1996"));
        workshopSeminarDetails.setOrganizedBy("KSR");
        workshopSeminarDetails.setProgrammeName("Workshop");
        workshopSeminarDetails.setToDate(df.parse("24-01-2000"));
        workshopSeminarDetails.setType('W');
        List<WorkshopSeminarDetails> l=(ArrayList<WorkshopSeminarDetails>)q.list();
        System.out.println(l.contains(workshopSeminarDetails));
        s.close();
        fact.close();
    }
    public static void main(String[] args) throws ParseException {
        insert();
    }
}
