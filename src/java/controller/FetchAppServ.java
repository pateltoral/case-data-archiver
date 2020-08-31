package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CdaAppointment;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;


public class FetchAppServ extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connect conn = new Connect();
        try {
            
            String old = "Old";
            String New ="New";
            CdaAppointment app =  new CdaAppointment();
            Criteria cr = conn.session.createCriteria(CdaAppointment.class);
            cr.add(Restrictions.eq("apptype",old ));
            ArrayList<CdaAppointment> appal = (ArrayList<CdaAppointment>) cr.list();
            
            Criteria cr1 = conn.session.createCriteria(CdaAppointment.class);
            cr1.add(Restrictions.eq("apptype", New));
            ArrayList<CdaAppointment> appal1 =  (ArrayList<CdaAppointment>) cr1.list();
            
            request.setAttribute("New", appal1);
            request.setAttribute("old", appal);
            RequestDispatcher rd = request.getRequestDispatcher("ViewAppointment.jsp?pid="+app.getPid());
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
