<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Registration | HealthCare Appointment System</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #3b82f6;
            --primary-dark: #2563eb;
            --secondary-color: #60a5fa;
            --accent-color: #93c5fd;
            --light-gray: #f8fafc;
            --dark-gray: #64748b;
            --danger-color: #ef4444;
            --success-color: #10b981;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            --border-radius: 12px;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background-color: #f1f5f9;
            color: #1e293b;
            line-height: 1.6;
        }
        
        .navbar {
            background-color: var(--secondary-color);
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 5%;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .logo-container {
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: transform 0.3s;
        }
        
        .logo-container:hover {
            transform: scale(1.05);
        }
        
        .logo {
            width: 45px;
            height: 45px;
            margin-right: 12px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid var(--light-color);
        }
        
        .logo-name {
            font-size: 22px;
            font-weight: 700;
            letter-spacing: 1px;
        }
        
        .logo-name span {
            color: var(--primary-color);
        }
        
        .nav-links {
            display: flex;
            gap: 15px;
        }
        
        .nav-btn {
            color: white;
            text-decoration: none;
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 30px;
            transition: all 0.3s;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .nav-btn i {
            font-size: 14px;
        }
        
        .admin-btn {
            background-color: var(--accent-color);
        }
        
        .doctor-btn {
            background-color: var(--primary-color);
        }
        
        .user-btn {
            background-color: var(--success-color);
        }
        
        .nav-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .register-wrapper {
            display: flex;
            min-height: calc(100vh - 72px);
            align-items: center;
            justify-content: center;
            padding: 2rem;
            background: url('images/patient-register-bg.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
        }
        
        .register-wrapper::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(59, 130, 246, 0.88);
        }
        
        .register-container {
            width: 100%;
            max-width: 600px;
            padding: 2.5rem;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            position: relative;
            z-index: 1;
            transform: translateY(0);
            transition: var(--transition);
            border: 1px solid rgba(255,255,255,0.2);
        }
        
        .register-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }
        
        .register-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        
        .register-header h2 {
            color: var(--primary-color);
            font-size: 2rem;
            margin-bottom: 0.5rem;
            font-weight: 700;
            letter-spacing: -0.5px;
        }
        
        .register-header p {
            color: var(--dark-gray);
            font-size: 0.95rem;
            font-weight: 400;
        }
        
        .patient-icon {
            font-size: 2.8rem;
            color: var(--primary-color);
            margin-bottom: 1.2rem;
            background: rgba(59, 130, 246, 0.1);
            width: 80px;
            height: 80px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.6rem;
            color: var(--dark-gray);
            font-size: 0.95rem;
            font-weight: 500;
        }
        
        .form-group input, .form-group select {
            width: 100%;
            padding: 0.9rem 1rem 0.9rem 3.2rem;
            border: 1px solid #e2e8f0;
            border-radius: var(--border-radius);
            font-size: 0.95rem;
            transition: var(--transition);
            background-color: #f8fafc;
        }
        
        .form-group input:focus, .form-group select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.3);
            outline: none;
            background-color: white;
        }
        
        .input-icon {
            position: absolute;
            left: 1rem;
            top: 2.7rem;
            color: var(--dark-gray);
            font-size: 1.2rem;
        }
        
        .form-row {
            display: flex;
            gap: 1.5rem;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .register-btn {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
            border-radius: var(--border-radius);
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            margin-top: 1rem;
            box-shadow: var(--shadow);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .register-btn:hover {
            background: linear-gradient(135deg, var(--primary-dark), var(--secondary-color));
            box-shadow: 0 6px 12px rgba(59, 130, 246, 0.25);
            transform: translateY(-2px);
        }
        
        .login-link {
            text-align: center;
            margin-top: 1.8rem;
            font-size: 0.95rem;
            color: var(--dark-gray);
        }
        
        .login-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }
        
        .login-link a:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
        
        .error-message {
            color: var(--danger-color);
            margin-top: 0.5rem;
            font-size: 0.85rem;
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }
        
        .password-hint {
            margin-top: 0.5rem;
            font-size: 0.85rem;
            color: var(--dark-gray);
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }
        
        .form-dropdown {
            margin-bottom: 1.8rem;
            position: relative;
        }
        
        .form-dropdown label {
            display: block;
            margin-bottom: 0.6rem;
            color: var(--dark-gray);
            font-size: 0.95rem;
            font-weight: 500;
        }
        
        .dropdown-select {
            width: 100%;
            padding: 0.9rem 1rem 0.9rem 3.2rem;
            border: 1px solid #e2e8f0;
            border-radius: var(--border-radius);
            font-size: 0.95rem;
            transition: var(--transition);
            background-color: #f8fafc;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1em;
        }
        
        .dropdown-select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.3);
            outline: none;
            background-color: white;
        }
        
        .dropdown-icon {
            position: absolute;
            left: 1rem;
            top: 2.7rem;
            color: var(--dark-gray);
            font-size: 1.2rem;
        }
        
        .error-field {
            border-color: var(--danger-color) !important;
        }
        
        @media (max-width: 768px) {
            .navbar {
                padding: 1rem;
            }
            
            .logo-name {
                font-size: 1.3rem;
            }
            
            .nav-links {
                gap: 0.8rem;
            }
            
            .nav-links a {
                padding: 0.5rem 0.8rem;
                font-size: 0.85rem;
            }
            
            .register-container {
                padding: 1.8rem;
                margin: 1rem;
            }
            
            .register-header h2 {
                font-size: 1.7rem;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
   <nav class="navbar">
        <div class="logo-container" onclick="window.location.href='../index.jsp'">
            <img src="../images/1.avif" alt="Logo" class="logo">
            <span class="logo-name">Health<span>Care</span></span>
        </div>
        
        <div class="nav-links">
            <a href="AdminLogin.jsp" class="nav-btn admin-btn">
                <i class="fas fa-user-shield"></i> ADMIN
            </a>
            <a href="DoctorLogin.jsp" class="nav-btn doctor-btn">
                <i class="fas fa-user-md"></i> DOCTOR
            </a>
            <a href="UserLogin.jsp" class="nav-btn user-btn">
                <i class="fas fa-user"></i> USER
            </a>
        </div>
    </nav>
    
    <div class="register-wrapper">
        <div class="register-container">
            <div class="register-header">
                <div class="patient-icon">
                    <i class="fas fa-user-plus"></i>
                </div>
                <h2>Patient Registration</h2>
                <p>Create your account to access healthcare services</p>
            </div>
            
            <% if(request.getAttribute("errorMessage") != null) { %>
                <div class="error-message" style="margin-bottom: 1.5rem;">
                    <i class="fas fa-exclamation-circle"></i>
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
            
            <form action="UserRegisterServlet" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">Full Name</label>
                        <div class="input-icon">
                            <i class="fas fa-user"></i>
                        </div>
                        <input type="text" id="firstName" name="firstName" 
                               value="<%= request.getParameter("firstName") != null ? request.getParameter("firstName") : "" %>" 
                               required
                               class="<%= "firstName".equals(request.getAttribute("errorField")) ? "error-field" : "" %>">
                        <% if("firstName".equals(request.getAttribute("errorField"))) { %>
                            <div class="error-message">
                                <i class="fas fa-exclamation-circle"></i>
                                <%= request.getAttribute("fieldErrorMessage") %>
                            </div>
                        <% } %>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <div class="input-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <input type="email" id="email" name="email" 
                           value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" 
                           required
                           class="<%= "email".equals(request.getAttribute("errorField")) ? "error-field" : "" %>">
                    <% if("email".equals(request.getAttribute("errorField"))) { %>
                        <div class="error-message">
                            <i class="fas fa-exclamation-circle"></i>
                            <%= request.getAttribute("fieldErrorMessage") %>
                        </div>
                    <% } %>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="input-icon">
                            <i class="fas fa-lock"></i>
                        </div>
                        <input type="password" id="password" name="password" 
                               required
                               pattern="(?=.*\d)(?=.*[!@#$%^&*]).{8,}"
                               title="Password must be at least 8 characters long and contain at least one number and one special character"
                               class="<%= "password".equals(request.getAttribute("errorField")) ? "error-field" : "" %>">
                        <div class="password-hint">
                            <i class="fas fa-info-circle"></i>
                            Use at least 8 characters with numbers and symbols
                        </div>
                        <% if("password".equals(request.getAttribute("errorField"))) { %>
                            <div class="error-message">
                                <i class="fas fa-exclamation-circle"></i>
                                <%= request.getAttribute("fieldErrorMessage") %>
                            </div>
                        <% } %>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <div class="input-icon">
                            <i class="fas fa-lock"></i>
                        </div>
                        <input type="password" id="confirmPassword" name="confirmPassword" 
                               required
                               class="<%= "confirmPassword".equals(request.getAttribute("errorField")) ? "error-field" : "" %>">
                        <% if("confirmPassword".equals(request.getAttribute("errorField"))) { %>
                            <div class="error-message">
                                <i class="fas fa-exclamation-circle"></i>
                                <%= request.getAttribute("fieldErrorMessage") %>
                            </div>
                        <% } %>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <div class="input-icon">
                        <i class="fas fa-phone"></i>
                    </div>
                    <input type="tel" id="phone" name="phone" 
                           value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>" 
                           required
                           pattern="[0-9]{10}"
                           title="Please enter a 10-digit phone number"
                           class="<%= "phone".equals(request.getAttribute("errorField")) ? "error-field" : "" %>">
                    <% if("phone".equals(request.getAttribute("errorField"))) { %>
                        <div class="error-message">
                            <i class="fas fa-exclamation-circle"></i>
                            <%= request.getAttribute("fieldErrorMessage") %>
                        </div>
                    <% } %>
                </div>
                
                <div class="form-dropdown">
                    <label for="user-type">User Type</label>
                    <div class="dropdown-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <select id="user-type" name="user" class="dropdown-select" required>
                        <option value="" disabled selected>Select user type</option>
                        <option value="user" <%= "user".equals(request.getParameter("user")) ? "selected" : "" %>>User</option>
                    </select>
                </div>
                
                <button type="submit" class="register-btn">
                    <i class="fas fa-user-plus"></i> Create Account
                </button>
                
                <div class="login-link">
                    <p>Already have an account? <a href="UserLogin.jsp"><i class="fas fa-sign-in-alt"></i> Login here</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>