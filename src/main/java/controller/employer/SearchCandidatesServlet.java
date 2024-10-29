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
import java.util.List;

@WebServlet("/employer/search-candidates")
public class SearchCandidatesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String keyword = request.getParameter("search-keyword");

        CandidateDao candidateDao = new CandidateDao();
        List<Candidate> searchCandidates = candidateDao.searchCandidates(keyword);
        request.setAttribute("candidates", searchCandidates);

        request.getRequestDispatcher("/employer/view_candidates.jsp").forward(request, response);

    }
}