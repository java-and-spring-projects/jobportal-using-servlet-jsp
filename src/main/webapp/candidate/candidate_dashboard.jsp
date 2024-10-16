<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal User Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

    <%@ include file="../components/navbar.jsp"%>

    <div class="container candidate-dashboard2">
        <div class="content">

            <section id="profile">
                <h2>User Profile</h2>
                <div class="profile-card">
                    <img src="https://via.placeholder.com/100" alt="User Avatar" class="avatar">
                    <div class="profile-info">
                        <h3>John Doe</h3>
                        <p>Email: john.doe@example.com</p>
                        <p>Location: New York, NY</p>
                        <p>Skills: JavaScript, Python, React</p>
                    </div>
                    <button>Edit Profile</button>
                    <a href="${pageContext.request.contextPath}/logout">Logout</a>
                </div>
            </section>


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
                    <div class="job-card" data-type="Software Engineer">
                        <h3>Software Engineer</h3>
                        <p>Company: Tech Co.</p>
                        <button onclick="applyForJob('Software Engineer')">Apply</button>
                    </div>
                    <div class="job-card" data-type="Data Analyst">
                        <h3>Data Analyst</h3>
                        <p>Company: Data Inc.</p>
                        <button onclick="applyForJob('Data Analyst')">Apply</button>
                    </div>
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
