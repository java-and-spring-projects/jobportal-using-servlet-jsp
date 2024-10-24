package dao;

import model.Job;
import model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JobDao {

    Connection con = null;

    public JobDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    public boolean addJob(Job job) {

        try {
            PreparedStatement preparedStatement = con.prepareStatement("insert into job (company_id, employer_id, job_title, job_description, location,  salary, job_type, experience, requirements, responsibilities, benefits, vacancy, education) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setInt(1, job.getCompany().getCompanyId());
            preparedStatement.setInt(2, job.getUser().getUserId());
            preparedStatement.setString(3, job.getJobTitle());
            preparedStatement.setString(4, job.getJobDescription());
            preparedStatement.setString(5, job.getJobLocation());
            preparedStatement.setString(6, job.getJobSalary());
            preparedStatement.setString(7, job.getJobType());
            preparedStatement.setString(8, job.getExperience());
            preparedStatement.setString(9, job.getRequirements());
            preparedStatement.setString(10, job.getResponsibilities());
            preparedStatement.setString(11, job.getBenefits());
            preparedStatement.setString(12, job.getVacancy());
            preparedStatement.setString(13, job.getEducation());
            preparedStatement.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Job> getJobsByUserId(int userId) {

        List<Job> jobs =new ArrayList<>();

        try {
            PreparedStatement preparedStatement = con.prepareStatement("select * from job where employer_id = ?");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
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
                job.setEducation(rs.getString("education"));
                job.setCreatedAt(rs.getTimestamp("posted_on"));
                job.setJobStatus(rs.getString("status"));
                jobs.add(job);
            }
            return jobs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Job> getActiveJobsByUserId(int userId) {

        List<Job> jobs =new ArrayList<>();

        try {
            PreparedStatement preparedStatement = con.prepareStatement("select * from job where employer_id = ? and status = 'Open'");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
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
                job.setEducation(rs.getString("education"));
                job.setCreatedAt(rs.getTimestamp("posted_on"));
                job.setJobStatus(rs.getString("status"));
                jobs.add(job);
            }
            return jobs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Job> getClosedJobsByUserId(int userId) {

        List<Job> jobs =new ArrayList<>();

        try {
            PreparedStatement preparedStatement = con.prepareStatement("select * from job where employer_id = ? and status = 'Close'");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
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
                job.setEducation(rs.getString("education"));
                job.setCreatedAt(rs.getTimestamp("posted_on"));
                job.setJobStatus(rs.getString("status"));
                jobs.add(job);
            }
            return jobs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}