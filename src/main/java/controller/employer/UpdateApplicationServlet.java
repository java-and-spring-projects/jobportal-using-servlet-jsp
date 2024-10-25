package controller.employer;


import dao.ApplicationDao;
import dao.CompanyDao;
import dao.JobDao;
import model.Company;
import model.Job;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/employer/update-application")
public class UpdateApplicationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int applicationId = Integer.parseInt(request.getParameter("applicationId"));
        String status = request.getParameter("status");

        ApplicationDao applicationDao = new ApplicationDao();
        applicationDao.updateApplication(applicationId, status);


        response.sendRedirect(request.getContextPath()+"/employer/view_applications.jsp");
    }
}