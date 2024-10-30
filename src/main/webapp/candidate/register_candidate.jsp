<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.*, model.*, java.util.* " %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal: Register Candidate</title>
    <link rel="stylesheet" href="../css/style.css">
    <%@ include file="../components/header.jsp"%>
</head>
<body>

    <%@ include file="../components/navbar.jsp"%>

    <div class="container register-candidate">
        <div class="content">
            <section id="register-candidate-form">
                <h2 class="heading">Register Candidate</h2>

                <form action="${pageContext.request.contextPath}/candidate/register-candidate" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" value="${sessionScope.user.username}" readonly placeholder="Enter username" required>
                    </div>

                      <div class="mb-3">
                         <label for="phone" class="form-label">Phone</label>
                         <input type="text" class="form-control" id="username" name="phone" value="${sessionScope.user.phone}" readonly placeholder="Enter phone" required>
                     </div>

                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="username" name="name"placeholder="Enter name" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${sessionScope.user.email}" readonly placeholder="Enter email address" required>
                    </div>

                    <div class="mb-3 form-floating">
                         <textarea class="form-control" name="address" id="floatingTextarea2" style="height: 100px"></textarea>
                          <label for="floatingTextarea2">Candidate Address</label>
                     </div>

                    <div class="mb-3">
                        <label for="education" class="form-label">Education</label>
                        <input type="text" class="form-control" id="education" name="education" placeholder="Enter education" required>
                    </div>

                    <div class="mb-3">
                        <label for="skills" class="form-label">Skills</label>
                        <input type="text" class="form-control" id="skills" name="skills" placeholder="Enter skills" required>
                    </div>

                    <div class="mb-3">
                        <label for="experience" class="form-label">Experience</label>
                        <input type="text" class="form-control" id="experience" name="experience" placeholder="Enter experience" required>
                    </div>

                    <div class="mb-3">
                        <label for="resume" class="form-label">Resume</label>
                        <input type="file" class="form-control" id="resume" name="resume" required>
                    </div>

                    <input type="submit" class="btn btn-primary" value="Register">
                </form>
            </section>
        </div>
    </div>

      <%@ include file="../components/footer.jsp"%>

</body>
</html>
