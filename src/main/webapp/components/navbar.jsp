<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="header-main">
    <a href="${pageContext.request.contextPath}/" id="logo"><span id="part1">job</span><span id="part2">Portal</span></a>
    <nav>
        <c:choose>
             <c:when test="${not empty sessionScope.user.username}">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/candidate/candidate-dashboard">Dashboard</a></li>

                    <li><a href="${pageContext.request.contextPath}/candidate/my-applications">My Applications</a></li>
                    <li><a href="${pageContext.request.contextPath}/candidate/all-saved-jobs">Saved Jobs</a></li>
                    <li><a href="${pageContext.request.contextPath}/candidate/candidate-profile"><i class="fas fa-user-circle"></i> ${sessionScope.user.username}</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                </ul>

            </c:when>
            <c:otherwise>

                <ul>
                    <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                </ul>
            </c:otherwise>
        </c:choose>
    </nav>
</header>


