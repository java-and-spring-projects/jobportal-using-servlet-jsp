<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.*, model.*, java.util.* " %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal Candidate Dashboard</title>
    <%@ include file="../components/header.jsp"%>
    <%@ include file="../components/custom_toast.html"%>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        .saved-jobs {
            margin-bottom: 400px;
        }
        .saved-jobs #job-listings{
            margin: 0 auto;
        }
        .saved-jobs #job-listings .job-card{
            background: #0D92F4;
            color:white;
        }
        .saved-jobs #job-listings .job-card p{
            color: white;

        }
    </style>
</head>
<body>

    <%@ include file="../components/navbar.jsp"%>

    <div class="container candidate-dashboard2 saved-jobs">
        <div class="content">

         <c:if test="${not empty error}">
                <script>
                    showToast("${error}");
                </script>
            </c:if>

            <c:if test="${not empty success}">
                <script>
                    showToast("${success}");
                </script>
            </c:if>

            <section id="job-listings">
                <h3 class="heading">Saved Jobs</h3>
                <div class="job-list" id="job-list">
                   <c:forEach items="${jobs}" var="job">
                       <div class="job-card" data-type="Software Engineer">
                           <div class="job-details">
                               <h3>${job.jobTitle}</h3>
                                <p>Last Date:  <span class="postedDate"><fmt:formatDate value="${job.lastDate}" pattern="dd-MM-yyyy" /></span></p>
                           </div>
                           <p>Company: ${job.company.companyName}</p>
                           <p>Location: ${job.jobLocation}</p>
                           <a href="${pageContext.request.contextPath}/candidate/view-job?jobId=${job.jobId}" id="btn-apply">View Details</a>
                       </div>
                   </c:forEach>

                </div>
            </section>
        </div>
    </div>

      <%@ include file="../components/footer.jsp"%>

    <script>


        function applyForJob(jobTitle) {
            if (confirm(`Are you sure you want to apply for ${jobTitle}?`)) {
                alert('Application submitted!');
            }
        }
    </script>
</body>
</html>
