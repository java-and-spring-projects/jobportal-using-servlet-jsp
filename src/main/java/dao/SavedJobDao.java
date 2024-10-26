package dao;

import model.Company;
import model.Job;
import model.SavedJob;
import model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SavedJobDao {

    Connection con = null;

    public SavedJobDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
        } catch (Exception e) {
            // TODO: handle exception
        }
    }


    public boolean saveJob(int jobId, int userId) {

        try {
            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO savedjob (job_id, user_id, isFav) VALUES (?, ?, ?)");
            preparedStatement.setInt(1, jobId);
            preparedStatement.setInt(2, userId);
            preparedStatement.setString(3, "Yes");
            int res = preparedStatement.executeUpdate();
            if (res > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Job> getAllSavedJobs(int userId) {
        List<Job> jobs = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = con.prepareStatement("select j.*, c.*, u.*, sj.* from job j join company c on j.company_id=c.company_id join user u on j.employer_id=u.user_id join savedJob sj on sj.job_id=j.job_id where sj.user_id=?");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Company company = new Company();
                company.setCompanyType(rs.getString("company_type"));
                company.setCompanyName(rs.getString("company_name"));
                company.setCompanyEmail(rs.getString("company_email"));
                company.setCompanyWebsite(rs.getString("company_website"));
                company.setCompanyAddress(rs.getString("company_address"));
                company.setCompanySize(rs.getString("company_size"));
                company.setFoundedYear(rs.getString("founded_year"));
                company.setLogo(rs.getString("logo"));

                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));


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
                job.setLastDate(rs.getTimestamp("last_date"));
                job.setCompany(company);
                job.setUser(user);

                jobs.add(job);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jobs;
    }

    public boolean isSaved(int jobId) {

        try {
            PreparedStatement preparedStatement = con.prepareStatement("select * from savedJob where job_id=? and isFav='Yes'");
            preparedStatement.setInt(1, jobId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteSavedJob(int jobId, int userId) {

        try {
            PreparedStatement preparedStatement = con.prepareStatement("delete from savedJob where job_id=? and user_id=?");
            preparedStatement.setInt(1, jobId);
            preparedStatement.setInt(2, userId);
            int res = preparedStatement.executeUpdate();
            if (res > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}