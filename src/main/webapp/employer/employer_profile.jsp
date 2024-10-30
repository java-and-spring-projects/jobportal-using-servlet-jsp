<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal: Employer Profile</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%@ include file="../components/header.jsp"%>
    <style>
        body {
            background-color: #f0f4f8;
            font-family: 'Arial', sans-serif;
        }
        .employer-card {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 20px;
            margin-left: 270px;
            text-align: center;
        }
        .employer-card img {
            border-radius: 50%;
            border: 4px solid #007bff;
            margin-bottom: 20px;
            width: 120px;
            height: 120px;
            margin-left: 410px;
        }
        .employer-card h3 {
            color: #007bff;
            margin-bottom: 15px;
        }
        .employer-card p {
            font-size: 1.1em;
            color: #555;
            margin: 5px 0;
        }
        .employer-card .btn {
            margin-top: 15px;
            border-radius: 20px;
            padding: 10px 20px;
            font-weight: bold;
        }
        .bg-primary {
            background-color: #007bff !important;
        }
    </style>
</head>
<body>

    <main>
        <%@ include file="employer_navbar.jsp"%>

        <div class=" mt-5 employer-profile">
            <h2 class="text-center">Employer Profile</h2>

            <div class="row">
                <div class="col-md-10">
                    <section>
                        <div class="card employer-card">
                            <img src="../images/users/${sessionScope.user.pic}" alt="Company Logo" class="img-thumbnail">
                            <h3 class="text-capitalize">${sessionScope.user.username}</h3>
                            <p><strong>Role:</strong> ${sessionScope.user.role}</p>
                            <p><strong>Email:</strong> ${sessionScope.user.email}</p>
                            <p><strong>Phone:</strong> ${sessionScope.user.phone}</p>
                            <p><strong>Status:</strong> ${sessionScope.user.status}</p>
                            <a href="company_profile.jsp" class="btn btn-primary">Edit Profile</a>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
