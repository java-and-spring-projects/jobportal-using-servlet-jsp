package controller.candidate;


import dao.SavedJobDao;
import model.Job;
import model.SavedJob;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/candidate/all-saved-jobs")
public class AllSavedJobServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        SavedJobDao savedJobDao = new SavedJobDao();
        List<Job> jobs = savedJobDao.getAllSavedJobs(user.getUserId());

        request.setAttribute("jobs", jobs);


        request.getRequestDispatcher("/candidate/all_saved_jobs.jsp").forward(request, response);

    }
}