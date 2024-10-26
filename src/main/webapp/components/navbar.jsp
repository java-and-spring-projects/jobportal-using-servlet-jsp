<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="header-main">
    <a href="${pageContext.request.contextPath}/candidate/candidate-dashboard"><img src="https://cdn-icons-png.freepik.com/512/942/942749.png" alt="Job Portal Logo" class="logo" height="50px"></a>
    <nav>
        <c:choose>
             <c:when test="${not empty sessionScope.user.username}">
                <ul>
                    <li><a href="#profile">Profile</a></li>
                    <li><a href="#job-listings">Job Listings</a></li>
                    <li><a href="${pageContext.request.contextPath}/candidate/my-applications">My Applications</a></li>
                    <li><a href="#messages">Messages</a></li>
                </ul>

            </c:when>
            <c:otherwise>
                <ul>
                    <li><a href="#profile">Profile</a></li>
                    <li><a href="#job-listings">Job Listings</a></li>
                    <li><a href="${pageContext.request.contextPath}/candidate/candidate/my-applications">My Applications</a></li>
                    <li><a href="#messages">Messages</a></li>
                </ul>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                </ul>
            </c:otherwise>
        </c:choose>
    </nav>
</header>


