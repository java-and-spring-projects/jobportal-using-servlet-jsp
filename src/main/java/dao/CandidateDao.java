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
        String sql = "INSERT INTO Candidate (user_id, name, address, education, skills, experience, resume ) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1,candidate.getUser().getUserId());
            stmt.setString(2, candidate.getName());
            stmt.setString(3, candidate.getAddress());
            stmt.setString(4, candidate.getEducation());
            stmt.setString(5, candidate.getSkills());
            stmt.setString(6, candidate.getExperience());
            stmt.setBytes(7, candidate.getResume());
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
        String sql = "SELECT c.*, u.phone FROM Candidate c join User u on c.user_id = u.user_id WHERE c.user_id = ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setPhone(rs.getString("phone"));

                Candidate candidate = new Candidate();
                candidate.setCandidateId(rs.getInt("candidate_id"));
                candidate.setName(rs.getString("name"));
                candidate.setAddress(rs.getString("address"));
                candidate.setEducation(rs.getString("education"));
                candidate.setSkills(rs.getString("skills"));
                candidate.setExperience(rs.getString("experience"));
                candidate.setResume(rs.getBytes("resume"));
                candidate.setBio(rs.getString("bio"));
                candidate.setUser(user);

                return candidate;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateCandidate(Candidate candidate, User user) {
        String sql = "UPDATE Candidate SET bio = ?, name = ?, address = ?, skills = ?, experience = ?, education = ?, resume = ? WHERE user_id = ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, candidate.getBio());
            stmt.setString(2, candidate.getName());
            stmt.setString(3, candidate.getAddress());
            stmt.setString(4, candidate.getSkills());
            stmt.setString(5, candidate.getExperience());
            stmt.setString(6, candidate.getEducation());
            stmt.setBytes(7, candidate.getResume());
            stmt.setInt(8, user.getUserId());
            int res = stmt.executeUpdate();

            PreparedStatement stmt2 = con.prepareStatement("UPDATE User SET phone = ? WHERE user_id = ?");
            stmt2.setString(1, candidate.getUser().getPhone());
            stmt2.setInt(2, user.getUserId());
            int res2 = stmt2.executeUpdate();

            if (res > 0 && res2 > 0) {
                return true;
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Candidate getCandidate(int candidateId) {
        String sql = "SELECT c.*, u.* FROM Candidate c join User u on c.user_id = u.user_id WHERE candidate_id = ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, candidateId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setCreatedAt(rs.getString("created_on"));
                user.setPic(rs.getString("pic"));
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
                candidate.setBio(rs.getString("bio"));

                candidate.setUser(user);
                return candidate;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Candidate> searchCandidates(String keyword) {
        String sql = "SELECT c.*, u.* FROM Candidate c join User u on c.user_id = u.user_id WHERE name LIKE ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, "%" + keyword + "%");
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
                candidate.setBio(rs.getString("bio"));
                candidate.setUser(user);

                candidates.add(candidate);
            }
            return candidates;
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }
}

