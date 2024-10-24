package controller.candidate;


import dao.ApplicationDao;
import dao.CandidateDao;
import dao.JobDao;
import model.Application;
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

@WebServlet("/candidate/apply-job")
public class ApplyJobServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String feedback = request.getParameter("feedback");
        int jobId = Integer.parseInt(request.getParameter("jobId"));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        JobDao jobDao = new JobDao();
        Job job = jobDao.getJobById(jobId);

        CandidateDao candidateDao = new CandidateDao();
        Candidate candidate = candidateDao.isCandidateExist(user.getUserId());

        Application application = new Application();
        application.setUser(user);
        application.setJob(job);
        application.setFeedback(feedback);
//        application.setResume(candidate.getResume());

        ApplicationDao applicationDao = new ApplicationDao();
        applicationDao.addApplication(application);

        request.getRequestDispatcher("/candidate/candidate-dashboard").forward(request, response);

    }
}