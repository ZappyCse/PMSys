/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zappy.pmsys.dao;

import com.zappy.pmsys.beans.Address;
import com.zappy.pmsys.beans.Faculty;
import com.zappy.pmsys.beans.LoginDetails;
import com.zappy.pmsys.beans.PersonalInfo;
import com.zappy.pmsys.util.DBUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class PMSysDao {
    private Transaction transaction;
    public int validateUser(String userName,String password){
        Session session=DBUtil.getSessionFactory().openSession();
        try{
            Query query=session.createQuery("from LoginDetails where userName=:n");
            query.setParameter("n", userName);
            List<LoginDetails> loginDetails=query.list();
            if(loginDetails.size()==1){
                LoginDetails loginDetails1=loginDetails.get(0);
                if(loginDetails1.getPassword().equals(password)){
                    if(loginDetails1.isActiveStatus()){
                        return -1;
                    }
                    else{
                       transaction=session.beginTransaction();
                        loginDetails1.setActiveStatus(false);
                        session.persist(loginDetails1);
                        transaction.commit();
                        return 1;
                    }
                }
                else
                    return 0;
            }
            else
                return 0;    
        }
        finally{
            session.close();
        }
   }
   public void setUser(Faculty faculty){
       Session session=DBUtil.getSessionFactory().openSession();
       transaction=session.beginTransaction();
       try{
           session.saveOrUpdate(faculty);
       }
       finally{
           transaction.commit();
           session.close();
       }
   }
   public Faculty getUser(String userName){
       System.out.println("com.zappy.pmsys.dao.PMSysDao.getUser()"+userName);
       Session session=DBUtil.getSessionFactory().openSession();
       try{
           Query query=session.createQuery("from Faculty where facultyId=:n");
           query.setParameter("n", userName);
           if(query.list().size()==1){
               System.out.println("com.zappy.pmsys.dao.PMSysDao.getUser()"+query.list().get(0));
               return (Faculty)query.list().get(0);
           }
           else
               return null;
       }
       finally{
           session.close();
       }
   }
   public PersonalInfo getPersonalInfo(String userName){
       Session session=DBUtil.getSessionFactory().openSession();
       try{
           Query query=session.createQuery("from PersonalInfo where facultyId=:n");
           query.setParameter("n", userName);
           if(query.list().size()==1){
               return (PersonalInfo)query.list().get(0);
           }
           else
               return null;
       }
       finally{
           session.close();
       }
   }
}
