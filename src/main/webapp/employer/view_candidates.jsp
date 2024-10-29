<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.*, model.*, java.util.*" %>




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
        form{
            margin-bottom: 20px;
        }
        .search-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;

        }
    </style>
</head>
<body>

    <main>

       <%@ include file="employer_navbar.jsp"%>

        <div class="content view-applications">


            <div class="main-content">
                <h4 class="title text-center bg-primary text-white p-3">All Candidates</h4>
                <div class="search-bar">
                    <form action="search-candidates" method="get">
                        <input type="text" name="search-keyword" placeholder="Search candidates..." required>
                        <button type="submit">Search</button>
                    </form>
                    <a href="view-candidates" class="btn btn-primary btn-sm">All Candidate</a>
                </div>
                <!-- Job Postings Section -->
                <section>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr class="bg-secondary text-white">
                                                <th>Candidate Id</th>
                                                <th>Name</th>
                                                <th>Address</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Skills</th>
                                                <th>Education</th>
                                                <th>Experience</th>
                                                <th>Status</th>
                                                <th>Resume</th>
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
                                                  <td class="text-center"><a href="${pageContext.request.contextPath}/employer/candidate-resume?id=${candidate.candidateId}" target="_blank"> <i class="fas fa-download"></i> </a></td>
                                                  <td style="width: 200px">
                                                       <a href="view-candidate-details?id=${candidate.candidateId}" class="btn btn-info btn-sm"><i class="fas fa-eye"></i> View</a>

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
