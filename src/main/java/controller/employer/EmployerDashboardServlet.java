package controller.employer;

import dao.CompanyDao;
import model.Company;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/employer/employer-dashboard")
public class EmployerDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("user");

        CompanyDao companyDao = new CompanyDao();
        Company companyExist = companyDao.isCompanyExist(loggedUser.getUserId());

        request.setAttribute("company", companyExist);

        request.getRequestDispatcher( "/employer/employer_dashboard.jsp").forward(request, response);
    }
}