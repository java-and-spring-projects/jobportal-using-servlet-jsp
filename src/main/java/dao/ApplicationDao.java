package dao;


import model.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
            stmt.setBytes(4, application.getResume());

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

    public List<Application> getAllApplications() {
        String sql = "select a.*, j.*, u.*,c.* from application a \n" +
                "join job j on a.job_id=j.job_id \n" +
                "join user u on u.user_id=a.user_id \n" +
                "join candidate c on c.user_id=u.user_id;";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            List<Application> applications = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("role"));
                user.setPic(rs.getString("pic"));
                user.setStatus(rs.getString("status"));

                Candidate candidate = new Candidate();
                candidate.setName(rs.getString("name"));
                candidate.setAddress(rs.getString("address"));
                candidate.setEducation(rs.getString("education"));
                candidate.setSkills(rs.getString("skills"));
                candidate.setExperience(rs.getString("experience"));

                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setJobDescription(rs.getString("job_description"));
                job.setJobLocation(rs.getString("location"));
                job.setJobSalary(rs.getString("salary"));
                job.setJobType(rs.getString("job_type"));
                job.setExperience(rs.getString("experience"));
                job.setRequirements(rs.getString("requirements"));
                job.setResponsibilities(rs.getString("responsibilities"));
                job.setBenefits(rs.getString("benefits"));
                job.setVacancy(rs.getString("vacancy"));


                Application application = new Application();
                application.setApplicationId(rs.getInt("application_id"));
                application.setAppliedDate(rs.getTimestamp("applied_on"));
                application.setInterviewDate(rs.getTimestamp("interview_date"));
                application.setStatus(rs.getString("status"));
                application.setFeedback(rs.getString("feedback"));
                application.setJob(job);
                application.setUser(user);
                application.setCandidate(candidate);
                applications.add(application);
            }
            rs.close();
            stmt.close();
            return applications;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Application getApplicationById(int applicationId) {
        String sql = "select a.*, j.*, u.*,c.* from application a \n" +
                "join job j on a.job_id=j.job_id \n" +
                "join user u on u.user_id=a.user_id \n" +
                "join candidate c on c.user_id=u.user_id where application_id=?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1,applicationId);
            ResultSet rs = stmt.executeQuery();
            Application application = new Application();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("role"));
                user.setPic(rs.getString("pic"));
                user.setStatus(rs.getString("status"));

                Candidate candidate = new Candidate();
                candidate.setName(rs.getString("name"));
                candidate.setAddress(rs.getString("address"));
                candidate.setEducation(rs.getString("education"));
                candidate.setSkills(rs.getString("skills"));
                candidate.setExperience(rs.getString("experience"));

                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setJobDescription(rs.getString("job_description"));
                job.setJobLocation(rs.getString("location"));
                job.setJobSalary(rs.getString("salary"));
                job.setJobType(rs.getString("job_type"));
                job.setExperience(rs.getString("experience"));
                job.setRequirements(rs.getString("requirements"));
                job.setResponsibilities(rs.getString("responsibilities"));
                job.setBenefits(rs.getString("benefits"));
                job.setVacancy(rs.getString("vacancy"));


                application.setApplicationId(rs.getInt("application_id"));
                application.setAppliedDate(rs.getTimestamp("applied_on"));
                application.setInterviewDate(rs.getTimestamp("interview_date"));
                application.setStatus(rs.getString("status"));
                application.setFeedback(rs.getString("feedback"));
                application.setResume(rs.getBytes("resume"));
                application.setJob(job);
                application.setUser(user);
                application.setCandidate(candidate);
            }
            rs.close();
            stmt.close();
            return application;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateApplication(int applicationId,String status)
    {
        String sql = "update application set status=? where application_id=?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1,status);
            stmt.setInt(2,applicationId);
            stmt.executeUpdate();
            stmt.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getTotalApplications() {
        String sql = "select count(*) from application;";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getAcceptedApplications() {
        String sql = "select count(*) from application where status='accepted';";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getRejectedApplications() {
        String sql = "select count(*) from application where status='rejected';";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }


    public boolean isApplicationExist(int userId, int jobId) {
        String sql = "select * from application where user_id=? and job_id=?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1,userId);
            stmt.setInt(2,jobId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Application> getMyApplications(int userId) {
        String sql = "select a.*, j.*, u.*,c.* from application a \n" +
                "                join job j on a.job_id=j.job_id \n" +
                "                join user u on u.user_id=a.user_id\n" +
                "                join company c on c.employer_id=j.employer_id  \n" +
                "                where a.user_id=?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1,userId);
            ResultSet rs = stmt.executeQuery();
            List<Application> applications = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("role"));
                user.setPic(rs.getString("pic"));
                user.setStatus(rs.getString("status"));

                Company company = new Company();
                company.setCompanyName(rs.getString("company_name"));
                company.setCompanyAddress(rs.getString("company_address"));
                company.setCompanyEmail(rs.getString("company_email"));
                company.setCompanyWebsite(rs.getString("company_website"));
                company.setLogo(rs.getString("logo"));


                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setJobDescription(rs.getString("job_description"));
                job.setJobLocation(rs.getString("location"));
                job.setJobSalary(rs.getString("salary"));
                job.setJobType(rs.getString("job_type"));
                job.setExperience(rs.getString("experience"));
                job.setRequirements(rs.getString("requirements"));
                job.setResponsibilities(rs.getString("responsibilities"));
                job.setBenefits(rs.getString("benefits"));
                job.setVacancy(rs.getString("vacancy"));
                job.setLastDate(rs.getTimestamp("last_date"));
                job.setCompany(company);

                Application application = new Application();
                application.setApplicationId(rs.getInt("application_id"));
                application.setAppliedDate(rs.getTimestamp("applied_on"));
                application.setInterviewDate(rs.getTimestamp("interview_date"));
                application.setStatus(rs.getString("status"));
                application.setFeedback(rs.getString("feedback"));
                application.setResume(rs.getBytes("resume"));
                application.setJob(job);
                application.setUser(user);
//                application.setCompany(company);
                applications.add(application);

            }
            return applications;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

