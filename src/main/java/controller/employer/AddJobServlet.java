package controller.employer;


import dao.CompanyDao;
import dao.JobDao;
import model.Company;
import model.Job;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/employer/add-job")
public class AddJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String jobDescription = request.getParameter("jobDescription");
        String jobLocation = request.getParameter("jobLocation");
        String salary = request.getParameter("salary");
        String job_type = request.getParameter("job_type");
        String education = request.getParameter("education");
        String experience = request.getParameter("experience");
        String requirements = request.getParameter("requirements");
        String responsibilities = request.getParameter("responsibilities");
        String benefits = request.getParameter("benefits");
        String vacancy = request.getParameter("vacancy");
        String lastDate = request.getParameter("last_date");

        //convert string to timestamp
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Adjust the format as needed
        Date date = null;
        try {
            date = sdf.parse(lastDate);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Timestamp timestampLastDate = new Timestamp(date.getTime());




        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");


        CompanyDao companyDao = new CompanyDao();
        Company companyExist = companyDao.isCompanyExist(user.getUserId());


        Job job = new Job();

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
        job.setLastDate(timestampLastDate);
        job.setUser(user);
        job.setCompany(companyExist);


        JobDao jobDao = new JobDao();
        boolean b = jobDao.addJob(job);

        request.setAttribute("success", "Job added successfully");
        request.getRequestDispatcher("/employer/add_job.jsp").forward(request, response);
//        response.sendRedirect(request.getContextPath()+"/employer/employer-dashboard");
    }
}