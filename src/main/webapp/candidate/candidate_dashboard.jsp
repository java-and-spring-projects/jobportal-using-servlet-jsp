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
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

    <%@ include file="../components/navbar.jsp"%>

    <div class="container candidate-dashboard2">
        <div class="content">

            <section id="profile">
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

                <form action="${pageContext.request.contextPath}/candidate/search-jobs" method="post">
                    <input type="text" placeholder="Enter skill / company / designation..." id="job-search"  name="keyword">
                    <select id="job-type" name="jobType">
                        <option value="">-Select Job Type-</option>
                        <option value="Full Time">Full Time</option>
                        <option value="Part Time">Part Time</option>
                        <option value="Internship">Internship</option>
                        <option value="Contract">Contract</option>
                        <option value="Remote">Remote</option>
                    </select>
                    <select id="job-location" name="jobLocation">
                        <option value="">-Select Job Location-</option>
                        <option value="Noida">Noida</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Gurugram">Gurugram</option>
                        <option value="Faridabad">Faridabad</option>
                        <option value="Ghaziabad">Ghaziabad</option>
                        <option value="Mumbai">Mumbai</option>
                        <option value="Pune">Pune</option>
                        <option value="Chennai">Chennai</option>
                        <option value="Bangalore">Bangalore</option>
                        <option value="Hyderabad">Hyderabad</option>
                        <option value="Kolkata">Kolkata</option>
                        <option value="Ahmedabad">Ahmedabad</option>
                        <option value="Surat">Surat</option>
                        <option value="Jaipur">Jaipur</option>
                        <option value="Lucknow">Lucknow</option>
                    </select>
                    <select name="experience" id="experience" name="experience">
                        <option value="">-Select Experience-</option>
                        <option value="0">Fresher</option>
                        <option value="1">1 Year</option>
                        <option value="2">2 Years</option>
                        <option value="3">3 Years</option>
                        <option value="4">4 Years</option>
                        <option value="5">5 Years</option>
                        <option value="6">6 Years</option>
                        <option value="7">7 Years</option>
                        <option value="8">8 Years</option>
                     </select>
                     <input type="submit" value="Search" class="search-btn btn btn-primary" id="btn-search">
                </form>


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
