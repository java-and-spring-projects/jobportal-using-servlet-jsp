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
import java.util.List;

@WebServlet("/candidate/my-applications")
public class MyApplicationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        ApplicationDao applicationDao = new ApplicationDao();
        List<Application> applications = applicationDao.getMyApplications(user.getUserId());
        request.setAttribute("applications", applications);


        request.getRequestDispatcher( "/candidate/my_applications.jsp").forward(request, response);
    }
}