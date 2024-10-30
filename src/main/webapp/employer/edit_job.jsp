<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal: Edit Job</title>
    <%@ include file="../components/header.jsp"%>
    <link rel="stylesheet" href="../css/style.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
       .view-job-details{
            width: 80%;
            position: absolute;
            right: 1%;
            top:0;
        }
        .view-job-details .header{
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            border-bottom: 1px solid #ddd;
            background-color: skyblue;
            margin-top: 10px;
            color: yellow;
            font-size: 30px;
            font-weight: 600;
        }
        .view-job-details .main-content{
             margin:30px auto;
        }

        .view-job-details .main-content section{
            box-shadow: 0 0 1px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            background-color: #fff;
            border-radius: 5px;
            padding: 40px 70px;
            width: 70%;
            margin: 20px auto;

        }
        section span{
            font-weight: 600;
        }
        .main-content .title{
            text-align: center;
            font-size: 30px;
        }
        section .buttons{
            display: flex;
            align-items: center;
            margin-top: 20px;
            gap: 10px;
            margin: 10px auto;
        }
        .btn-update{
            padding: 6px 30px;
            color: #fff;
            border: none;
            cursor: pointer;
            margin-left: 360px;
        }
    </style>
</head>
<body>

    <main>

       <%@ include file="employer_navbar.jsp"%>

        <div class="content view-job-details">

            <div class="main-content">
                <h4 class="title">Update Job Posting</h4>

                <section>

                    <form action="${pageContext.request.contextPath}/employer/edit-job" method="post">

                        <input type="hidden" value="${job.jobId}" name="id">

                         <table class="table table-bordered" >

                                 <tr>
                                     <th>Posted By</th>
                                     <td>${sessionScope.user.username} on <fmt:formatDate value="${job.createdAt}" pattern="dd-MM-yyyy" /></td>
                                 </tr>
                                 <tr>
                                     <th>Last Date</th>
                                     <td><fmt:formatDate value="${job.lastDate}" pattern="dd-MM-yyyy" /></td>
                                 </tr>
                                <tr>
                                    <th>Job Title</th>
                                    <td><input type="text" class="form-control" name="title" value="${job.jobTitle}"></td>
                                </tr>
                                <tr>
                                    <th>Job Description</th>
                                    <td><input type="text" class="form-control" name="jobDescription" value="${job.jobDescription}"></td>
                                </tr>
                                <tr>
                                    <th>Salary</th>
                                    <td><input type="text" class="form-control" name="salary" value="${job.jobSalary}"></td>
                                </tr>
                                <tr>
                                    <th>Location</th>
                                    <td><input type="text" class="form-control" name="location" value="${job.jobLocation}"></td>
                                </tr>

                                <tr>
                                    <th>Job Type</th>
                                    <td>
                                        <select class="form-select" name="job_type" required>
                                            <option value="" disabled ${empty job.jobType ? 'selected' : ''}>Select Job Type</option>
                                            <option value="Full Time" ${job.jobType == 'Full Time' ? 'selected' : ''}>Full Time</option>
                                            <option value="Part Time" ${job.jobType == 'Part Time' ? 'selected' : ''}>Part Time</option>
                                            <option value="Contract" ${job.jobType == 'Contract' ? 'selected' : ''}>Contract</option>
                                            <option value="Internship" ${job.jobType == 'Internship' ? 'selected' : ''}>Internship</option>
                                            <option value="Remote" ${job.jobType == 'Remote' ? 'selected' : ''}>Remote</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Education required</th>
                                    <td><input type="text" class="form-control" name="education" value="${job.education}"></td>
                                </tr>
                                <tr>
                                    <th>Experience required</th>
                                    <td><input type="text" class="form-control" name="experience" value="${job.experience}"></td>
                                </tr>


                                 <tr>
                                    <th>Total Vacancy</th>
                                    <td><input type="number" class="form-control" name="vacancy" value="${job.vacancy}"></td>
                                </tr>
                                <tr>
                                    <th>Requiments</th>
                                    <td><textarea name="requirements" class="form-control">${job.requirements}</textarea></td>
                                </tr>
                                <tr>
                                    <th>Responsibility</th>
                                    <td><textarea name="responsibilities" class="form-control">${job.responsibilities}</textarea></td>
                                </tr>
                                <tr>
                                    <th>Benefits</th>
                                    <td><textarea name="benefits" class="form-control">${job.benefits}</textarea></td>
                                </tr>
                                 <tr>
                                    <th>Job Status</th>
                                    <td>
                                        <select class="form-select" name="jobStatus" required>
                                            <option value="" disabled ${empty job.jobStatus ? 'selected' : ''}>Select Job Status</option>
                                            <option value="Open" ${job.jobStatus == 'Open' ? 'selected' : ''}>Open</option>
                                            <option value="Close" ${job.jobStatus == 'Close' ? 'selected' : ''}>Close</option>
                                        </select>
                                    </td>
                                </tr>
                         </table>

                         <input type="submit" value="Update" class="btn btn-success btn-update">
                    </form>
                </section>
            </div>
        </div>
   	</main>
</body>
</html>
