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

        <div class="content add-department">
            <div class="header">
                <h4>Welcome, <span style="font-weight: bold">${sessionScope.user.username}</span></h4>
            </div>


            <div class="main-content">
                <h2 class="heading">Add Department</h2>
                    <form action="${pageContext.request.contextPath}/employer/add-department" method="POST">
                         <div class="mb-3">
                            <label for="indus" class="form-label">Select Category:</label>
                            <select class="form-select" name="departmentName" id="indus" required>
                                <option value="" disabled selected>Select Industry Type</option>
                                <option value="agriculture">Agriculture & Forestry</option>
                                <option value="manufacturing">Manufacturing</option>
                                <option value="construction">Construction</option>
                                <option value="it">Information Technology (IT)</option>
                                <option value="healthcare">Healthcare</option>
                                <option value="finance">Finance & Insurance</option>
                                <option value="retail">Retail & Wholesale</option>
                                <option value="transportation">Transportation & Logistics</option>
                                <option value="energy">Energy</option>
                                <option value="telecommunications">Telecommunications</option>
                                <option value="hospitality">Hospitality & Tourism</option>
                                <option value="education">Education</option>
                                <option value="real-estate">Real Estate</option>
                                <option value="media">Entertainment & Media</option>
                                <option value="government">Government & Public Administration</option>
                                <option value="non-profit">Non-profit & Social Organizations</option>
                                <option value="professional">Professional, Scientific, and Technical Services</option>
                                <option value="mining">Mining & Extraction</option>
                            </select>
                         </div>

                        <div class="mb-3 form-floating">
                            <textarea class="form-control" placeholder="Leave a comment here" name="desc" id="floatingTextarea2" style="height: 100px"></textarea>
                            <label for="floatingTextarea2">Enter description</label>
                        </div>

                        <button type="submit" class="btn btn-dark">Add Department</button>
                   </form>

            </div>
        </div>
   	</main>
</body>
</html>
