<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        <div class="content employer-profile">

            <div class="main-content">
                <section>
                    <h3>Employer Profile</h3>
                    <div class="card employer-card">
                        <div class="card-body">
                            <img src="../images/users/${sessionScope.user.pic}" alt="Company Logo" class="img-thumbnail" style="width: 100px; height: 100px;">
                            <p>Employer Name: <span>${sessionScope.user.username}</span></p>
                            <p>Role: <span>${sessionScope.user.role}</span></p>
                            <p>Employer Email: <span>${sessionScope.user.email}</span></p>
                            <p>Employer Phone: <span>${sessionScope.user.phone}</span></p>
                            <p>Status: <span>${sessionScope.user.status}</span></p>
                            <a href="company_profile.jsp" class="btn btn-primary">Edit Profile</a>
                        </div>
                    </div>
                </section>
            </div>
        </div>
   	</main>
</body>
</html>
