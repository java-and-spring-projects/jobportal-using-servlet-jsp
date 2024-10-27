package controller.employer;


import dao.CompanyDao;
import dao.JobDao;
import model.Company;
import model.Job;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/employer/view-job-details")
public class ViewJobDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int jobId = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");


        JobDao jobDao = new JobDao();
        Job job = jobDao.viewJobDetails(jobId, user.getUserId());
        System.out.println("job: " + job);
        request.setAttribute("job", job);

        request.getRequestDispatcher("/employer/view_job_details.jsp").forward(request, response);
    }
}