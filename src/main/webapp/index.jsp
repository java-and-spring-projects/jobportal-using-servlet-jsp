<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal User Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <%@ include file="../components/header.jsp"%>
</head>
<body>
    <%@ include file="../components/navbar.jsp"%>


    <main>
        <div class="container">

            <div class="content candidate-dashboard1">
                <section id="job-listings">
                    <h2>Job Listings</h2>
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
                        <div class="job-card" data-type="Product Manager">
                            <h3>Product Manager</h3>
                            <p>Company: Business Corp.</p>
                            <button onclick="applyForJob('Product Manager')">Apply</button>
                        </div>
                        <div class="job-card" data-type="Web Developer">
                            <h3>Web Developer</h3>
                            <p>Company: Web Solutions</p>
                            <button onclick="applyForJob('Web Developer')">Apply</button>
                        </div>
                        <div class="job-card" data-type="UI/UX Designer">
                            <h3>UI/UX Designer</h3>
                            <p>Company: Creative Studio</p>
                            <button onclick="applyForJob('UI/UX Designer')">Apply</button>
                        </div>
                        <div class="job-card" data-type="DevOps Engineer">
                            <h3>DevOps Engineer</h3>
                            <p>Company: Cloud Tech</p>
                            <button onclick="applyForJob('DevOps Engineer')">Apply</button>
                        </div>
                        <div class="job-card" data-type="Project Manager">
                            <h3>Project Manager</h3>
                            <p>Company: Global Corp.</p>
                            <button onclick="applyForJob('Project Manager')">Apply</button>
                        </div>
                        <div class="job-card" data-type="Software Engineer">
                            <h3>Junior Software Engineer</h3>
                            <p>Company: Startup Inc.</p>
                            <button onclick="applyForJob('Junior Software Engineer')">Apply</button>
                        </div>
                        <div class="job-card" data-type="Software Engineer">
                            <h3>Senior Software Engineer</h3>
                            <p>Company: Innovative Solutions</p>
                            <button onclick="applyForJob('Senior Software Engineer')">Apply</button>
                        </div>
                        <div class="job-card" data-type="Data Scientist">
                            <h3>Data Scientist</h3>
                            <p>Company: Analytics Pro</p>
                            <button onclick="applyForJob('Data Scientist')">Apply</button>
                        </div>
                        <div class="job-card" data-type="Backend Developer">
                            <h3>Backend Developer</h3>
                            <p>Company: Dev Hub</p>
                            <button onclick="applyForJob('Backend Developer')">Apply</button>
                        </div>
                    </div>
                </section>
              </div>
        </div>
    </main>



    <script>
            function filterJobs() {
                const input = document.getElementById('job-search');
                const filter = input.value.toLowerCase();
                const jobType = document.getElementById('job-type').value;
                const jobList = document.getElementById('job-list');
                const jobs = jobList.getElementsByClassName('job-card');

                for (let i = 0; i < jobs.length; i++) {
                    const jobTitle = jobs[i].getElementsByTagName('h3')[0].textContent.toLowerCase();
                    const jobCategory = jobs[i].getAttribute('data-type');

                    const matchesSearch = jobTitle.includes(filter);
                    const matchesType = jobType === "" || jobCategory === jobType;

                    if (matchesSearch && matchesType) {
                        jobs[i].style.display = '';
                    } else {
                        jobs[i].style.display = 'none';
                    }
                }
            }

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
    <%@ include file="../components/footer.jsp"%>
</body>
</html>
