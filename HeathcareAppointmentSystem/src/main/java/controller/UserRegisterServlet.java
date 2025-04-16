package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import model.HealthcareDao;

import java.io.IOException;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        String fullName = request.getParameter("firstName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String phone = request.getParameter("phone");
        String role = "user"; // Default role for registration
        
        // Validate input
        if (fullName == null || fullName.trim().isEmpty()) {
            setErrorAttributes(request, "firstName", "Full name is required");
            forwardToRegister(request, response);
            return;
        }
        
        if (email == null || !email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            setErrorAttributes(request, "email", "Valid email is required");
            forwardToRegister(request, response);
            return;
        }
        
        if (password == null || !password.matches("^(?=.*\\d)(?=.*[!@#$%^&*]).{8,}$")) {
            setErrorAttributes(request, "password", 
                "Password must be at least 8 characters with a number and special character");
            forwardToRegister(request, response);
            return;
        }
        
        if (!password.equals(confirmPassword)) {
            setErrorAttributes(request, "confirmPassword", "Passwords do not match");
            forwardToRegister(request, response);
            return;
        }
        
        if (phone == null || !phone.matches("\\d{10}")) {
            setErrorAttributes(request, "phone", "Valid 10-digit phone number is required");
            forwardToRegister(request, response);
            return;
        }
        
        // Create User object
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setRole(role);
        
        // Add to database
        HealthcareDao healthcareDao = new HealthcareDao();
        try {
            if (healthcareDao.registerUser(user)) {
                // Registration successful
                request.setAttribute("successMessage", "Registration successful! Please login.");
                request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
            } else {
                // Registration failed (likely email already exists)
                setErrorAttributes(request, "email", "Email already registered");
                forwardToRegister(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            setErrorAttributes(request, null, "System error during registration");
            forwardToRegister(request, response);
        }
    }
    
    private void setErrorAttributes(HttpServletRequest request, String field, String message) {
        request.setAttribute("errorMessage", message);
        if (field != null) {
            request.setAttribute("errorField", field);
            request.setAttribute("fieldErrorMessage", message);
        }
        // Preserve form values
        request.setAttribute("firstName", request.getParameter("firstName"));
        request.setAttribute("email", request.getParameter("email"));
        request.setAttribute("phone", request.getParameter("phone"));
    }
    
    private void forwardToRegister(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("UserRegister.jsp").forward(request, response);
    }
}