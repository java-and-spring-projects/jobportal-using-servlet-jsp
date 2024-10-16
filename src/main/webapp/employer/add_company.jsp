
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
        <div class="content">
            <div class="header">
                <h4>Welcome, <span style="font-weight: bold">${sessionScope.user.username}</span></h4>
            </div>

            <div class="main-content">
                  <div class="main-content add-company-div">
                      <h1 class="heading">Register your company</h1>
                      <form action="${pageContext.request.contextPath}/employer/add-company" method="POST" enctype="multipart/form-data">
                          <div class="mb-3">
                            <label for="cname" class="form-label">Company Name:</label>
                             <input type="text" class="form-control" name="companyName" id="cname" placeholder="Enter compnay name" required>
                        </div>
                          <div class="mb-3 form-floating">
                            <textarea class="form-control" name="companyAddress" id="floatingTextarea2" style="height: 100px"></textarea>
                                <label for="floatingTextarea2">Company Address</label>
                        </div>

                        <div class="mb-3">
                            <label for="web" class="form-label">Company Website:</label>
                            <input type="text" class="form-control" name="companyWebsite" id="web" placeholder="Enter compnay website url" required>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Company Email:</label>
                            <input type="email" class="form-control" name="companyEmail" id="email" placeholder="Enter compnay address" required>
                        </div>

                        <div class="mb-3">
                            <label for="size" class="form-label">Company Size:</label>
                            <input type="text" class="form-control" name="companySize" id="size" placeholder="Enter company size" required>
                        </div>

                        <div class="mb-3">
                            <label for="year" class="form-label">Founded year:</label>
                            <input type="text" class="form-control" name="foundedYear" id="year" placeholder="Enter founded year" required>
                        </div>

                         <div class="mb-3">
                                <label for="indus" class="form-label">Department:</label>
                                <select class="form-select" name="dept" id="indus" required>
                                    <c:forEach items="${departments}" var="department">
                                            <option value="${department.departmentId}">${department.name}</option>
                                        </c:forEach>
                                </select>
                             </div>

                        <div class="mb-3">
                                 <label for="formFile" class="form-label">Choose your profile picture</label>
                                 <input class="form-control" type="file" name="pic" accept="image/*" id="formFile">
                           </div>

                        <button type="submit" class="btn btn-primary">Add Company</button>
                      </form>
                  </div>
            </div>
        </div>
   	</main>
</body>
</html>
