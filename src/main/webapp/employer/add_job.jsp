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
    </style>
</head>
<body>

    <main>

       <%@ include file="employer_navbar.jsp"%>

        <div class="content add-job">
            <div class="header">
                <h4>Welcome, <span style="font-weight: bold">${sessionScope.user.username}</span></h4>
            </div>


            <div class="main-content">
                 <h4 class="heading">Post Your Job</h4>
                   <form action="${pageContext.request.contextPath}/employer/add-job" method="POST">
                       <div class="mb-3">
                         <label for="cname" class="form-label">Job Title:</label>
                          <input type="text" class="form-control" name="title" id="cname" placeholder="Enter job title" required>
                        </div>

                       <div class="mb-3 form-floating">
                         <textarea class="form-control" name="jobDescription" id="floatingTextarea2" style="height: 100px"></textarea>
                         <label for="floatingTextarea2">Job Description</label>
                        </div>

                     <div class="mb-3">
                         <label for="web" class="form-label">Job Location:</label>
                         <input type="text" class="form-control" name="jobLocation" id="web" placeholder="Enter job location" required>
                     </div>

                     <div class="mb-3">
                         <label for="email" class="form-label">Salary:</label>
                         <input type="number" class="form-control" name="salary" id="email" placeholder="Enter salary" required>
                     </div>

                     <div class="mb-3">
                         <label for="size" class="form-label">Job Type:</label>
                          <select class="form-select" name="job_type" required>
                              <option value="" disabled selected>Select Job Type</option>
                              <option value="full-time">Full Time</option>
                              <option value="part-time">Part Time</option>
                              <option value="contract">Contract</option>
                          </select>
                     </div>

                      <div class="mb-3 form-floating">
                          <textarea class="form-control" name="education" id="floatingTextarea2" style="height: 100px"></textarea>
                          <label for="floatingTextarea2">Education</label>
                     </div>

                     <div class="mb-3">
                          <label for="exp" class="form-label">Experience:</label>
                          <input type="number" class="form-control" name="experience" id="exp" placeholder="Enter experience" required>
                      </div>

                      <div class="mb-3 form-floating">
                           <textarea class="form-control" name="requirements" id="floatingTextarea2" style="height: 100px"></textarea>
                           <label for="floatingTextarea2">Requirements</label>
                      </div>

                      <div class="mb-3 form-floating">
                           <textarea class="form-control" name="responsibilities" id="floatingTextarea2" style="height: 100px"></textarea>
                           <label for="floatingTextarea2">Responsibilities</label>
                      </div>

                      <div class="mb-3 form-floating">
                           <textarea class="form-control" name="benefits" id="floatingTextarea2" style="height: 100px"></textarea>
                           <label for="floatingTextarea2">Benefits</label>
                      </div>

                      <div class="mb-3">
                           <label for="email" class="form-label">Vacancy:</label>
                           <input type="number" class="form-control" name="vacancy" id="email" placeholder="Enter vacancy" required>
                       </div>


                     <button type="submit" class="btn btn-primary">Post Job</button>
                   </form>
            </div>
        </div>
   	</main>
</body>
</html>
