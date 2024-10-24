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

        <div class="content view-applications">
            <div class="header">
                <h4>Welcome, <span style="font-weight: bold">${sessionScope.user.username}</span></h4>
            </div>


            <div class="main-content">
                <h4 class="title">View Applications</h4>
                <section>
                    <div id="application-list">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Application Id</th>
                                    <th>Applied date</th>
                                    <th>Candidate Name</th>
                                    <th>Candidate Address</th>
                                    <th>Job Title</th>
                                    <th>Job Location</th>
                                    <th>Application Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${applications}" var="application">
                                    <tr>
                                        <td>${application.applicationId}</td>
                                        <td>${application.appliedDate}</td>
                                        <td>${application.candidate.name}</td>
                                        <td>${application.candidate.address}</td>
                                        <td>${application.job.jobTitle}</td>
                                        <td>${application.job.jobLocation}</td>
                                        <td>${application.status}</td>
                                        <td>
                                           <a href="view_job.jsp?id=${job.jobId}" class="btn btn-info btn-sm">View</a>
                                           <a href="#" class="btn btn-primary btn-sm">Edit</a>
                                           <a href="#" class="btn btn-danger btn-sm">Delete</a>
                                       </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
        </div>
   	</main>
</body>
</html>
