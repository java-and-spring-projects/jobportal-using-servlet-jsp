<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.*, model.*, java.util.*" %>

<%
    ApplicationDao applicationDao = new ApplicationDao();
    List<Application> applications = applicationDao.getAllApplications();

   request.setAttribute("applications", applications);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employer Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
    <%@ include file="../components/header.jsp"%>
    <style>
        body {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>

    <main>

       <%@ include file="employer_navbar.jsp"%>

        <div class="content show-application">
            <div class="header">
                <h4>Welcome, <span style="font-weight: bold">${sessionScope.user.username}</span></h4>
            </div>


            <div class="main-content">
                <h4 class="title">Update Application</h4>
                <section>
                    <div id="application-list">
                       <section id="section-application">
                            <p>Applied on: <span>${application.appliedDate}</span></p>
                            <p>Status: <span>${application.status}</span></p>
                            <a href="view-resume?id=${application.applicationId}">Download Resume</a>
                       </section>

                       <section id="section-candidate">
                            <p>Candidate Name: <span>${application.candidate.name}</span></p>
                            <p>Candidate Email: <span>${application.user.email}</span></p>
                            <p>Candidate Phone: <span>${application.user.phone}</span></p>
                            <p>Candidate Education: <span>${application.candidate.education}</span></p>
                            <p>Candidate Experience: <span>${application.candidate.experience} Years</span></p>
                       </section>

                       <section id="section-job">
                            <p>Job Title: <span>${application.job.jobTitle}</span></p>
                            <p>Job Location: <span>${application.job.jobLocation}</span></p>
                            <p>Job Salary: <span>${application.job.jobSalary} /- p.a.</span></p>
                            <p>Job Type: <span>${application.job.jobType}</span></p>
                            <p>Job Description: <span>${application.job.jobDescription}</span></p>

                       </section>
                    </div>
                </section>
            </div>
        </div>
   	</main>
</body>
</html>
