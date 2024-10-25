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
     <%@ include file="../components/header.jsp"%>
    <link rel="stylesheet" href="../css/style.css">
    <%@ include file="../components/header.jsp"%>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .show-application .main-content #application-details{
            border-radius: 5px;
            padding: 50px 60px;
            background-color: #fff;
            display: flex;
            gap: 60px;
            flex-direction: column;
            width: 70%;
            margin: auto;
            box-shadow: 0 0 1px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);

        }
        .show-application .main-content .application-card{
            box-shadow: 0 0 1px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            padding: 40px 200px;
            margin: auto;
            border-radius: 5px;
        }
        .show-application .main-content span{
            font-weight: 600;
        }

        .show-application .main-content .candidate-job-details{
            display: flex;
            justify-content: space-evenly;
            gap: 50px;
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

                <section id="application-details">
                    <div class="application-card">
                        <p>Applied on: <span>${application.appliedDate}</span></p>
                        <p>Status: <span>${application.status}</span></p>
                        <p>Resume: <span><a href="${pageContext.request.contextPath}/employer/view-resume?id=${application.applicationId}" target="_blank">Download Resume</a></span></p>
                        <a href="${pageContext.request.contextPath}/employer/update-application?id=${application.applicationId}&status=Accepted" class="btn btn-success btn-sm">Accept</a>
                        <a href="${pageContext.request.contextPath}/employer/update-application?id=${application.applicationId}&status=Rejected" class="btn btn-danger btn-sm">Reject</a>

                    </div>
                    <div class="candidate-job-details">
                        <div class="candidate-card card">
                            <div class="card-header text-center bg-primary text-white">Candidate Details</div>
                            <div class="card-body">
                                <p>Name: <span>${application.candidate.name}</span></p>
                                <p>Email: <span>${application.user.email}</span></p>
                                <p>Phone: <span>${application.user.phone}</span></p>
                                <p>Education: <span>${application.candidate.education}</span></p>
                                <p>Experience: <span>${application.candidate.experience} Years</span></p>
                            </div>
                        </div>

                        <div class="job-card card">
                            <div class="card-header text-center bg-primary text-white">Job Details</div>
                            <div class="card-body">
                                 <p>Job Title: <span>${application.job.jobTitle}</span></p>
                                <p>Job Location: <span>${application.job.jobLocation}</span></p>
                                <p>Salary: <span>${application.job.jobSalary} /- p.a.</span></p>
                                <p>Job Type: <span>${application.job.jobType}</span></p>
                                <p>Description: <span>${application.job.jobDescription}</span></p>
                                <p>Vacancy: <span>${application.job.vacancy}</span></p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
   	</main>

</body>
</html>
