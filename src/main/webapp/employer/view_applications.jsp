<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.*, model.*, java.util.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal: View Applications</title>
    <link rel="stylesheet" href="../css/style.css">
    <%@ include file="../components/header.jsp"%>
    <style>
        body {
            background-color: #f8f9fa;
        }

        .search-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        form{
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <c:if test="${not empty success}">
            <script>
                showToast("${success}");
            </script>
        </c:if>

    <main>

       <%@ include file="employer_navbar.jsp"%>

        <div class="content view-applications">



            <div class="main-content">
                <h2 class="title text-center bg-primary text-white p-3">View Applications</h2>

                <section>
                    <c:if test="${empty applications}">
                        <p class="text-center text-muted">No applications found.</p>
                    </c:if>
                    <c:if test="${ not empty applications}">
                        <div id="application-list">
                            <table class="table table-bordered">
                                <thead>
                                    <tr class="bg-secondary text-white">
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
                                            <td>
                                                <c:if test="${application.status == 'Accepted'}">
                                                    <span class="text-capitalize text-success"><i class="fas fa-check-circle"></i> ${application.status}</span>
                                                </c:if>
                                                <c:if test="${application.status == 'Rejected'}">
                                                    <span class="text-capitalize text-danger"> <i class="fas fa-times-circle"></i> ${application.status}</span>
                                                </c:if>
                                             </td>
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
