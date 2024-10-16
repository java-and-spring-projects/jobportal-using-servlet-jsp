<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<nav class="sidebar">
            <h4>Employer Dashboard</h4>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="employer_dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="company_profile.jsp"><i class="fas fa-building"></i> Company Details</a>
                </li>
                 <li>
                    <a class="nav-link" href="profile.jsp"><i class="fas fa-user"></i>Employer Profile</a>
                <hr>
                <li class="nav-item">
                    <a class="nav-link" href="post_job.jsp"><i class="fas fa-plus-circle"></i> Post Job</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="view_jobs.jsp"><i class="fas fa-briefcase"></i> View Jobs</a>
                </li><hr>


                <li class="nav-item">
                    <a class="nav-link" href="add_department.jsp"><i class="fas fa-plus"></i> Add Department</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="departments.jsp"><i class="fas fa-sitemap"></i>View Departments</a>
                </li><hr>
                <li class="nav-item">
                    <a class="nav-link" href="view_applicants.jsp"><i class="fas fa-users"></i> View Applicants</a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="registered_candidates.jsp"><i class="fas fa-user-graduate"></i> View Candidates</a>
                </li>
                <hr>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout"><i class="fas fa-right-from-bracket"></i> Logout</a>
                </li>
            </ul>
        </nav>