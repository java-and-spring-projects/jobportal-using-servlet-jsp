<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.*, model.*, java.util.* " %>

<%
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("user");

    JobDao jobDao = new JobDao();
    List<Job> jobs = jobDao.getJobsByUserId(user.getUserId());
    int activeJobs = jobDao.getActiveJobsByUserId(user.getUserId());
    int closedJobs = jobDao.getClosedJobsByUserId(user.getUserId());


    request.setAttribute("jobs", jobs);
    request.setAttribute("activeJobs", activeJobs);
    request.setAttribute("closedJobs", closedJobs);

    ApplicationDao applicationDao = new ApplicationDao();
    List<Application> applications = applicationDao.getAllApplications(user.getUserId());
    request.setAttribute("applications", applications);

    int totalApplications = applicationDao.getTotalApplications(user.getUserId());
    int acceptedApplications = applicationDao.getAcceptedApplications(user.getUserId());
    int rejectedApplications = applicationDao.getRejectedApplications(user.getUserId());

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal: Employer Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
    <%@ include file="../components/header.jsp"%>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .employer-dashboard .main-content .job-stats-section, .employer-dashboard .main-content .application-stats-section {
            width: 84%;
            margin: 0 auto;
        }

    </style>
</head>
<body>

    <main>

       <%@ include file="employer_navbar.jsp"%>

        <div class="content employer-dashboard">
             <c:if test="${not empty success}">
                <script>
                    showToast("${success}");
                </script>
            </c:if>

            <div class="main-content">
                 <!-- Job Statistics Section -->
                            <section class="job-stats-section">
                                <h3>Job Statistics</h3>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card stat-card">
                                            <div class="card-header bg-secondary">
                                                <h5>Total Jobs Posted</h5>
                                            </div>
                                            <div class="card-body">
                                                <i class="fas fa-briefcase"></i>
                                                <h2>${jobs.size()}</h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card stat-card">
                                            <div class="card-header bg-secondary">
                                                <h5>Active Jobs</h5>
                                            </div>
                                            <div class="card-body">
                                                <i class="fas fa-check-circle text-success"></i>
                                                <h2><%= activeJobs %></h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card stat-card">
                                            <div class="card-header bg-secondary">
                                                <h5>Closed Jobs </h5>
                                            </div>
                                            <div class="card-body">
                                                <i class="fas fa-times-circle text-danger"></i>
                                                <h2><%= closedJobs %></h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <!-- Application Statistics Section -->
                            <section class="application-stats-section">
                                <h3>Application Statistics</h3>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card stat-card">
                                            <div class="card-header bg-secondary">
                                                <h5>Total Applications</h5>
                                            </div>
                                            <div class="card-body">
                                                <i class="fas fa-file-alt"></i>
                                                <h2><%= totalApplications %></h2>
                                            </div>
                                        </div>
                                    </div>

                                  <div class="col-md-4">
                                      <div class="card stat-card">
                                          <div class="card-header bg-secondary">
                                              <h5>Total Accepted Applications</h5>
                                          </div>
                                          <div class="card-body">
                                              <i class="fas fa-check-circle text-success"></i>
                                              <h2><%= acceptedApplications %></h2>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-4">
                                      <div class="card stat-card">
                                          <div class="card-header bg-secondary">
                                              <h5>Total Rejected Applications</h5>
                                          </div>
                                          <div class="card-body">
                                              <i class="fas fa-times-circle text-danger"></i>
                                              <h2><%= rejectedApplications %></h2>
                                          </div>
                                      </div>
                                  </div>

                                </div>

                            </section>


            </div>
        </div>
   	</main>
</body>
</html>
