package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Doctor;
import model.HealthcareDao;

import java.io.IOException;


@WebServlet("/DoctorLoginServlet")
public class DoctorLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DoctorLoginServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    String doctorId = request.getParameter("doctorId");
	    String role = request.getParameter("doctor"); // This will be "doctor" from the dropdown
	    
	    if (username == null || username.trim().isEmpty() || 
	        password == null || password.trim().isEmpty() ||
	        doctorId == null || doctorId.trim().isEmpty()) {
	        
	        request.setAttribute("error", "Username, password, and doctor ID are required.");
	        request.getRequestDispatcher("/view/DoctorLogin.jsp").forward(request, response);
	        return;
	    }
	    
	    Doctor doctor = new Doctor();
	    doctor.setUsername(username);
	    doctor.setPassword(password);
	    doctor.setDoctorId(doctorId);
	    doctor.setRole(role);
	    
	    HealthcareDao healthcareDao = new HealthcareDao();
	    
	    try {
	        if (healthcareDao.doctorLogin(doctor)) {
	            HttpSession session = request.getSession();
	            session.setAttribute("username", username);
	            session.setAttribute("role", role);
	            session.setAttribute("doctorId", doctorId);
	            session.setAttribute("doctorName", doctor.getDoctorName());
	            session.setAttribute("specialization", doctor.getSpecialization());
	            
	            response.sendRedirect(request.getContextPath() + "/view/DoctorDashboard.jsp");
	        } else {
	            request.setAttribute("error", "Invalid credentials. Please try again.");
	            request.getRequestDispatcher("/view/DoctorLogin.jsp").forward(request, response);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        request.setAttribute("error", "System error. Please try again later.");
	        request.getRequestDispatcher("/view/DoctorLogin.jsp").forward(request, response);
	    }
	}

}
