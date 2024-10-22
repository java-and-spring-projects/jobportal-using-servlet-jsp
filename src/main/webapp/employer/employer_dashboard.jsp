<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employer Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
    <%@ include file="../components/header.jsp"%>
    <style>
        body {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>

    <main>

       <%@ include file="employer_navbar.jsp"%>

        <div class="content employer-dashboard">
            <div class="header">
                <h4>Welcome, <span style="font-weight: bold">${sessionScope.user.username}</span></h4>
            </div>

            <div class="main-content">
                 <!-- Job Statistics Section -->
                            <section class="job-stats-section">
                                <h3>Job Statistics</h3>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card stat-card">
                                            <div class="card-header">
                                                <h5>Total Jobs Posted</h5>
                                            </div>
                                            <div class="card-body">
                                                <i class="fas fa-briefcase"></i>
                                                <h2>[Total Jobs]</h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card stat-card">
                                            <div class="card-header">
                                                <h5>Active Jobs</h5>
                                            </div>
                                            <div class="card-body">
                                                <i class="fas fa-check-circle"></i>
                                                <h2>[Active Jobs]</h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card stat-card">
                                            <div class="card-header">
                                                <h5>Closed Jobs</h5>
                                            </div>
                                            <div class="card-body">
                                                <i class="fas fa-times-circle"></i>
                                                <h2>[Closed Jobs]</h2>
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
                                            <div class="card-header">
                                                <h5>Total Applications</h5>
                                            </div>
                                            <div class="card-body">
                                                <i class="fas fa-file-alt"></i>
                                                <h2>[Total Applications]</h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card stat-card">
                                            <div class="card-header">
                                                <h5>Interviews Scheduled</h5>
                                            </div>
                                            <div class="card-body">
                                                <i class="fas fa-calendar-check"></i>
                                                <h2>[Interviews Scheduled]</h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card stat-card">
                                            <div class="card-header">
                                                <h5>Offers Made</h5>
                                            </div>
                                            <div class="card-body">
                                                <i class="fas fa-gift"></i>
                                                <h2>[Offers Made]</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card stat-card">
                                            <div class="card-header">
                                                <h5>Total Accepted Applications</h5>
                                            </div>
                                            <div class="card-body">
                                                <i class="fas fa-check-circle"></i>
                                                <h2>[Total Accepted]</h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card stat-card">
                                            <div class="card-header">
                                                <h5>Total Rejected Applications</h5>
                                            </div>
                                            <div class="card-body">
                                                <i class="fas fa-times-circle"></i>
                                                <h2>[Total Rejected]</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <!-- Job Postings Section -->
                            <section>
                                <h3>Your Job Postings</h3>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Job Title</th>
                                                            <th>Location</th>
                                                            <th>Date Posted</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Software Engineer</td>
                                                            <td>New York</td>
                                                            <td>2023-10-01</td>
                                                            <td>
                                                                <a href="view_job.jsp?id=2" class="btn btn-info btn-sm">View</a>
                                                                <a href="#" class="btn btn-primary btn-sm">Edit</a>
                                                                <a href="#" class="btn btn-danger btn-sm">Delete</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Product Manager</td>
                                                            <td>San Francisco</td>
                                                            <td>2023-09-15</td>
                                                            <td>
                                                                <a href="#" class="btn btn-primary btn-sm">Edit</a>
                                                                <a href="#" class="btn btn-danger btn-sm">Delete</a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <!-- Company Information Section -->
                            <section>
                                <h3>Company Information</h3>
                                <div class="card company-card">
                                    <div class="card-body">
                                        <img src="../images/company/${company.logo}" alt="Company Logo" class="img-thumbnail" style="width: 100px; height: 100px; border-radius: 50%;">
                                        <p>Founded On: <span>${company.foundedYear}</span></p>
                                        <p>Company Name: <span>${company.companyName}</span></p>
                                        <p>Location: <span>${company.companyAddress}</span></p>
                                        <p>Website: <span>${company.companyWebsite}</span></p>
                                        <p>Company size: <span>${company.companySize}</span></p>
                                        <p>Company Email: <span>${company.companyEmail}</span></p>
                                        <a href="company_profile.jsp" class="btn btn-primary">Edit Company Profile</a>
                                    </div>
                                </div>
                            </section>

                            <!-- Departments Section -->
                            <section>
                                <h3>Departments</h3>
                                <div class="card">
                                    <div class="card-body">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Department Name</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Human Resources</td>
                                                    <td>
                                                        <a href="#" class="btn btn-primary btn-sm">Edit</a>
                                                        <a href="#" class="btn btn-danger btn-sm">Delete</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Marketing</td>
                                                    <td>
                                                        <a href="#" class="btn btn-primary btn-sm">Edit</a>
                                                        <a href="#" class="btn btn-danger btn-sm">Delete</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Development</td>
                                                    <td>
                                                        <a href="#" class="btn btn-primary btn-sm">Edit</a>
                                                        <a href="#" class="btn btn-danger btn-sm">Delete</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <a href="add_department.jsp" class="btn btn-success">Add New Department</a>
                                    </div>
                                </div>
                            </section>

                            <!-- Registered Candidates Section -->
                            <section>
                                <h3>Registered Candidates</h3>
                                <div class="card">
                                    <div class="card-body">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Candidate Name</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>John Doe</td>
                                                    <td>john@example.com</td>
                                                    <td>(123) 456-7890</td>
                                                    <td>
                                                        <a href="#" class="btn btn-info btn-sm">View</a>
                                                        <a href="#" class="btn btn-danger btn-sm">Delete</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Jane Smith</td>
                                                    <td>jane@example.com</td>
                                                    <td>(987) 654-3210</td>
                                                    <td>
                                                        <a href="#" class="btn btn-info btn-sm">View</a>
                                                        <a href="#" class="btn btn-danger btn-sm">Delete</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </section>
            </div>
        </div>
   	</main>
</body>
</html>
