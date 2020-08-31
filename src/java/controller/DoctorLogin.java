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
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

public class DoctorLogin extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         Connect conn = new Connect();
        try {
           
            Criteria cr= conn.session.createCriteria(CdaDoctor.class);
            cr.add(Restrictions.eq("email",request.getParameter("email")));
            cr.add(Restrictions.eq("password",request.getParameter("password")));
            ArrayList<CdaDoctor> al=(ArrayList<CdaDoctor>)cr.list();
            conn.transaction.commit();
            String path="";
             HttpSession hs = null;
             if(al.isEmpty())
            {
                  String msg="Invalid UserName or Password";
                  request.setAttribute("msg",msg);
                  path="index.jsp";
                 
            }
             else{
                 hs = request.getSession();
                 CdaDoctor doc = al.get(0);
                  Criteria cr1= conn.session.createCriteria(CdaDoctor.class);
                  cr1.add(Restrictions.eq("name",doc.getName()));
                   ArrayList<CdaDoctor> aluser=(ArrayList<CdaDoctor>)cr1.list();
                CdaDoctor doc1 = aluser.get(0);
                hs.setAttribute("name", doc1);
                 path="home.jsp";
             }
             RequestDispatcher rd = request.getRequestDispatcher(path);
             rd.forward(request, response);
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
