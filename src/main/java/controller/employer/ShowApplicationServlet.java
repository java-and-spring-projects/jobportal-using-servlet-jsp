package controller.employer;


import dao.ApplicationDao;
import model.Application;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/employer/show-application")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1 MB
        maxFileSize = 10 * 1024 * 1024,   // 10 MB
        maxRequestSize = 20 * 1024 * 1024  // 20 MB
)
public class ShowApplicationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int applicationId = Integer.parseInt(request.getParameter("id"));

        ApplicationDao applicationDao = new ApplicationDao();
        Application application = applicationDao.getApplicationById(applicationId);


        request.setAttribute("application", application);
        request.getRequestDispatcher("/employer/show_application.jsp").forward(request, response);

    }
}