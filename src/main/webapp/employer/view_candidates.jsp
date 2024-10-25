<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.*, model.*, java.util.*" %>

<%
     CandidateDao candidateDao = new CandidateDao();
    List<Candidate> candidates = candidateDao.getAllCandidates();

    request.setAttribute("candidates", candidates);

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
                <h4 class="title">All Candidates</h4>
                <!-- Job Postings Section -->
                <section>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Candidate Id</th>
                                                <th>Name</th>
                                                <th>Address</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Skills</th>
                                                <th>Education</th>
                                                <th>Experience</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${candidates}" var="candidate">
                                              <tr>
                                                  <td>${candidate.candidateId}</td>
                                                  <td>${candidate.name}</td>
                                                  <td>${candidate.address}</td>
                                                  <td>${candidate.user.email}</td>
                                                  <td>${candidate.user.phone}</td>
                                                  <td>${candidate.skills}</td>
                                                  <td>${candidate.education}</td>
                                                  <td>${candidate.experience} Years</td>
                                                  <td>${candidate.user.status}</td>
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
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
   	</main>
</body>
</html>
