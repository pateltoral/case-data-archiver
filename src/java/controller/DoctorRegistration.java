package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CdaDoctor;

public class DoctorRegistration extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
          Connect conn = new Connect();
        try {           
                String name = request.getParameter("name");
                System.out.println("name--"+name);
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String contact = request.getParameter("contact");
                System.out.println("contact--"+contact);
                String address = request.getParameter("address");
                System.out.println("adress--->"+address);
                String practicetype = request.getParameter("practicetype");
                String grno = request.getParameter("grno");
                String freqsymptoms = request.getParameter("symptoms");
                
               CdaDoctor docreg = new CdaDoctor();
                docreg.setName(name);
                docreg.setEmail(email);
                docreg.setPassword(password);
                docreg.setContact(contact);
                docreg.setAddress(address);
                docreg.setPracticeType(practicetype);
                docreg.setGrno(grno);
                docreg.setFreqSymptoms(freqsymptoms);
                conn.session.save(docreg);
                conn.transaction.commit();
                
                String SuccessMsg = "Registration Successful";
                request.setAttribute("SuccessMsg", SuccessMsg);
              RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
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
