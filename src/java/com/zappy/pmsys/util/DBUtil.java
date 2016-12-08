/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zappy.pmsys.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Arun
 */
public class DBUtil {
    static Configuration configuration=new Configuration().configure();
    static SessionFactory sessionFactory=configuration.buildSessionFactory();
    public static SessionFactory getSessionFactory(){
        return sessionFactory;
    }
}
