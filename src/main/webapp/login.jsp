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
           <div class=".content">

               <c:if test="${not empty error}">
                   <script>
                       showToast("${error}");
                   </script>
               </c:if>

               <c:if test="${not empty success}">
                   <script>
                       showToast("${success}");
                   </script>
               </c:if>

                 <section id="login">
                 <h1 class="heading">Login</h1>
                   <form action="${pageContext.request.contextPath}/login" method="post">
                     <div class="mb-3">
                       <input type="text" class="form-control" id="exampleInputEmail1" name="username" placeholder="Enter email" aria-describedby="emailHelp">
                     </div>
                     <div class="mb-3">
                       <input type="password" class="form-control" placeholder="Enter password" name="password" id="exampleInputPassword1">
                     </div>
                     <input type="submit" class="btn btn-dark" value="Login">
                   </form>
                   <span>Do not have an account ?</span> <a href="register.jsp">Register</a>
                </section>
           </div>
        </div>
    </main>


    <%@ include file="../components/footer.jsp"%>
</body>
</html>
