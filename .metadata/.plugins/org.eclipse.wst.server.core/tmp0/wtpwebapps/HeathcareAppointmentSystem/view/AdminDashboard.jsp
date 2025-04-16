<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | HealthCare Appointment System</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2563eb;
            --primary-dark: #1d4ed8;
            --secondary-color: #3b82f6;
            --accent-color: #60a5fa;
            --light-gray: #f8fafc;
            --dark-gray: #64748b;
            --danger-color: #ef4444;
            --success-color: #10b981;
            --warning-color: #f59e0b;
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
            background-color: white;
            color: var(--dark-gray);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 5%;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
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
            border: 2px solid var(--light-gray);
        }
        
        .logo-name {
            font-size: 22px;
            font-weight: 700;
            letter-spacing: 1px;
            color: var(--primary-color);
        }
        
        .logo-name span {
            color: var(--success-color);
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
            background-color: var(--primary-color);
        }
        
        .logout-btn {
            background-color: var(--danger-color);
        }
        
        .nav-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        /* Dashboard styles */
        .dashboard-container {
            display: flex;
            min-height: calc(100vh - 72px);
        }
        
        .sidebar {
            width: 280px;
            background: white;
            padding: 2rem 1.5rem;
            box-shadow: 2px 0 10px rgba(0,0,0,0.05);
        }
        
        .sidebar-header {
            display: flex;
            align-items: center;
            margin-bottom: 2.5rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid #e2e8f0;
        }
        
        .admin-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 1rem;
            border: 3px solid var(--accent-color);
        }
        
        .admin-info h3 {
            font-size: 1.1rem;
            color: var(--primary-dark);
            margin-bottom: 0.3rem;
        }
        
        .admin-info p {
            font-size: 0.85rem;
            color: var(--dark-gray);
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }
        
        .admin-info p i {
            color: var(--success-color);
            font-size: 0.7rem;
        }
        
        .sidebar-menu {
            list-style: none;
        }
        
        .menu-title {
            font-size: 0.8rem;
            text-transform: uppercase;
            color: var(--dark-gray);
            margin: 1.5rem 0 0.8rem;
            letter-spacing: 0.5px;
        }
        
        .menu-item {
            margin-bottom: 0.5rem;
        }
        
        .menu-link {
            display: flex;
            align-items: center;
            padding: 0.8rem 1rem;
            color: var(--dark-gray);
            text-decoration: none;
            border-radius: var(--border-radius);
            transition: var(--transition);
            font-size: 0.95rem;
            font-weight: 500;
        }
        
        .menu-link i {
            margin-right: 0.8rem;
            font-size: 1.1rem;
            width: 20px;
            text-align: center;
        }
        
        .menu-link:hover, .menu-link.active {
            background-color: rgba(59, 130, 246, 0.1);
            color: var(--primary-color);
        }
        
        .menu-link.active {
            font-weight: 600;
        }
        
        .dropdown-menu {
            list-style: none;
            margin-left: 1.5rem;
            margin-top: 0.5rem;
            max-height: 500px;
            overflow: hidden;
        }
        
        .dropdown-item {
            margin-bottom: 0.3rem;
        }
        
        .dropdown-link {
            display: flex;
            align-items: center;
            padding: 0.6rem 1rem;
            color: var(--dark-gray);
            text-decoration: none;
            border-radius: var(--border-radius);
            transition: var(--transition);
            font-size: 0.9rem;
        }
        
        .dropdown-link i {
            margin-right: 0.8rem;
            font-size: 0.9rem;
            width: 20px;
            text-align: center;
        }
        
        .dropdown-link:hover, .dropdown-link.active {
            background-color: rgba(59, 130, 246, 0.05);
            color: var(--primary-color);
        }
        
        .main-content {
            flex: 1;
            padding: 2.5rem;
            background-color: #f8fafc;
        }
        
        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }
        
        .page-title {
            font-size: 1.8rem;
            color: var(--primary-dark);
            font-weight: 700;
        }
        
        .breadcrumb {
            display: flex;
            align-items: center;
            font-size: 0.9rem;
            color: var(--dark-gray);
        }
        
        .breadcrumb a {
            color: var(--primary-color);
            text-decoration: none;
            transition: var(--transition);
        }
        
        .breadcrumb a:hover {
            text-decoration: underline;
        }
        
        .breadcrumb i {
            margin: 0 0.5rem;
            font-size: 0.7rem;
            color: var(--dark-gray);
        }
        
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2.5rem;
        }
        
        .stat-card {
            background: white;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            box-shadow: var(--shadow);
            transition: var(--transition);
            border-left: 4px solid var(--primary-color);
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .stat-card.users {
            border-left-color: var(--success-color);
        }
        
        .stat-card.doctors {
            border-left-color: var(--accent-color);
        }
        
        .stat-card.appointments {
            border-left-color: var(--warning-color);
        }
        
        .stat-title {
            font-size: 0.9rem;
            color: var(--dark-gray);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-dark);
            margin-bottom: 0.5rem;
        }
        
        .stat-card.users .stat-value {
            color: var(--success-color);
        }
        
        .stat-card.doctors .stat-value {
            color: var(--accent-color);
        }
        
        .stat-card.appointments .stat-value {
            color: var(--warning-color);
        }
        
        .stat-change {
            font-size: 0.85rem;
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }
        
        .stat-change.positive {
            color: var(--success-color);
        }
        
        .stat-change.negative {
            color: var(--danger-color);
        }
        
        .recent-activity {
            background: white;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
        }
        
        .section-title {
            font-size: 1.3rem;
            color: var(--primary-dark);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }
        
        .section-title i {
            font-size: 1.1rem;
            color: var(--accent-color);
        }
        
        .activity-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .activity-table th {
            text-align: left;
            padding: 0.8rem 1rem;
            background-color: #f8fafc;
            color: var(--dark-gray);
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .activity-table td {
            padding: 1rem;
            border-bottom: 1px solid #e2e8f0;
            font-size: 0.95rem;
        }
        
        .activity-table tr:last-child td {
            border-bottom: none;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }
        
        .user-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            object-fit: cover;
        }
        
        .status-badge {
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        
        .status-badge.success {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success-color);
        }
        
        .status-badge.warning {
            background-color: rgba(245, 158, 11, 0.1);
            color: var(--warning-color);
        }
        
        .status-badge.danger {
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger-color);
        }
        
        .action-btn {
            padding: 0.5rem 1rem;
            border-radius: var(--border-radius);
            font-size: 0.85rem;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            border: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .action-btn.view {
            background-color: rgba(59, 130, 246, 0.1);
            color: var(--primary-color);
        }
        
        .action-btn.edit {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success-color);
        }
        
        .action-btn.delete {
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger-color);
        }
        
        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
        }
        
        .action-card {
            background: white;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            box-shadow: var(--shadow);
            transition: var(--transition);
            text-align: center;
            cursor: pointer;
        }
        
        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .action-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            font-size: 1.5rem;
        }
        
        .action-icon.users {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success-color);
        }
        
        .action-icon.doctors {
            background-color: rgba(59, 130, 246, 0.1);
            color: var(--primary-color);
        }
        
        .action-icon.appointments {
            background-color: rgba(245, 158, 11, 0.1);
            color: var(--warning-color);
        }
        
        .action-icon.reports {
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger-color);
        }
        
        .action-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--primary-dark);
        }
        
        .action-desc {
            font-size: 0.85rem;
            color: var(--dark-gray);
        }
        
        @media (max-width: 1200px) {
            .dashboard-container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                padding: 1.5rem;
            }
            
            .sidebar-header {
                margin-bottom: 1.5rem;
            }
            
            .main-content {
                padding: 1.5rem;
            }
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
            
            .nav-btn {
                padding: 0.5rem 0.8rem;
                font-size: 0.85rem;
            }
            
            .stats-container, .quick-actions {
                grid-template-columns: 1fr;
            }
            
            .activity-table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo-container" onclick="window.location.href='${pageContext.request.contextPath}/index.jsp'">
            <img src="../images/1.avif" alt="HealthCare Logo" class="logo">
            <span class="logo-name">Health<span>Care</span></span>
        </div>
        
        <div class="nav-links">
            <a href="#" class="nav-btn admin-btn">
                <i class="fas fa-user-shield"></i> ADMIN DASHBOARD
            </a>
            <a href="${pageContext.request.contextPath}/AdminLogoutServlet" class="nav-btn logout-btn">
                <i class="fas fa-sign-out-alt"></i> LOGOUT
            </a>
        </div>
    </nav>
    
    <div class="dashboard-container">
        <aside class="sidebar">
            <div class="sidebar-header">
                <img src="../images/admin-avatar.jpg" alt="Admin Avatar" class="admin-avatar">
                <div class="admin-info">
                    <h3>Admin User</h3>
                    <p><i class="fas fa-circle"></i> Super Administrator</p>
                </div>
            </div>
            
            <ul class="sidebar-menu">
                <li class="menu-title">Navigation</li>
                <li class="menu-item">
                    <a href="#" class="menu-link active">
                        <i class="fas fa-tachometer-alt"></i> Dashboard
                    </a>
                </li>
                
                <li class="menu-title">Management</li>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/view/ManageDoctors.jsp" class="menu-link">
                        <i class="fas fa-user-md"></i> Manage Doctors
                    </a>
                </li>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/view/ManageUsers.jsp" class="menu-link">
                        <i class="fas fa-users"></i> Manage Users
                    </a>
                </li>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/view/ViewAppointments.jsp" class="menu-link">
                        <i class="fas fa-calendar-check"></i> View Appointments
                    </a>
                </li>
                
                <li class="menu-title">Reports</li>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/GenerateDoctorReportServlet" class="menu-link">
                        <i class="fas fa-user-md"></i> Doctors Report
                    </a>
                </li>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/GenerateUserReportServlet" class="menu-link">
                        <i class="fas fa-users"></i> Users Report
                    </a>
                </li>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/GenerateAppointmentReportServlet" class="menu-link">
                        <i class="fas fa-calendar-alt"></i> Appointments Report
                    </a>
                </li>
            </ul>
        </aside>
        
        <main class="main-content">
            <div class="content-header">
                <h1 class="page-title">Admin Dashboard</h1>
                <div class="breadcrumb">
                    <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
                    <i class="fas fa-chevron-right"></i>
                    <span>Admin Dashboard</span>
                </div>
            </div>
            
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-title">
                        <i class="fas fa-user-md"></i> Total Doctors
                    </div>
                    <div class="stat-value">142</div>
                    <div class="stat-change positive">
                        <i class="fas fa-arrow-up"></i> 12% from last month
                    </div>
                </div>
                
                <div class="stat-card users">
                    <div class="stat-title">
                        <i class="fas fa-users"></i> Registered Users
                    </div>
                    <div class="stat-value">2,548</div>
                    <div class="stat-change positive">
                        <i class="fas fa-arrow-up"></i> 8% from last month
                    </div>
                </div>
                
                <div class="stat-card doctors">
                    <div class="stat-title">
                        <i class="fas fa-calendar-check"></i> Appointments
                    </div>
                    <div class="stat-value">1,876</div>
                    <div class="stat-change positive">
                        <i class="fas fa-arrow-up"></i> 15% from last month
                    </div>
                </div>
                
                <div class="stat-card appointments">
                    <div class="stat-title">
                        <i class="fas fa-clock"></i> Pending Approvals
                    </div>
                    <div class="stat-value">23</div>
                    <div class="stat-change negative">
                        <i class="fas fa-arrow-down"></i> 5 from yesterday
                    </div>
                </div>
            </div>
            
            <div class="recent-activity">
                <h2 class="section-title">
                    <i class="fas fa-history"></i> Recent Activity
                </h2>
                
                <table class="activity-table">
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Activity</th>
                            <th>Time</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <img src="../images/user1.jpg" alt="User" class="user-avatar">
                                    <span>John Smith</span>
                                </div>
                            </td>
                            <td>New appointment booked</td>
                            <td>10 min ago</td>
                            <td><span class="status-badge success">Completed</span></td>
                            <td>
                                <button class="action-btn view">
                                    <i class="fas fa-eye"></i> View
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <img src="../images/user2.jpg" alt="User" class="user-avatar">
                                    <span>Sarah Johnson</span>
                                </div>
                            </td>
                            <td>Doctor registration</td>
                            <td>25 min ago</td>
                            <td><span class="status-badge warning">Pending</span></td>
                            <td>
                                <button class="action-btn edit">
                                    <i class="fas fa-edit"></i> Approve
                                </button>
                                <button class="action-btn delete">
                                    <i class="fas fa-trash"></i> Reject
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <img src="../images/user3.jpg" alt="User" class="user-avatar">
                                    <span>Michael Brown</span>
                                </div>
                            </td>
                            <td>Appointment cancellation</td>
                            <td>1 hour ago</td>
                            <td><span class="status-badge danger">Cancelled</span></td>
                            <td>
                                <button class="action-btn view">
                                    <i class="fas fa-eye"></i> View
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <img src="../images/user4.jpg" alt="User" class="user-avatar">
                                    <span>Emily Davis</span>
                                </div>
                            </td>
                            <td>Profile update</td>
                            <td>2 hours ago</td>
                            <td><span class="status-badge success">Completed</span></td>
                            <td>
                                <button class="action-btn view">
                                    <i class="fas fa-eye"></i> View
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <img src="../images/user5.jpg" alt="User" class="user-avatar">
                                    <span>Robert Wilson</span>
                                </div>
                            </td>
                            <td>New user registration</td>
                            <td>3 hours ago</td>
                            <td><span class="status-badge success">Completed</span></td>
                            <td>
                                <button class="action-btn view">
                                    <i class="fas fa-eye"></i> View
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <div class="quick-actions">
                <div class="action-card" onclick="window.location.href='${pageContext.request.contextPath}/view/ManageUsers.jsp'">
                    <div class="action-icon users">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3 class="action-title">Manage Users</h3>
                    <p class="action-desc">View, edit, or delete user accounts</p>
                </div>
                
                <div class="action-card" onclick="window.location.href='${pageContext.request.contextPath}/view/ManageDoctors.jsp'">
                    <div class="action-icon doctors">
                        <i class="fas fa-user-md"></i>
                    </div>
                    <h3 class="action-title">Manage Doctors</h3>
                    <p class="action-desc">Add new doctors or update existing profiles</p>
                </div>
                
                <div class="action-card" onclick="window.location.href='${pageContext.request.contextPath}/view/ViewAppointments.jsp'">
                    <div class="action-icon appointments">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <h3 class="action-title">View Appointments</h3>
                    <p class="action-desc">Monitor and manage all appointments</p>
                </div>
                
                <div class="action-card" onclick="window.location.href='${pageContext.request.contextPath}/GenerateDoctorReportServlet'">
                    <div class="action-icon reports">
                        <i class="fas fa-chart-pie"></i>
                    </div>
                    <h3 class="action-title">Generate Reports</h3>
                    <p class="action-desc">Create system reports for analysis</p>
                </div>
            </div>
        </main>
    </div>
</body>
</html>