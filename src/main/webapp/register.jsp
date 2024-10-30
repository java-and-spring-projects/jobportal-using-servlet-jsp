<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal: Registration</title>
    <link rel="icon" href="images/fav.png" type="image/x-icon">
    <link rel="stylesheet" href="css/style.css">
    <%@ include file="../components/header.jsp"%>
    <style>
        body {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <%@ include file="../components/navbar.jsp"%>

    <main>
         <div class="container">
                <div class="content">
                     <section id="register">
                         <h2 class="heading">Create an account</h2>
                          <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Username:</label>
                                    <strong style="color: red;">*</strong>
                                    <input type="text" class="form-control" name="username" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter username" required>
                                 </div>

                                 <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Password:</label>
                                    <strong style="color: red;">*</strong>
                                    <input type="password" class="form-control" name="password" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter password" required>
                                 </div>

                                 <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email:</label>
                                    <strong style="color: red;">*</strong>
                                    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email address" required>
                                 </div>

                                 <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Phone:</label>
                                    <strong style="color: red;">*</strong>
                                    <input type="text" class="form-control" name="phone" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone number" required>
                                 </div>

                                 <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Role:</label>
                                    <strong style="color: red;">*</strong>
                                    <select class="form-select" name="role" aria-label="Default select example" required>
                                        <option selected>-Select the role-</option>
                                        <option value="Employer">Employer</option>
                                        <option value="JobSeeker">Job Seeker</option>
                                    </select>
                                 </div>

                                 <div class="mb-3">
                                   <label for="formFile" class="form-label">Choose your profile picture</label>
                                   <input class="form-control" type="file" name="pic" accept="image/*" id="formFile">
                                 </div>

                                 <input type="submit" class="btn-register btn btn-dark" value="Register">
                           </form>
                           <span>Already registered ?</span> <a href="login.jsp">Login</a>
                        </section>
                </div>
            </div>
    </main>


    <%@ include file="../components/footer.jsp"%>
</body>
</html>
