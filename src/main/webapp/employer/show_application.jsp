<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.*, model.*, java.util.*" %>

<%
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("user");

    ApplicationDao applicationDao = new ApplicationDao();
    List<Application> applications = applicationDao.getAllApplications(user.getUserId());

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
        .job-card{
            width: 35%;
        }
        .candidate-card{
            width: 35%;
        }
    </style>
</head>
<body>

    <main>

       <%@ include file="employer_navbar.jsp"%>

        <div class="content show-application">

            <div class="main-content">
                <h4 class="title">Update Application</h4>

                <section id="application-details">
                    <div class="application-card">
                        <p>Applied on: <span>${application.appliedDate}</span></p>
                        <p>Status: <span>${application.status}</span></p>
                        <p>Resume: <span><a href="${pageContext.request.contextPath}/employer/view-resume?id=${application.applicationId}" target="_blank">Download Resume</a></span></p>
                        <a href="${pageContext.request.contextPath}/employer/update-application?id=${application.applicationId}&status=Accepted" class="btn btn-sm btn-success"> <i class="fa fa-check"></i> Accept</a>
                        <a href="${pageContext.request.contextPath}/employer/update-application?id=${application.applicationId}&status=Rejected" class="btn btn-sm btn-outline-danger"><i class="fa fa-times"></i> Reject</a>

                    </div>
                    <div class="candidate-job-details">
                        <div class="candidate-card card">
                            <div class="card-header text-center bg-secondary text-white">Candidate Details</div>
                            <div class="card-body">
                                <p>Name: <span>${application.candidate.name}</span></p>
                                <p>Email: <span>${application.user.email}</span></p>
                                <p>Phone: <span>${application.user.phone}</span></p>
                                <p>Education: <span>${application.candidate.education}</span></p>
                                <p>Experience: <span>${application.candidate.experience} Years</span></p>
                                <a href="view-candidate-details?id=${application.candidate.candidateId}" class="btn btn-outline-primary btn-sm">View Candidate Profile</a>
                            </div>
                        </div>

                        <div class="job-card card">
                            <div class="card-header text-center bg-secondary text-white">Job Details</div>
                            <div class="card-body">
                                 <p>Job Title: <span>${application.job.jobTitle}</span></p>
                                <p>Job Location: <span>${application.job.jobLocation}</span></p>
                                <p>Salary: <span>${application.job.jobSalary} /- p.a.</span></p>
                                <p>Job Type: <span>${application.job.jobType}</span></p>
                                <p>Description: <span>${application.job.jobDescription}</span></p>
                                <p>Vacancy: <span>${application.job.vacancy}</span></p>
                                <a href="view-job-details?id=${application.job.jobId}" class="btn btn-outline-primary btn-sm">View Job Details</a>
                            </div>
                        </div>

                    </div>
                    <a href="delete-application?id=${application.applicationId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this application?')">Delete Application</a>

                </section>
            </div>
        </div>
   	</main>

</body>
</html>
