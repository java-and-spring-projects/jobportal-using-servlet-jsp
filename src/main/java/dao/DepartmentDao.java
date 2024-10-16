package dao;


import model.Department;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDao {

    Connection con = null;

    public DepartmentDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    public int addDepartment(Department department) {
        String sql = "INSERT INTO Department (dept_name, dept_desc) VALUES (?, ?)";

        try {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, department.getName());
            stmt.setString(2, department.getDescription());
            int res= stmt.executeUpdate();

            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    return  0;
    }

    public List<Department> getAllDepartments() {
        List<Department> departments = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Department";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Department department = new Department();

                department.setDepartmentId(rs.getInt("dept_id"));
                department.setName(rs.getString("dept_name"));
                department.setDescription(rs.getString("dept_desc"));
                department.setCreatedAt(rs.getTimestamp("created_on"));

                departments.add(department);
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return departments;
    }

}

