package controller.employer;


import dao.CompanyDao;
import model.Company;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/employer/company-details")
public class CompanyDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("user");

        CompanyDao companyDao = new CompanyDao();
        Company companyExist = companyDao.isCompanyExist(loggedUser.getUserId());

        request.setAttribute("company", companyExist);

        request.getRequestDispatcher( "/employer/company_details.jsp").forward(request, response);
    }
}