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

                #header {
                    background: rgb(0, 68, 204);
                    color: #fff;
                    text-align: center;
                    padding: 40px 0;
                }

                .header-content {
                    max-width: 800px;
                    margin: auto;
                }

                .company-logo {
                    width: 80px;
                    height: 80px;
                    border-radius: 50%;
                }

                .tagline {
                    font-size: 1.2rem;
                    margin-top: 10px;
                }

                section {
                    max-width: 800px;
                    margin: 20px auto;
                    padding: 20px;
                    background: #fff;
                    border-radius: 8px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                }

                h2 {
                    margin-bottom: 15px;
                    color: #0044cc;
                }

                p {
                    margin-bottom: 15px;
                }

                .key-facts ul {
                    list-style: none;
                }

                .key-facts li {
                    margin-bottom: 10px;
                }


    </style>
</head>
<body>

    <main>

       <%@ include file="employer_navbar.jsp"%>

        <div class="content company-details">


            <div class="main-content">

                <header class="header" id="header">
                        <div class="header-content">
                            <img src="../images/company/${company.logo}" alt="Company Logo" class="company-logo">
                            <h1 class="text-capitalize">${company.companyName}</h1>
                            <p class="tagline"><i class="fas fa-map-marker-alt"></i> ${company.companyAddress}</p>
                        </div>
                    </header>

                    <!-- About Section -->
                    <section class="about-section">
                        <h2>About Us</h2>
                        <p>We are a leading company in the technology industry, dedicated to innovation and excellence. Founded in 2005, we have offices worldwide and are committed to fostering an inclusive and dynamic work culture.</p>
                    </section>

                    <section class="key-facts">
                        <h2>Key Facts & Stats</h2>
                        <ul>
                            <li><strong>Founded:</strong> ${company.foundedYear}</li>
                            <li><strong>Employees:</strong> ${company.companySize}+</li>
                            <li><strong>Email:</strong> ${company.companyEmail}</li>
                            <li><strong>Website:</strong> ${company.companyWebsite}</li>
                        </ul>
                    </section>


            </div>
        </div>
   	</main>
</body>
</html>
