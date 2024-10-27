<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                    <c:if test="${empty applications}">
                        <p class="text-center text-muted">No applications found.</p>
                    </c:if>
                    <c:if test="${ not empty applications}">
                        <div id="application-list">
                            <table class="table table-bordered">
                                <thead>
                                    <tr class="bg-dark text-white">
                                        <th>Application Id</th>
                                        <th>Applied date</th>
                                        <th>Job Deadline</th>
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
                                            <td><fmt:formatDate value="${application.appliedDate}" pattern="dd-MM-yyyy" /></td>
                                            <td><fmt:formatDate value="${application.job.lastDate}" pattern="dd-MM-yyyy" /></td>
                                            <td>${application.candidate.name}</td>
                                            <td>${application.candidate.address}</td>
                                            <td>${application.job.jobTitle}</td>
                                            <td>${application.job.jobLocation}</td>
                                            <td>${application.status}</td>
                                            <td>
                                               <a href="show-application?id=${application.applicationId}" class="btn btn-info btn-sm">View</a>
                                               <a href="delete-application?id=${application.applicationId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this application?')">Delete</a>
                                           </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </section>
            </div>
        </div>
   	</main>
</body>
</html>
