package controller.employer;


import dao.JobDao;
import dao.SavedJobDao;
import model.Job;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

@WebServlet("/employer/view-all-jobs")
public class ViewAllJobsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session1 = request.getSession();
        User user = (User) session1.getAttribute("user");

        JobDao jobDao = new JobDao();
        List<Job> jobs = jobDao.getJobsByUserId(user.getUserId());

        request.setAttribute("jobs", jobs);

        request.getRequestDispatcher("/employer/view_jobs.jsp").forward(request, response);

    }
}