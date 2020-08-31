package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CdaCase;
import model.CdaComplaints;
import model.CdaPatient;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;


public class DeletePatientServ extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connect conn = new Connect();             
        try {
            String pid = request.getParameter("pid");
            Criteria cr1 = conn.session.createCriteria(CdaCase.class);
            cr1.add(Restrictions.eq("pid", Long.parseLong(pid)));
            ArrayList<CdaCase> csal = (ArrayList<CdaCase>) cr1.list();
            CdaCase cs = csal.get(0);
            conn.session.delete(cs);

            Criteria cr= conn.session.createCriteria(CdaPatient.class);
            cr.add(Restrictions.eq("id", Long.parseLong(pid)));
            ArrayList<CdaPatient> pal = (ArrayList<CdaPatient>) cr.list();
            CdaPatient pt = pal.get(0);
            conn.session.delete(pt);
            conn.transaction.commit();
            RequestDispatcher rd = request.getRequestDispatcher("fetchserv");
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
