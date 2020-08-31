package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CdaDoctor;


import model.CdaPatient;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
public class editPatientDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         Connect conn = new Connect();
        try {
             
              CdaPatient t = new CdaPatient();
            Long id = Long.valueOf(request.getParameter("id"));  
            out.println(id);
           
              System.out.println(id);
           Criteria cr= conn.session.createCriteria(CdaPatient.class);
           cr.add(Restrictions.eq("id", id));
           ArrayList<CdaPatient> al1=(ArrayList<CdaPatient>)cr.list();
            HttpSession hs = request.getSession();
           if(al1.isEmpty())
            {
                System.out.println("null");
                
            }else{
               System.out.println(al1.get(0));
               t = al1.get(0);
               
               //request.setAttribute("ob", t);
               hs.setAttribute("ob", t);
               RequestDispatcher rd = request.getRequestDispatcher("editDetail.jsp");
           rd.forward(request, response);
           }
           
           
          
        } finally {
            out.close();
            conn.Close();
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