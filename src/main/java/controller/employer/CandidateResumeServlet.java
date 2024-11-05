package controller.employer;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/employer/candidate-resume")
public class CandidateResumeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "hitesh123");
            PreparedStatement stmt = connection.prepareStatement("select * from candidate where candidate_id = ?");
            stmt.setInt(1, id);
            ResultSet rs=stmt.executeQuery();

            if(rs.next()) {
                byte[] resume = rs.getBytes("resume");

                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=\"resume.pdf\"");
                OutputStream out = response.getOutputStream();
                out.write(resume);
                out.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}