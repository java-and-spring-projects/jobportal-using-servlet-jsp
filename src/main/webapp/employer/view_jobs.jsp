<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>


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
                <c:if test="${not empty success}">
                      <script>
                          showToast("${success}");
                      </script>
                  </c:if>

                <h4 class="title">Your Job Postings</h4>
                <!-- Job Postings Section -->
                <section>
                     <c:if test="${empty jobs}">
                        <p class="text-center text-muted">No jobs found.</p>
                    </c:if>

                    <c:if test="${not empty jobs}">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr class="bg-dark text-white">
                                                    <th>Job ID</th>
                                                    <th>Job Title</th>
                                                    <th>Location</th>
                                                    <th>Date Posted</th>
                                                    <th>Last Date</th>
                                                    <th>Status</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                              <c:forEach items="${jobs}" var="job">
                                                  <tr>
                                                      <td>${job.jobId}</td>
                                                      <td>${job.jobTitle}</td>
                                                      <td>${job.jobLocation}</td>
                                                      <td><fmt:formatDate value="${job.createdAt}" pattern="dd-MM-yyyy" /></td>
                                                      <td><fmt:formatDate value="${job.lastDate}" pattern="dd-MM-yyyy" /></td>
                                                      <td>
                                                        <c:if test="${job.jobStatus == 'Open'}">
                                                            <p class="text-success"><i class="fas fa-check-circle text-success"></i> ${job.jobStatus}</p>

                                                        </c:if>
                                                        <c:if test="${job.jobStatus == 'Close'}">
                                                            <span  <p class="text-danger"><i class="fas fa-times-circle text-danger"></i> ${job.jobStatus}</p>

                                                        </c:if>
                                                      <td>
                                                           <a href="view-job-details?id=${job.jobId}" class="btn btn-info btn-sm">View</a>
                                                           <a href="edit-job?id=${job.jobId}" class="btn btn-primary btn-sm">Edit</a>
                                                           <a href="delete-job?id=${job.jobId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this job?')">Delete</a>
                                                       </td>
                                                  </tr>
                                              </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                </section>
            </div>
        </div>
   	</main>
</body>
</html>
