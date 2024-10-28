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
        .container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .profile-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            overflow: hidden;
        }

        .profile-header {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 20px;
        }

        .profile-header h1 {
            margin: 10px 0;
        }
        .profile-header p {
            font-size: 16px;
        }

        .profile-image {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            border: 4px solid white;
            margin-top: -10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        .profile-body {
            padding: 20px;
        }

        .profile-body h2 {
            color: #007bff;
            margin-top: 20px;
            font-size: 20px;
        }

        .contact-info {
            list-style: none;
            padding: 0;
        }

        .contact-info li {
            margin: 5px 0;
        }

        .profile-footer {
            display: flex;
            justify-content: space-between;
            padding: 15px;
            background-color: #f8f9fa;
        }

        .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

         .download-btn {
            background-color: #007bff;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <main>

       <%@ include file="employer_navbar.jsp"%>

        <div class="content view-job-details">
            <div class="header">
                <h4>Welcome, <span style="font-weight: bold">${sessionScope.user.username}</span></h4>
            </div>


            <div class="main-content ">
                 <div class="container">
                    <div class="profile-card">
                        <div class="profile-header">
                            <img src="../images/users/${candidate.user.pic}" alt="Candidate Photo" class="profile-image">
                            <h1 class="text-capitalize">${candidate.name}</h1>
                            <p>${candidate.bio}</p>
                        </div>
                        <div class="profile-body">
                            <h2>Contact Information</h2>
                            <ul class="contact-info">
                                <li><strong>Email:</strong> ${candidate.user.email}</li>
                                <li><strong>Phone:</strong> ${candidate.user.phone}</li>
                                <li><strong>Address:</strong> ${candidate.address}</li>
                            </ul>
                            <h2>Education</h2>
                            <p>${candidate.education}</p>
                            <h2>Skills</h2>
                            <p>${candidate.skills}</p>
                            <h2>Experience</h2>
                            <p>${candidate.experience} Years</p>
                            <h2>Status</h2>
                            <p>${candidate.user.status}</p>
                        </div>
                         <div class="text-center">
                            <a href="${pageContext.request.contextPath}/employer/candidate-resume?id=${candidate.candidateId}" class="btn download-btn" download><i class="fa fa-download"></i> Download Resume</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   	</main>
</body>
</html>
