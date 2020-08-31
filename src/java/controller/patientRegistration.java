/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CdaCase;
import model.CdaPatient;
import org.hibernate.Query;
/**
 *
 * @author jhet
 */
public class patientRegistration extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         Connect conn = new Connect();
        try {
                String fname = request.getParameter("fname");
                String mname = request.getParameter("mname");
                String lname = request.getParameter("lname");
                String name = fname+" "+mname+" "+lname;
                String address = request.getParameter("address");
                String age = request.getParameter("age");
                String gender = request.getParameter("gender");
                String bloodgroup = request.getParameter("bloodgroup");
                String occupation = request.getParameter("occupation");
                String email = request.getParameter("email");     
                String mobile = request.getParameter("mobile");
            
               CdaPatient patient = new CdaPatient();
                patient.setPName(name);
                patient.setPAddress(address);
                if(age==""){
                    patient.setPAge("");
                }
                else{
                patient.setPAge(age);    
                }
                
                patient.setPBloodgroup(bloodgroup);
                patient.setPContact(mobile);
                patient.setPEmail(email);
                patient.setPOccupation(occupation);
                patient.setPGender(gender);
               
                conn.session.save(patient);
                
                CdaCase pcase = new CdaCase();
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                Date date = new Date();
                pcase.setCDate(date);
                pcase.setPid(patient.getId());
                pcase.setPName(patient.getPName());
               
                conn.session.save(pcase);
                 conn.transaction.commit();
                
                  String SuccessMsg = "Patient Registered to the System Succesfully";
                request.setAttribute("SuccessMsg", SuccessMsg);
                System.out.println("pid--"+patient.getId());
              RequestDispatcher rd = request.getRequestDispatcher("AddComplaints.jsp?pid="+patient.getId());
              rd.forward(request, response);
        } finally {
            conn.Close();
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
