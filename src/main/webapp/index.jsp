<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.*, model.*, java.util.* " %>

<%
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("user");

    JobDao jobDao = new JobDao();
    List<Job> jobs = jobDao.getAllJobsWithCompany();

    request.setAttribute("jobs", jobs);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal User Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <%@ include file="../components/navbar.jsp"%>

    <div class="container candidate-dashboard1">
        <div class="content">
            <section id="job-listings">
                <div>
                    <label for="job-type">Filter by Job Type:</label>
                    <select id="job-type" onchange="filterJobs()">
                        <option value="">All</option>
                        <option value="Software Engineer">Software Engineer</option>
                        <option value="Data Analyst">Data Analyst</option>
                        <option value="Product Manager">Product Manager</option>
                        <option value="Web Developer">Web Developer</option>
                        <option value="UI/UX Designer">UI/UX Designer</option>
                        <option value="DevOps Engineer">DevOps Engineer</option>
                        <option value="Project Manager">Project Manager</option>
                    </select>
                </div>
                <input type="text" placeholder="Search for jobs..." id="job-search" onkeyup="filterJobs()">
                <button onclick="filterJobs()">Search</button>
                <div class="job-list" id="job-list">
                    <c:forEach items="${jobs}" var="job">
                        <div class="job-card" data-type="Software Engineer">
                            <div class="job-details">
                                <h3>${job.jobTitle}</h3>
                                <p>Posted on: <span class="postedDate">${job.createdAt}</span></p>
                            </div>
                            <p>Company: ${job.company.companyName}</p>
                            <p>Location: ${job.jobLocation}</p>
                            <button onclick="applyForJob('Software Engineer')">Apply</button>
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

        function logout() {
            if (confirm('Are you sure you want to log out?')) {
                alert('You have been logged out.');
                // Redirect to login page or perform logout action
                window.location.href = 'login.html'; // Change to your login page
            }
        }
    </script>
</body>
</html>
