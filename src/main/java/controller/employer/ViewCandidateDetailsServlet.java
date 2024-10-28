package controller.employer;


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

@WebServlet("/employer/view-candidate-details")
public class ViewCandidateDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int candidateId = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        CandidateDao candidateDao = new CandidateDao();
        Candidate candidate = candidateDao.getCandidate(candidateId);


        request.setAttribute("candidate", candidate);

        request.getRequestDispatcher("/employer/view_candidate_details.jsp").forward(request, response);
    }
}