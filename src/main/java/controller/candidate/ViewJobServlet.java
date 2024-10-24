package controller.candidate;


import dao.JobDao;
import model.Job;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/candidate/view-job")
public class ViewJobServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int jobId = Integer.parseInt(request.getParameter("jobId"));

        JobDao jobDao = new JobDao();
        Job job = jobDao.getJobById(jobId);


        request.setAttribute("job", job);
        request.getRequestDispatcher("/candidate/view_job.jsp").forward(request, response);

    }
}