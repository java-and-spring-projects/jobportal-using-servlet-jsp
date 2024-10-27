package controller.employer;


import dao.JobDao;
import model.Job;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/employer/edit-job")
public class EditJobServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int jobId = Integer.parseInt(request.getParameter("id"));


        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");


        JobDao jobDao = new JobDao();
        Job job = jobDao.viewJobDetails(jobId, user.getUserId());
        request.setAttribute("job", job);

        request.getRequestDispatcher("/employer/edit_job.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int jobId = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String jobDescription = request.getParameter("jobDescription");
        String jobLocation = request.getParameter("location");
        String salary = request.getParameter("salary");
        String job_type = request.getParameter("job_type");
        String education = request.getParameter("education");
        String experience = request.getParameter("experience");
        String requirements = request.getParameter("requirements");
        String responsibilities = request.getParameter("responsibilities");
        String benefits = request.getParameter("benefits");
        String vacancy = request.getParameter("vacancy");
        String jobStatus = request.getParameter("jobStatus");

        Job job=new Job();
        job.setJobId(jobId);
        job.setJobTitle(title);
        job.setJobDescription(jobDescription);
        job.setJobLocation(jobLocation);
        job.setJobSalary(salary);
        job.setJobType(job_type);
        job.setEducation(education);
        job.setExperience(experience);
        job.setRequirements(requirements);
        job.setResponsibilities(responsibilities);
        job.setBenefits(benefits);
        job.setVacancy(vacancy);
        job.setJobStatus(jobStatus);

        JobDao jobDao = new JobDao();
        jobDao.updateJob(job);

        response.sendRedirect(request.getContextPath() + "/employer/view-all-jobs");
    }

}