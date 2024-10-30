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

         .open-roles .job-list {
             display: flex;
             flex-wrap: wrap;
             gap: 70px;
             padding: 20px;
             margin-top: 60px;
             transition: transform 0.2s;
         }

         .job-item {
             background: #e9f3ff;
             padding: 20px;
             border-radius: 8px;
             box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
             text-align: center;
             width: 30%;
         }

         .job-item p {
             margin: 5px 0;
         }

         .job-actions {
             display: flex;
             flex-wrap: wrap;
             gap: 5px;
             justify-content: center;
             margin-top: 10px;
         }


         .job-item a {
             color: #0044cc;
             text-decoration: none;
             font-size: 0.9rem;
             margin: 0 5px;
         }

         .job-item a:hover {
             text-decoration: underline;
         }

        .fa-eye{
            margin: 0 10px;
        }
        .fa-edit{
            margin: 0 10px;
        }
        .fa-trash{
            margin: 0 10px;
        }
        .view-applications  {
            margin-top: 20px;
        }
        .badge{
            position: relative;
            top: -72%;
            right: -45%;
        }
        .job-title{
            font-weight: 700;
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

        <div class="content view-applications">


            <div class="main-content">
                <c:if test="${not empty success}">
                      <script>
                          showToast("${success}");
                      </script>
                  </c:if>

                 <section class="open-roles">
                     <h2 class="text-center bg-primary text-light p-3">Current Job Openings</h2>
                     <div class="job-list">
                        <c:forEach items="${jobs}" var="job">
                             <div class="job-item">
                                 <h3 class="job-title">${job.jobTitle}</h3>
                                 <p><strong>Job ID:</strong> #${job.jobId}</p>
                                 <p><strong>Location:</strong> ${job.jobLocation}</p>
                                 <c:if test="${job.jobStatus == 'Open'}">
                                    <span class="badge bg-success">Open <i class="fas fa-check"></i></span>
                                 </c:if>
                                  <c:if test="${job.jobStatus == 'Close'}">
                                    <span class="badge bg-danger">Close <i class="fas fa-times"></i></span>
                                 </c:if>
                                 <p id="last-date"><strong>Deadline:</strong> <fmt:formatDate value="${job.lastDate}" pattern="dd-MM-yyyy" /></p>
                                 <div class="job-actions">
                                     <a href="view-job-details?id=${job.jobId}"><i class="fas fa-eye"></i> </a>
                                     <a href="edit-job?id=${job.jobId}"><i class="fas fa-edit"></i></a>
                                     <a href="delete-job?id=${job.jobId}" onclick="return confirm('Are you sure you want to delete this job?')"><i class="fas fa-trash"></i></a>
                                 </div>
                             </div>
                        </c:forEach>
                     </div>
                 </section>

            </div>
        </div>
   	</main>
</body>
</html>
