package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.HealthcareDao;

import java.io.IOException;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public UserLoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("view/UserLogin.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); // Should be "user" from dropdown
        
        // Validate input
        if (username == null || username.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            
            request.setAttribute("error", "Username and password are required");
            request.getRequestDispatcher("view/UserLogin.jsp").forward(request, response);
            return;
        }
        
        // Create User object with login credentials
        User user = new User(username, password, role);
        HealthcareDao healthcareDao = new HealthcareDao();
        
        try {
            if (healthcareDao.userLogin(user)) {
                // Login successful - create session and store user attributes
                HttpSession session = request.getSession();
                session.setAttribute("userId", user.getUserId());
                session.setAttribute("username", username);
                session.setAttribute("role", role);
                session.setAttribute("fullName", user.getFullName());
                session.setAttribute("email", user.getEmail());
                session.setAttribute("phone", user.getPhone());
                session.setAttribute("dob", user.getDob());
                session.setAttribute("gender", user.getGender());
                session.setAttribute("bloodType", user.getBloodType());
                session.setAttribute("address", user.getAddress());
                
                // Redirect to user dashboard
                response.sendRedirect(request.getContextPath() + "/view/UserDashboard.jsp");
            } else {
                // Login failed
                request.setAttribute("error", "Invalid username, password, or user type");
                request.getRequestDispatcher("view/UserLogin.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error", "System error occurred. Please try again later.");
            request.getRequestDispatcher("view/UserLogin.jsp").forward(request, response);
        }
    }
}