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
    <title>Job Portal: My Applications</title>
    <%@ include file="../components/header.jsp"%>
    <%@ include file="../components/custom_toast.html"%>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        .my-applications #job-listings{
            margin: 0 auto;
        }
        .my-applications #job-listings .job-card{
            background: #E4E0E1;
            color:
        }
    </style>
</head>
<body>

    <%@ include file="../components/navbar.jsp"%>

    <div class="container candidate-dashboard2 my-applications">
        <div class="content">

            <section id="job-listings">
                <h3 class="heading">My Applications</h3>
                <div class="job-list" id="job-list">
                   <c:forEach items="${applications}" var="application">
                       <div class="job-card" data-type="Software Engineer">
                           <div class="job-details">
                               <h3>${application.job.jobTitle}</h3>
                                <p>Last Date:  <span class="postedDate"><fmt:formatDate value="${application.job.lastDate}" pattern="dd-MM-yyyy" /></span></p>
                           </div>
                           <p>Company: ${application.job.company.companyName}</p>
                           <p>Location: ${application.job.jobLocation}</p>
                           <a href="${pageContext.request.contextPath}/candidate/view-job?jobId=${application.job.jobId}" id="btn-apply">View Details</a>
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
