package controller.candidate;

import dao.CandidateDao;
import dao.JobDao;
import model.Candidate;
import model.Job;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/candidate/recent-jobs")
public class RecentJobsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        CandidateDao candidateDao = new CandidateDao();
        Candidate candidate = candidateDao.isCandidateExist(user.getUserId());
        request.setAttribute("candidate", candidate);


        JobDao jobDao = new JobDao();
        List<Job> jobs = jobDao.getRecentJobsWithCompany();
        request.setAttribute("jobs", jobs);


        request.getRequestDispatcher( "/candidate/candidate_dashboard.jsp").forward(request, response);
    }
}