package controller.candidate;


import dao.CandidateDao;
import dao.JobDao;
import dao.SavedJobDao;
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

@WebServlet("/candidate/save-job")
public class SaveJobServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        int jobId = Integer.parseInt(request.getParameter("jobId"));

        SavedJobDao savedJobDao = new SavedJobDao();
        savedJobDao.saveJob(jobId, user.getUserId());
        request.setAttribute("success", "Job saved successfully");


        request.getRequestDispatcher("/candidate/candidate-dashboard").forward(request, response);

    }
}