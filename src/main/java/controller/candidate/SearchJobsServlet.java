package controller.candidate;


import dao.JobDao;
import model.Job;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/candidate/search-jobs")
public class SearchJobsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        String jobType = request.getParameter("jobType");
        String jobLocation = request.getParameter("jobLocation");
        String experience = request.getParameter("experience");

        System.out.println("keyword: " + keyword + " jobType: " + jobType + " jobLocation: " + jobLocation + " experience: " + experience);


        JobDao jobDao = new JobDao();
        List<Job> searchJobs = jobDao.searchJobs(keyword, jobType, jobLocation, experience);


        request.setAttribute("jobs", searchJobs);
        request.getRequestDispatcher("/candidate/candidate_dashboard.jsp").forward(request, response);

    }
}