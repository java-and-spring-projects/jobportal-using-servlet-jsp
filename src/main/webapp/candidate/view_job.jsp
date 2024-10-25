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
        .apply-job {
            background-color: white;
        }
        .apply-job .section-main {
            display: flex;
            gap: 70px;
        }
        .apply-job .job-details {
            width: 70%;
            padding: 20px;
        }
        .apply-job aside {
            width: 25%;
            display: flex;
            flex-direction: column;
            gap: 50px;
         }
         .apply-job .job-summary {
            border: 1px solid #ddd;
         }
         .apply-job .company-info {
            border: 1px solid #ddd;
         }

    </style>
</head>
<body>

    <%@ include file="../components/navbar.jsp"%>


    <div class="container apply-job">

        <section class="section-main">
            <section class="job-details">
                <h4 class="job-title"><span>${job.jobTitle}</span></h4>
                <p><i class="fa-solid fa-location-dot"></i> <span>${job.jobLocation}</span></p>
                <p><i class="fa-solid fa-money-bill-1"></i> <span>${job.jobSalary} p.a.</span></p>
                <p>Job type: <span>${job.jobType}</span></p>
                <p>Posted on: <span class="postedDate"><fmt:formatDate value="${job.createdAt}" pattern="dd-MM-yyyy" /></span></p>
                 <hr>
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
                <form action="${pageContext.request.contextPath}/candidate/apply-job">
                    <input type="hidden" name="jobId" value="${job.jobId}">
                    <div class="mb-3 form-floating">
                        <textarea class="form-control" name="feedback" id="floatingTextarea2" style="height: 160px"></textarea>
                        <label for="floatingTextarea2">Feedback</label>
                    </div>

                    <input type="submit" class="btn btn-primary" id="btn-apply" value="Apply">
                    <a href="${pageContext.request.contextPath}/candidate/save-link?jobId=${job.jobId}" class="btn btn-warning">Save</a>
                </form>

            </section>

            <aside>
                <div class="job-summary card">
                    <div class="card-header text-center text-white bg-success">
                        <h5>Job Summary</h5>
                    </div>
                    <div class="card-body">
                        <p>Status: <span>${job.jobStatus}</span></p>
                        <p>Education: <span>${job.education}</span></p>
                         <p>Experience: <span>${job.experience} Years</span></p>
                        <p>Total vacancy: <span>${job.vacancy}</span></p>
                    </div>
                </div>
                <div class="company-info card">
                    <div class="card-header text-center text-white bg-success">
                        <h5>Company Information</h5>
                    </div>
                    <div class="card-body">
                        <img src="../images/company/${job.company.logo}" alt="Company Logo" class="img-thumbnail" style="width: 80px; height: 80px; border-radius: 50%;margin-bottom: 20px">
                        <h4><span>${job.company.companyName}</span></h4>
                        <p><i class="fa fa-map-marker"></i> <span>${job.company.companyAddress}</span></p>
                        <p><i class="fa fa-envelope"></i> <span>${job.company.companyEmail}</span></p>
                        <p><i class="fa fa-globe"></i> <span>${job.company.companyWebsite}</span></p>
                        <p>Company Size: <span>${job.company.companySize}</span></p>
                        <p>Company founded: <span>${job.company.foundedYear}</span></p>
                        <p>Company Type: <span>${job.company.companyType}</span></p>
                    </div>
                </div>
            </aside>
        </section>




    </div>



    <%@ include file="../components/footer.jsp"%>

</body>
</html>
