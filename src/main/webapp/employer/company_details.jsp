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

        <div class="content company-details">
            <div class="header">
                <h4>Welcome, <span style="font-weight: bold">${sessionScope.user.username}</span></h4>
            </div>

            <div class="main-content">
                <section>
                    <h3>Company Information</h3>
                    <div class="card company-card">
                        <div class="card-body">
                            <img src="../images/company/${company.logo}" alt="Company Logo" class="img-thumbnail" style="width: 100px; height: 100px; border-radius: 50%;">
                            <p>Founded On: <span>${company.foundedYear}</span></p>
                            <p>Company Name: <span>${company.companyName}</span></p>
                            <p>Location: <span>${company.companyAddress}</span></p>
                            <p>Website: <span>${company.companyWebsite}</span></p>
                            <p>Company size: <span>${company.companySize}</span></p>
                            <p>Company Email: <span>${company.companyEmail}</span></p>
                            <a href="company_profile.jsp" class="btn btn-primary">Edit Company Profile</a>
                        </div>
                    </div>
                </section>
            </div>
        </div>
   	</main>
</body>
</html>
