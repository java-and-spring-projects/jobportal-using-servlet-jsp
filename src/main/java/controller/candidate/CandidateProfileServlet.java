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
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

@WebServlet("/candidate/candidate-profile")
public class CandidateProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        CandidateDao candidateDao = new CandidateDao();
        Candidate candidate = candidateDao.candidateProfile(user.getUserId());
        request.setAttribute("candidate", candidate);
        request.setAttribute("user", user);


        request.getRequestDispatcher("/candidate/candidate_profile.jsp").forward(request, response);

    }
}