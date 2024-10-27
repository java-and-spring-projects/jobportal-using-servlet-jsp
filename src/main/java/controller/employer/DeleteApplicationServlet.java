package controller.employer;


import dao.ApplicationDao;
import model.Application;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/employer/delete-application")

public class DeleteApplicationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int applicationId = Integer.parseInt(request.getParameter("id"));

        ApplicationDao applicationDao = new ApplicationDao();
        applicationDao.deleteApplication(applicationId);

        request.setAttribute("success", "Application deleted successfully");
        request.getRequestDispatcher("/employer/view_applications.jsp").forward(request, response);

    }
}