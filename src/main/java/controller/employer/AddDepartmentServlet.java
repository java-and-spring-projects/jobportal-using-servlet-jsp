package controller.employer;


import dao.DepartmentDao;
import model.Department;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/employer/add-department")

public class AddDepartmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String departmentName = request.getParameter("departmentName");
        String desc = request.getParameter("desc");

        Department department = new Department();
        department.setName(departmentName);
        department.setDescription(desc);

        DepartmentDao departmentDao = new DepartmentDao();
        int res = departmentDao.addDepartment(department);


        response.sendRedirect(request.getContextPath()+"/employer/employer-dashboard");
    }
}