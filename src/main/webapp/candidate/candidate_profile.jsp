<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page import="dao.*, model.*, java.util.* " %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal Candidate Dashboard</title>
    <%@ include file="../components/header.jsp"%>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        .my-applications #job-listings{
            margin: 0 auto;
        }
        .my-applications #job-listings .job-card{
            background: #E4E0E1;
            color:
        }
        [readonly] {
            background-color: #E4E0E1;
            cursor: not-allowed;
        }
        form{
            padding: 0 30px;
        }
        form img{
            height: 200px;
            width: 200px;
            margin: 0 auto;
        }
         body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
      .profile-container {
                max-width: 800px;
                margin: 20px auto;
                padding: 20px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .profile-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 2px solid #3498db;
                padding-bottom: 20px;
                margin-bottom: 20px;
            }

            .profile-pic {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                border: 3px solid #3498db;
                margin-right: 20px;
            }

            .profile-name {
                font-size: 28px;
                margin: 0;
            }

            .profile-title {
                color: #777;
                font-size: 18px;
            }

            .profile-bio {
                margin: 20px 0;
            }

            .profile-bio h2 {
                font-size: 22px;
                color: #3498db;
            }

            .profile-skills,
            .profile-experience,
            .profile-education {
                margin: 20px 0;
            }

            h3 {
                font-size: 20px;
                color: #3498db;
                margin-bottom: 10px;
            }

            .skills-list,
            .experience-list,
            .education-list {
                list-style: none;
                padding: 0;
            }

            li {
                margin: 5px 0;
            }
            #name{
                background-color: rgb(245, 245, 245);
            }
            #avatar{
                display: flex;
                flex-direction: column;
                position: relative;
                left: 0%;
                gap: 10px;
            }
            .profile-info{
                position: relative;
                right: 15%;
            }
            #avatar .profile-pic{
                font-size: 8px;
            }
            #avatar label, #avatar input{
                 position: relative;
                 left: 196px;
            }
            .profile-container .heading{
                text-align: center;
                background-color: #3498db;
                color: white;
                font-size: 30px;
                font-weight: 600;
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
                line-height: 1.5;
                padding: 10px;
                margin-bottom: 40px;
            }
            .btn-update{
                background-color: #3498db;
                color: white;
                border: none;
                padding: 8px 25px;
                cursor: pointer;
                margin-left: 10px;
                border-radius: 5px;
                font-size: 14px;
                margin:0 auto;
                display: block;
            }
    </style>
</head>
<body>

    <%@ include file="../components/navbar.jsp"%>

    <div class="profile-container">
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
            <h1 class="heading">Update Profile</h1>
            <section id=" profile-container">

                <form action="${pageContext.request.contextPath}/candidate/update-candidate-profile" method="post"  enctype="multipart/form-data">
                     <div class="profile-header">
                        <div id="avatar">
                            <img src="${pageContext.request.contextPath}/images/users/${sessionScope.user.pic}" alt="Profile Picture"  class="profile-pic">
                        </div>
                        <div class="profile-info">
                            <h1 class="profile-name">${user.username}</h1>
                            <h3 class="profile-title">Email: ${user.email}</h3>
                        </div>
                     </div>

                     <div class="profile-bio">
                        <h2>About Me</h2>
                        <p><textarea class="form-control" id="bio" rows="3" name="bio">${candidate.bio}</textarea></p>
                    </div>

                    <div class="profile-skills">
                        <h3>Name</h3>
                        <input type="text" class="form-control" id="skills" name="name" value="${candidate.name}" aria-describedby="emailHelp">
                    </div>
                    <div class="profile-skills">
                        <h3>Address</h3>
                        <textarea class="form-control" id="address" rows="3" name="address">${candidate.address}</textarea>
                    </div>
                    <div class="profile-skills">
                        <h3>Phone</h3>
                        <input type="text" class="form-control" id="skills" name="phone" value="${candidate.user.phone}" aria-describedby="emailHelp">
                    </div>

                    <div class="profile-skills">
                        <h3>Skills</h3>
                        <input type="text" class="form-control" id="skills" name="skills" value="${candidate.skills}" aria-describedby="emailHelp">
                    </div>

                    <div class="profile-experience">
                        <h3>Experience</h3>
                         <input type="text" class="form-control" id="experience" name="experience" value="${candidate.experience}" aria-describedby="emailHelp">
                    </div>
                    <div class="profile-education">
                        <h3>Education</h3>
                        <input type="text" class="form-control" id="education" name="education" value="${candidate.education}" aria-describedby="emailHelp">
                    </div>

                    <div class="profile-education">
                        <h3>Upload Resume</h3>
                        <input type="file" class="form-control" id="education" name ="resume" aria-describedby="emailHelp">
                    </div>
                    <p><span><a href="${pageContext.request.contextPath}/candidate/view-resume?id=${sessionScope.user.userId}" target="_blank">Download Resume</a></span></p>

                    <input type="submit" class="btn btn-primary btn-update" value="Update">
                </form>


            </section>
        </div>
    </div>

      <%@ include file="../components/footer.jsp"%>

</body>
</html>
