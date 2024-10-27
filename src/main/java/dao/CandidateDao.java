package dao;


import model.Candidate;
import model.Company;
import model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
        String sql = "INSERT INTO Candidate (user_id, name, address, education, skills, experience, resume,pic, phone ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1,candidate.getUser().getUserId());
            stmt.setString(2, candidate.getName());
            stmt.setString(3, candidate.getAddress());
            stmt.setString(4, candidate.getEducation());
            stmt.setString(5, candidate.getSkills());
            stmt.setString(6, candidate.getExperience());
            stmt.setBytes(7, candidate.getResume());
            stmt.setString(8, candidate.getPic());
            stmt.setString(9, candidate.getPhone());
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
                candidate.setResume(rs.getBytes("resume"));
                candidate.setPic(rs.getString("pic"));
                candidate.setPhone(rs.getString("phone"));
                return candidate;
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }

    public List<Candidate> getAllCandidates() {
        String sql = "SELECT c.*, u.* FROM Candidate c join User u on c.user_id = u.user_id";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            List<Candidate> candidates = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getString("status"));
                user.setPhone(rs.getString("phone"));


                Candidate candidate = new Candidate();
                candidate.setCandidateId(rs.getInt("candidate_id"));
                candidate.setName(rs.getString("name"));
                candidate.setAddress(rs.getString("address"));
                candidate.setEducation(rs.getString("education"));
                candidate.setSkills(rs.getString("skills"));
                candidate.setExperience(rs.getString("experience"));
                candidate.setResume(rs.getBytes("resume"));
                candidate.setUser(user);

                candidates.add(candidate);
            }
            return candidates;
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }

    public Candidate candidateProfile(int userId) {
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
                candidate.setResume(rs.getBytes("resume"));
                candidate.setBio(rs.getString("bio"));
                candidate.setPhone(rs.getString("phone"));
                candidate.setPic(rs.getString("pic"));
                return candidate;
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }

    public boolean updateCandidate(Candidate candidate, int userId) {
        String sql = "UPDATE Candidate SET pic = ?, bio = ?, name = ?, address = ?, phone = ?, skills = ?, experience = ?, education = ?, resume = ? WHERE user_id = ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, candidate.getPic());
            stmt.setString(2, candidate.getBio());
            stmt.setString(3, candidate.getName());
            stmt.setString(4, candidate.getAddress());
            stmt.setString(5, candidate.getPhone());
            stmt.setString(6, candidate.getSkills());
            stmt.setString(7, candidate.getExperience());
            stmt.setString(8, candidate.getEducation());
            stmt.setBytes(9, candidate.getResume());
            stmt.setInt(10, userId);
            int res = stmt.executeUpdate();

            PreparedStatement stmt2 = con.prepareStatement("UPDATE User SET phone = ?, pic = ? WHERE user_id = ?");
            stmt2.setString(1, candidate.getPhone());
            stmt2.setString(2, candidate.getPic());
            stmt2.setInt(3, userId);
            int res2 = stmt2.executeUpdate();

            if (res > 0 && res2 > 0) {
                return true;
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}

