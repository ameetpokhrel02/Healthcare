<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Recovery | HealthCare Appointment System</title>
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
        
        .recovery-wrapper {
            display: flex;
            min-height: calc(100vh - 72px);
            align-items: center;
            justify-content: center;
            padding: 2rem;
            background: url('images/recovery-bg.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
        }
        
        .recovery-wrapper::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(59, 130, 246, 0.88);
        }
        
        .recovery-container {
            width: 100%;
            max-width: 500px;
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
        
        .recovery-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }
        
        .recovery-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .recovery-header h2 {
            color: var(--primary-color);
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
            font-weight: 700;
        }
        
        .recovery-header p {
            color: var(--dark-gray);
            font-size: 0.95rem;
        }
        
        .user-type-badge {
            display: inline-block;
            padding: 0.3rem 1rem;
            background-color: rgba(59, 130, 246, 0.1);
            color: var(--primary-color);
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }
        
        .security-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
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
        
        .reset-btn {
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
        
        .reset-btn:hover {
            background: linear-gradient(135deg, var(--primary-dark), var(--secondary-color));
            box-shadow: 0 6px 12px rgba(59, 130, 246, 0.25);
            transform: translateY(-2px);
        }
        
        .back-to-login {
            text-align: center;
            margin-top: 1.8rem;
            font-size: 0.95rem;
            color: var(--dark-gray);
        }
        
        .back-to-login a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }
        
        .back-to-login a:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
        
        .message {
            padding: 0.9rem 1rem;
            margin-bottom: 1.8rem;
            border-radius: var(--border-radius);
            font-size: 0.95rem;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.6rem;
        }
        
        .success {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success-color);
            border: 1px solid rgba(16, 185, 129, 0.2);
        }
        
        .error {
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger-color);
            border: 1px solid rgba(239, 68, 68, 0.2);
        }
        
        .password-hint {
            margin-top: 0.5rem;
            font-size: 0.85rem;
            color: var(--dark-gray);
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }
        
        @media (max-width: 768px) {
            .navbar {
                padding: 1rem;
            }
            
            .nav-links {
                gap: 0.8rem;
            }
            
            .recovery-container {
                padding: 1.8rem;
                margin: 1rem;
            }
            
            .recovery-header h2 {
                font-size: 1.7rem;
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
    
    <div class="recovery-wrapper">
        <div class="recovery-container">
            <div class="recovery-header">
                <div class="security-icon">
                    <i class="fas fa-key"></i>
                </div>
                <h2>Password Recovery</h2>
                <p>Reset your account password securely</p>
                
                <%
                    String type = request.getParameter("type");
                    String userType = "";
                    String actionUrl = "";
                    String loginPage = "UserLogin.jsp";

                    if ("Admin".equals(type)) {
                        userType = "Admin Account";
                        actionUrl = "AdminForgotPasswordServlet";
                        loginPage = "AdminLogin.jsp";
                    } else if ("Doctor".equals(type)) {
                        userType = "Doctor Account";
                        actionUrl = "DoctorForgotPasswordServlet";
                        loginPage = "DoctorLogin.jsp";
                    } else {
                        userType = "User Account";
                        actionUrl = "UserForgotPasswordServlet";
                        loginPage = "UserLogin.jsp";
                    }
                %>
                <div class="user-type-badge">
                    <i class="fas fa-user-tag"></i> <%= userType %>
                </div>
            </div>
            
            <%
                String message = (String) request.getAttribute("message");
                String messageClass = (String) request.getAttribute("messageClass");
                if (message != null) {
            %>
                <div class="message <%= messageClass %>">
                    <i class="fas fa-<%= "success".equals(messageClass) ? "check-circle" : "exclamation-circle" %>"></i>
                    <%= message %>
                </div>
            <% } %>
            
            <form action="<%= actionUrl %>" method="post">
                <input type="hidden" name="type" value="<%= type %>">
                
                <% if ("User".equals(type)) { %>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <div class="input-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <input type="email" id="email" name="email" placeholder="Enter your registered email" required>
                    </div>
                <% } else { %>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <div class="input-icon">
                            <i class="fas fa-user"></i>
                        </div>
                        <input type="text" id="username" name="username" placeholder="Enter your username" required>
                    </div>
                <% } %>
                
                <div class="form-group">
                    <label for="securityQuestion">Security Question</label>
                    <div class="input-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <select id="securityQuestion" name="securityQuestion" required>
                        <option value="">Select a security question</option>
                        <option value="What was your first pet's name?">What was your first pet's name?</option>
                        <option value="What city were you born in?">What city were you born in?</option>
                        <option value="What is your mother's maiden name?">What is your mother's maiden name?</option>
                        <option value="What was the name of your first school?">What was the name of your first school?</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="securityAnswer">Security Answer</label>
                    <div class="input-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <input type="text" id="securityAnswer" name="securityAnswer" placeholder="Enter your answer" required>
                </div>
                
                <div class="form-group">
                    <label for="newPassword">New Password</label>
                    <div class="input-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <input type="password" id="newPassword" name="newPassword" placeholder="Create a new password" required>
                    <div class="password-hint">
                        <i class="fas fa-info-circle"></i>
                        Minimum 8 characters with numbers and symbols
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="confirmPassword">Confirm New Password</label>
                    <div class="input-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your new password" required>
                </div>
                
                <button type="submit" class="reset-btn">
                    <i class="fas fa-sync-alt"></i> Reset Password
                </button>
                
                <div class="back-to-login">
                    <a href="<%= loginPage %>"><i class="fas fa-arrow-left"></i> Back to Login</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>