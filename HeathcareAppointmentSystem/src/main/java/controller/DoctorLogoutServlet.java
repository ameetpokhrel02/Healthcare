
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/DoctorLogoutServlet")
public class DoctorLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
       
        HttpSession session = request.getSession(false);
        
        if (session != null) {
           
            session.removeAttribute("username");
            session.removeAttribute("password");
            session.removeAttribute("doctorId");
            session.removeAttribute("role");
            session.removeAttribute("doctorName");
            session.removeAttribute("specialization");
            
           
            session.invalidate();
        }
        
       
        response.sendRedirect(request.getContextPath() + "/view/DoctorLogin.jsp?logout=success");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}