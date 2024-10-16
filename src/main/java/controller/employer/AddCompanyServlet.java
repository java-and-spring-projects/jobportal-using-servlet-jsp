package controller.employer;


import dao.CompanyDao;
import model.Company;
import model.Department;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/employer/add-company")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1 MB
        maxFileSize = 10 * 1024 * 1024,   // 10 MB
        maxRequestSize = 20 * 1024 * 1024  // 20 MB
)
public class AddCompanyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String companyName = request.getParameter("companyName");
        String companyAddress = request.getParameter("companyAddress");
        String companyWebsite = request.getParameter("companyWebsite");
        String companyEmail = request.getParameter("companyEmail");
        String companySize = request.getParameter("companySize");
        String foundedYear = request.getParameter("foundedYear");
        String dept = request.getParameter("dept");
        Part filePart = request.getPart("pic"); // Retrieves <input type="file" name="image">
        System.out.println("dept"+dept);


        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");


        Department department = new Department();
        department.setDepartmentId(Integer.parseInt(dept));

        Company company = new Company();
        company.setUser(user);
        company.setCompanyName(companyName);
        company.setCompanyAddress(companyAddress);
        company.setCompanyWebsite(companyWebsite);
        company.setCompanyEmail(companyEmail);
        company.setCompanySize(companySize);
        company.setFoundedYear(foundedYear);
        company.setDepartment(department);
        company.setLogo(filePart.getSubmittedFileName());

        CompanyDao companyDao = new CompanyDao();

        int i = companyDao.addCompany(company);

        HttpSession session1=request.getSession();
        session1.setAttribute("companyid",i);

        /*save image in folder*/

           //find out the path to upload the file
        String path = getServletContext().getRealPath("/images")+File.separator+"company"+File.separator+filePart.getSubmittedFileName();

        FileOutputStream fileOutputStream = new FileOutputStream(path);
        InputStream inputStream = filePart.getInputStream();

        //read the data
        byte[] data = new byte[inputStream.available()];
        inputStream.read(data);

        //write the data
        fileOutputStream.write(data);
        fileOutputStream.close();



        response.sendRedirect(request.getContextPath()+"/employer/employer-dashboard");
    }
}