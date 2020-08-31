
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CdaDoctor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class DoctorEditProfile extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         Connect conn = new Connect();
        try {
            /* TODO output your page here. You may use following sample code. */   
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contact = request.getParameter("contact");
            String address = request.getParameter("address");
            String photo = request.getParameter("photo");
            String practicetype = request.getParameter("practicetype");
            String grno = request.getParameter("grno");
            String freqsymptoms = request.getParameter("symptoms");
           
            HttpSession session=request.getSession(false);  
            CdaDoctor docreg  = (CdaDoctor) session.getAttribute("name");
            
            //CdaDoctor docreg = (CdaDoctor) conn.session.get(CdaDoctor.class, doc.getDoctorId());
            docreg.setName(name);
            docreg.setEmail(email);
            docreg.setPassword(password);
            docreg.setContact(contact);
            docreg.setAddress(address);
            docreg.setPracticeType(practicetype);
            docreg.setGrno(grno);
            docreg.setFreqSymptoms(freqsymptoms);
            conn.session.update(docreg);
            conn.transaction.commit();
            HttpSession hs = request.getSession();
            hs.setAttribute("name", docreg);
            String SuccessMsg = "Profile Updated Successfully";
            request.setAttribute("SuccessMsg", SuccessMsg);
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
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
