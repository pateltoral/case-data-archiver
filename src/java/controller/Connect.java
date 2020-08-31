/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.Session;

/**
 *
 * @author USER
 */
public class Connect {
       public Transaction transaction;
       public  SessionFactory sessionFactory;
       public Session session;
        public Connect(){
            sessionFactory = NewHibernateUtil.getSessionFactory();
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
        }
        
    public void Close(){
        if(session.isOpen()){
            session.flush();
            session.close();
        }
    }
}
