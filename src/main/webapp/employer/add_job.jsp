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
         .content {
            margin: auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        h4.heading {
            color: #0044cc;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }

        label.form-label {
            font-weight: 600;
        }

        .btn-primary {
            background-color: #0044cc;
            border: none;
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #003399;
        }
    </style>
</head>
<body>
     <c:if test="${not empty success}">
        <script>
            showToast("${success}");
        </script>
    </c:if>

    <main>

       <%@ include file="employer_navbar.jsp"%>

        <div class="content add-job">

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
                              <option value="Full Time">Full Time</option>
                              <option value="Part Time">Part Time</option>
                              <option value="Contract">Contract</option>
                              <option value="Internship">Internship</option>
                              <option value="Remote">Remote</option>
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

                       <div class="mb-3">
                           <label for="last" class="form-label">Last Date:</label>
                           <input type="date" class="form-control" name="last_date" id="last" placeholder="Enter deadline" required>
                       </div>


                     <button type="submit" class="btn btn-primary">Post Job</button>
                   </form>
            </div>
        </div>
   	</main>
</body>
</html>
