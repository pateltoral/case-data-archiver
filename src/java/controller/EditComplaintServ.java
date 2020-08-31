/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CdaComplaints;

public class EditComplaintServ extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
          Connect conn = new Connect();
        try {
          
            String unpaid = request.getParameter("unpaid");
            //out.println(unpaid);
            String pid = request.getParameter("pid");
            String cid = request.getParameter("cid");
            String date = request.getParameter("casedate");
            String complaints = request.getParameter("complaints");
            String Medicine = request.getParameter("medicine");
            String days = request.getParameter("dom");
            String amount = request.getParameter("amount");
            
            HttpSession session = request.getSession();
            CdaComplaints comp = (CdaComplaints) session.getAttribute("pc");
            //CdaComplaints comp = new CdaComplaints();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date dt = format.parse(date);
            comp.setCompDate(dt);
            comp.setCid(Long.parseLong(cid));
            comp.setPid(Long.parseLong(pid));
            comp.setComplaints(complaints);
            comp.setMedicine(Medicine);
            comp.setAmount(Integer.parseInt(amount));
            comp.setDaysOfMedicine(Integer.parseInt(days));
            comp.setUnpaid(Integer.parseInt(unpaid));
            conn.session.update(comp);
            conn.transaction.commit();
            RequestDispatcher rd = request.getRequestDispatcher("PatientComplaints.jsp?pid="+pid);
            rd.forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AddComplaintsServ.class.getName()).log(Level.SEVERE, null, ex);
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
