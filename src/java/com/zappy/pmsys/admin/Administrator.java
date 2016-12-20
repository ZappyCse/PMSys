/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zappy.pmsys.admin;

import com.zappy.pmsys.beans.Faculty;
import com.zappy.pmsys.beans.PersonalInfo;
import com.zappy.pmsys.dao.PMSysDao;

/**
 *
 * @author Arun
 */
public class Administrator {
   public int validateUser(String userName,String password){
       return new PMSysDao().validateUser(userName, password);
   }
   public void setUser(Faculty faculty){
       new PMSysDao().setUser(faculty);
   }
   public Faculty getUser(String userName){
       return new PMSysDao().getUser(userName);
   }
   public PersonalInfo getPersonalInfo(String facultyId){
       return new PMSysDao().getPersonalInfo(facultyId);
   }
}
