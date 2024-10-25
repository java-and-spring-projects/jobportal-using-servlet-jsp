<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.*, model.*, java.util.* " %>

<%
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("user");

    CandidateDao candidateDao = new CandidateDao();
    Candidate candidate = candidateDao.isCandidateExist(user.getUserId());
    request.setAttribute("candidate", candidate);

    JobDao jobDao = new JobDao();
    List<Job> jobs = jobDao.getAllJobsWithCompany();

    request.setAttribute("jobs", jobs);

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal Candidate Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

    <%@ include file="../components/navbar.jsp"%>

    <div class="container candidate-dashboard2">
        <div class="content">

            <section id="profile">
                <h2>User Profile</h2>
                <div class="profile-card">
                    <img src="${pageContext.request.contextPath}/images/users/${sessionScope.user.pic}" alt="User Avatar" class="avatar">
                    <div class="profile-info">
                        <h3>${sessionScope.user.username}</h3>
                        <p>Email: ${sessionScope.user.email}</p>
                        <p>Address:${candidate.address} </p>
                        <p>Skills: ${candidate.skills}</p>
                    </div>
                    <button>Edit Profile</button>
                    <a href="${pageContext.request.contextPath}/logout">Logout</a>
                </div>
            </section>


            <section id="job-listings">

                <input type="text" placeholder="Search for jobs..." id="job-search" onkeyup="filterJobs()">
                <button onclick="filterJobs()">Search</button>
                <div class="job-list" id="job-list">
                   <c:forEach items="${jobs}" var="job">
                       <div class="job-card" data-type="Software Engineer">
                           <div class="job-details">
                               <h3>${job.jobTitle}</h3>
                               <p>Posted on:  <span class="postedDate"><fmt:formatDate value="${job.createdAt}" pattern="dd-MM-yyyy" /></span></p>
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
