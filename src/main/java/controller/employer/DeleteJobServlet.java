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

@WebServlet("/employer/delete-job")
public class DeleteJobServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int jobId = Integer.parseInt(request.getParameter("id"));


        JobDao jobDao = new JobDao();
        jobDao.deleteJob(jobId);
        request.setAttribute("success", "Job deleted successfully");

        request.getRequestDispatcher("/employer/view-all-jobs").forward(request, response);
    }


}