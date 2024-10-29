package controller.employer;


import dao.CandidateDao;
import model.Candidate;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/employer/view-candidates")
public class ViewCandidatesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CandidateDao candidateDao = new CandidateDao();
        List<Candidate> candidates = candidateDao.getAllCandidates();

        request.setAttribute("candidates", candidates);

        request.getRequestDispatcher("/employer/view_candidates.jsp").forward(request, response);
    }
}