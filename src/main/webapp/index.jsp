<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.*, model.*, java.util.* " %>

<%
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("user");

    JobDao jobDao = new JobDao();
    List<Job> jobs = jobDao.getAllJobsWithCompany();

    request.setAttribute("jobs", jobs);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal User Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <%@ include file="../components/header.jsp"%>
    <style>
        .home{
            width: 100%;
        }

    </style>
</head>
<body>

    <%@ include file="../components/navbar.jsp"%>

    <div class="home">
        <div class="content">
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

            <div class="box">
                <h2 class="heading">The Easiest Way To Find Your Dream Job</h2>
                <div class="buttons">
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-apply">Apply for Job</a>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-post">Post a Job</a>
                </div>
            </div>
        </div>
    </div>

      <%@ include file="../components/footer.jsp"%>
</body>
</html>
