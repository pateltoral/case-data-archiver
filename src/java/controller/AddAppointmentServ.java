package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
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
import model.CdaAppointment;

public class AddAppointmentServ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         Connect conn = new Connect();
        try {
           
            String pid = request.getParameter("pid");
            String pname = request.getParameter("pname");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String ptype = request.getParameter("ptype");
            
            out.println(time);
            CdaAppointment app = new CdaAppointment();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date dt =null;
            try {
                dt = format.parse(date);
            } catch (ParseException ex) {
                Logger.getLogger(AddAppointmentServ.class.getName()).log(Level.SEVERE, null, ex);
            }
            app.setAppDate(dt);
             SimpleDateFormat formattime = new SimpleDateFormat("HH:mm");
            Date dtime = null;
            try {
                dtime = formattime.parse(time);
              
            } catch (ParseException ex) {
                Logger.getLogger(AddAppointmentServ.class.getName()).log(Level.SEVERE, null, ex);
            }
            app.setAppTime(time);
            app.setPname(pname);
            app.setApptype(ptype);
            app.setPid(Long.parseLong(pid));
            conn.session.save(app);
            conn.transaction.commit();
            RequestDispatcher rd = request.getRequestDispatcher("FetchAppServ");
            rd.forward(request, response);
        }  finally{
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
