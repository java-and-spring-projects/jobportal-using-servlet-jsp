<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal Candidate Dashboard</title>
    <%@ include file="../components/header.jsp"%>
    <link rel="stylesheet" href="../css/style.css">
    <style>

         .container {
                     max-width: 800px;
                     background-color: #ffffff;
                     padding: 30px;
                     border-radius: 8px;
                     box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                     margin: 50px auto;
                 }

                 h2 {
                     color: #0044cc;
                     text-align: center;
                     font-weight: bold;
                 }

                 .job-header, .job-details {
                     margin-bottom: 20px;
                 }

                 .job-details h4 {
                     font-size: 1.2rem;
                     font-weight: 600;
                     color: #333;
                 }

                 .job-details p {
                     margin: 0;
                     color: #555;
                 }

                 .apply-button {
                     display: block;
                     background-color: #0044cc;
                     color: #ffffff;
                     font-weight: bold;
                     padding: 10px;
                     text-align: center;
                     border-radius: 5px;
                     text-decoration: none;
                     transition: background-color 0.3s;
                 }

                 .apply-button:hover {
                     background-color: #003399;
                     text-decoration: none;
                 }

                 .section-title {
                     font-size: 1.1rem;
                     font-weight: bold;
                     margin-top: 15px;
                     color: #0044cc;
                     text-transform: uppercase;
                 }

                 .company-info {
                     background-color: #e9ecef;
                     padding: 15px;
                     border-radius: 5px;
                     margin-bottom: 20px;
                 }

                 .company-info h4 {
                     margin-bottom: 10px;
                 }
                 .buttons {
                     display: flex;
                     flex-direction: column;
                     gap: 10px;
                 }
                 .buttons .apply-button {
                    width: 100%;
                 }


    </style>
</head>
<body>

    <%@ include file="../components/navbar.jsp"%>


    <div class="main">

        <section class="section-main">

             <div class="container">

                    <div class="job-header text-center">
                        <h2>${job.jobTitle}</h2>
                        <p>at <strong>${job.company.companyName}</strong></p>
                        <p>Location: <strong>${job.jobLocation}</strong> | <span class="text-muted">${job.jobType}</span></p>
                    </div>

                    <!-- Company Information -->
                    <div class="company-info">
                        <h4 class="section-title">Company Information</h4>
                        <p><strong>Company Name:</strong>${job.company.companyName} <img src="../images/company/${job.company.logo}" alt="Company Logo" class="img-thumbnail" style="width: 40px; height: 40px; border-radius: 50%;"></p>
                        <p><strong>Company Address:</strong> ${job.company.companyAddress}</p>
                        <p><strong>Company Type:</strong> ${job.company.companyType}</p>
                        <p><strong>Company Size:</strong> ${job.company.companySize}</p>
                        <p><strong>Established:</strong> ${job.company.foundedYear}</p>
                        <p><strong><i class="fa fa-globe"></i> </strong> <a href="${job.company.companyWebsite}" target="_blank">${job.company.companyWebsite}</a></p>
                        <p><strong><i class="fa fa-envelope"></i></strong> ${job.company.companyEmail}</p>
                    </div>


                    <div class="job-details">
                        <h4 class="section-title">Job Description</h4>
                        <p>${job.jobDescription}  </p>
                    </div>


                    <div class="job-details">
                        <h4 class="section-title">Details</h4>
                        <p><strong>Salary:</strong> ₹ ${job.jobSalary} / year</p>
                        <p><strong>Experience Required:</strong> ${job.experience} years</p>
                        <p><strong>Education:</strong> ${job.education}</p>
                        <p><strong>Posted Date:</strong> <fmt:formatDate value="${job.createdAt}" pattern="dd-MM-yyyy" /></p>
                        <p><strong>Application Deadline:</strong> <fmt:formatDate value="${job.lastDate}" pattern="dd-MM-yyyy" /></p>
                        <p><strong>Vacancies:</strong> ${job.vacancy}</p>
                    </div>

                    <div class="job-details">
                        <h4 class="section-title">Responsibilities</h4>
                        <p>${job.responsibilities}</p>
                    </div>

                    <div class="job-details">
                        <h4 class="section-title">Requirements</h4>
                        <p>${job.requirements}</p>
                    </div>

                    <!-- Benefits -->
                    <div class="job-details">
                        <h4 class="section-title">Benefits</h4>
                        <p>${job.benefits}</p>
                    </div>



                     <form action="${pageContext.request.contextPath}/candidate/apply-job">
                            <input type="hidden" name="jobId" value="${job.jobId}">
                            <div class="mb-3 form-floating">
                                <textarea class="form-control" name="feedback" id="floatingTextarea2" style="height: 160px"></textarea>
                                <label for="floatingTextarea2">Feedback</label>
                            </div>


                            <c:if test="${daysDifference > 0 }">
                                <p class="days-left text-success">${daysDifference} days left to apply</p>
                            </c:if>
                            <c:if test="${daysDifference < 0 }">
                                <p class="days-left text-danger">Deadline passed</p>
                            </c:if>
                            <c:if test="${daysDifference == 0 }">
                                <p class="days-left text-success">Deadline today</p>
                            </c:if>

                            <div class="buttons">
                                <c:if test="${daysDifference >= 0 }">
                                    <input type="submit" class="btn btn-primary apply-button mt-4" value="Apply Now">

                                     <c:if test="${isSaved}">
                                        <a href="${pageContext.request.contextPath}/candidate/unsave-job?jobId=${job.jobId}" class="btn btn-unsave bg-secondary text-white">UnSave</a>
                                     </c:if>
                                     <c:if test="${!isSaved}">
                                        <a href="${pageContext.request.contextPath}/candidate/save-job?jobId=${job.jobId}" class="btn btn-warning btn-save">Save</a>
                                     </c:if>
                                </c:if>
                            </div>
                        </form>

                </div>











    </div>



    <%@ include file="../components/footer.jsp"%>

</body>
</html>
