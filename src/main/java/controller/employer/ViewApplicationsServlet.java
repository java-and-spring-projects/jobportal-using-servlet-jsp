package controller.employer;


import dao.ApplicationDao;
import dao.CandidateDao;
import model.Application;
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

@WebServlet("/employer/view-applications")
public class ViewApplicationsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session1 = request.getSession();
        User user = (User) session1.getAttribute("user");

        ApplicationDao applicationDao = new ApplicationDao();
        List<Application> applications = applicationDao.getAllApplications(user.getUserId());

        request.setAttribute("applications", applications);

        request.getRequestDispatcher("/employer/view_applications.jsp").forward(request, response);
    }
}