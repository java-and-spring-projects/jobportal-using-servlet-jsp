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
    <title>Job Portal: View Job Details</title>
    <link rel="stylesheet" href="../css/style.css">
    <%@ include file="../components/header.jsp"%>
    <style>
        body {
            background-color: #f8f9fa;
        }
       .view-job-details{
            width: 80%;
            position: absolute;
            right: 1%;
            top:0;
        }
        .view-job-details .header{
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            border-bottom: 1px solid #ddd;
            background-color: skyblue;
            margin-top: 10px;
            color: yellow;
            font-size: 30px;
            font-weight: 600;
        }
        .view-job-details .main-content{
             margin:30px auto;
        }

        .view-job-details .main-content section{
            box-shadow: 0 0 1px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            background-color: #fff;
            border-radius: 5px;
            padding: 40px 70px;
            width: 40%;
            margin: 20px auto;
        }
        section span{
            font-weight: 600;
        }
        .main-content .title{
            text-align: center;
            font-size: 30px;
        }
        section .buttons{
            display: flex;
            align-items: center;
            margin-top: 20px;
            gap: 10px;
            margin: 10px auto;
        }
    </style>
</head>
<body>

    <main>

       <%@ include file="employer_navbar.jsp"%>

        <div class="content view-job-details">


            <div class="main-content">
                <h4 class="title">View Job Posting</h4>

                <section>
                    <table class="table table-bordered" >
                        <tr>
                            <th>Job Title</th>
                            <td>${job.jobTitle}</td>
                        </tr>
                        <tr>
                            <th>Job Description</th>
                            <td>${job.jobDescription}</td>
                        </tr>
                        <tr>
                            <th>Salary</th>
                            <td>${job.jobSalary}</td>
                        </tr>
                        <tr>
                            <th>Location</th>
                            <td>${job.jobLocation}</td>
                        </tr>
                        <tr>
                            <th>Last Date</th>
                            <td>${job.lastDate}</td>
                        </tr>
                        <tr>
                            <th>Job Type</th>
                            <td>${job.jobType}</td>
                        </tr>
                        <tr>
                            <th>Education required</th>
                            <td>${job.education}</td>
                        </tr>
                        <tr>
                            <th>Experience required</th>
                            <td>${job.experience} Years</td>
                        </tr>
                        <tr>
                            <th>Job Status</th>
                            <td>
                                <c:if test="${job.jobStatus == 'Open'}">
                                    <span class="badge bg-success">${job.jobStatus}</span>
                                </c:if>
                                <c:if test="${job.jobStatus == 'Close'}">
                                    <span class="badge bg-danger">${job.jobStatus}</span>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Posted Date</th>
                            <td>${job.createdAt}</td>
                        </tr>
                        <tr>
                            <th>Posted By</th>
                            <td>${sessionScope.user.username}</td>
                        </tr>
                        <tr>
                            <th>Total Vacancy</th>
                            <td>${job.vacancy}</td>
                        </tr>
                        <tr>
                            <th>Requiment</th>
                            <td>${job.requirements}</td>
                        </tr>
                        <tr>
                            <th>Responsibility</th>
                            <td>${job.responsibilities}</td>
                        </tr>
                        <tr>
                            <th>Benefits</th>
                            <td>${job.benefits}</td>
                        </tr>

                     </table>

                       <div class="buttons">
                           <a href="edit-job?id=${job.jobId}" class="btn btn-primary btn-success">Edit</a>
                           <a href="delete-job?id=${job.jobId}" class="btn btn-primary btn-danger" onclick="return confirm('Are you sure you want to delete this job?')">Delete</a>
                       </div>
                </section>
            </div>
        </div>
   	</main>
</body>
</html>
