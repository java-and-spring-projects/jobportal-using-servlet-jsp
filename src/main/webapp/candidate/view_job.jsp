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

    </style>
</head>
<body>

    <%@ include file="../components/navbar.jsp"%>


    <div class="container apply-job">

        <section id="job-listing">
            <div id="company-detail-container">
                <div>
                    <h4 class="job-title"><span>${job.jobTitle}</span></h4>
                    <p>Company: <span class="company-name">${job.company.companyName}</span>, <span class="company-addr">${job.company.companyAddress}</span></p>
                    <p>Posted on: <span class="postedDate"><fmt:formatDate value="${job.createdAt}" pattern="dd-MM-yyyy" /></span></p>
                    <p>Status: <span>${job.jobStatus}</span></p>
                    <p>Total vacancy: <span>${job.vacancy}</span></p>
                </div>
                <div>
                    <p></p>
                    <br>
                    <p>Company Size: <span>${job.company.companySize}</span></p>
                    <p>Company founded: <span>${job.company.foundedYear}</span></p>
                    <p>Company Type: <span>${job.company.companyType}</span></p>
                </div>
            <div>
        </section>
        <hr>
        <section id="job-desc">
            <div>
                <p>Job type: <span>${job.jobType}</span></p>
                <p>Education: <span>${job.education}</span></p>
                <p>Experience: <span>${job.experience} Years</span></p>
                <p>Job Location: <span>${job.jobLocation}</span></p>
                <p>Salary: <span>${job.jobSalary} p.a.</span></p>

                <div class="requirements">
                    <p class="title">Requirements</p>
                    <p>${job.requirements}</p>
                </div>
                <div class="responsibilites">
                    <p class="title">Responsibilites</p>
                    <p>${job.responsibilities}</p>
                </div>
                <div class="benefits">
                    <p class="title">Benefits</p>
                    <p>${job.benefits}</p>
                </div>
            </div>
        </section>
        <form action="${pageContext.request.contextPath}/candidate/apply-job">
            <input type="hidden" name="jobId" value="${job.jobId}">
            <div class="mb-3 form-floating">
                <textarea class="form-control" name="feedback" id="floatingTextarea2" style="height: 160px"></textarea>
                <label for="floatingTextarea2">Feedback</label>
            </div>

            <input type="submit" class="btn btn-primary" id="btn-apply" value="Apply">
        </form>

    </div>



    <%@ include file="../components/footer.jsp"%>

</body>
</html>
