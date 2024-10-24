package dao;


import model.Candidate;
import model.Company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CandidateDao {

    Connection con = null;

    public CandidateDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    public boolean addCandidate(Candidate candidate) {
        String sql = "INSERT INTO Candidate (user_id, name, address, education, skills, experience, resume ) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1,candidate.getUser().getUserId());
            stmt.setString(2, candidate.getName());
            stmt.setString(3, candidate.getAddress());
            stmt.setString(4, candidate.getEducation());
            stmt.setString(5, candidate.getSkills());
            stmt.setString(6, candidate.getExperience());
            stmt.setBlob(7, candidate.getResume());
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

    public Candidate isCandidateExist(int userId) {
        String sql = "SELECT * FROM Candidate WHERE user_id = ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Candidate candidate = new Candidate();
                candidate.setCandidateId(rs.getInt("candidate_id"));
                candidate.setName(rs.getString("name"));
                candidate.setAddress(rs.getString("address"));
                candidate.setEducation(rs.getString("education"));
                candidate.setSkills(rs.getString("skills"));
                candidate.setExperience(rs.getString("experience"));
                return candidate;
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }

}

