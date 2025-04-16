package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Invalidate the session and remove all attributes
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // Clear all session attributes
            session.removeAttribute("username");
            session.removeAttribute("password");
            session.removeAttribute("role");
            session.removeAttribute("adminName");
            
            // Invalidate the session
            session.invalidate();
        }
        
        // Redirect to login page with a success message
        response.sendRedirect(request.getContextPath() + "/view/AdminLogin.jsp?logout=success");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}