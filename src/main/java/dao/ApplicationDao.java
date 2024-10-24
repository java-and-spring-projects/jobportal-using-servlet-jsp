package dao;


import model.Application;
import model.Candidate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ApplicationDao {

    Connection con = null;

    public ApplicationDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    public boolean addApplication(Application application) {
        String sql = "INSERT INTO Application (user_id, job_id, feedback, resume ) VALUES ( ?, ?, ?, ?)";

        try {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1,application.getUser().getUserId());
            stmt.setInt(2, application.getJob().getJobId());
            stmt.setString(3, application.getFeedback());
            stmt.setBlob(4, application.getResume());

            int res= stmt.executeUpdate();

            if(res>0) {
                return true;
            }

            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    return  false;
    }


}

