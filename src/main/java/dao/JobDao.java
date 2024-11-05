package dao;

import model.Company;
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
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "hitesh123");
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    public boolean addJob(Job job) {

        try {
            PreparedStatement preparedStatement = con.prepareStatement("insert into job (company_id, employer_id, job_title, job_description, location,  salary, job_type, experience, requirements, responsibilities, benefits, vacancy, education_req, last_date) values(?, ?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
            preparedStatement.setTimestamp(14, job.getLastDate());
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
                job.setEducation(rs.getString("education_req"));
                job.setCreatedAt(rs.getTimestamp("posted_on"));
                job.setJobStatus(rs.getString("status"));
                job.setLastDate(rs.getTimestamp("last_date"));
                jobs.add(job);
            }
            return jobs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int getActiveJobsByUserId(int userId) {

        try {
            PreparedStatement preparedStatement = con.prepareStatement("select count(*) from job where employer_id = ? and status = 'Open'");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int getClosedJobsByUserId(int userId) {

        try {
            PreparedStatement preparedStatement = con.prepareStatement("select count(*) from job where employer_id = ? and status = 'Close'");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }


    public List<Job> getAllJobsWithCompany() {

        List<Job> jobs =new ArrayList<>();

        try {
            PreparedStatement preparedStatement = con.prepareStatement("select j.*, c.*, u.* from job j join company c on j.company_id=c.company_id join user u on j.employer_id=u.user_id");
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
                job.setEducation(rs.getString("education_req"));
                job.setCreatedAt(rs.getTimestamp("posted_on"));
                job.setJobStatus(rs.getString("status"));
                job.setLastDate(rs.getTimestamp("last_date"));
                job.setCompany(company);
                job.setUser(user);

                jobs.add(job);
            }
            return jobs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Job getJobById(int jobId) {
        Job job = new Job();
        try {
            PreparedStatement preparedStatement = con.prepareStatement("select j.*, c.* from job j join company c on j.employer_id=c.employer_id where job_id = ?");
            preparedStatement.setInt(1, jobId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                Company company = new Company();
                company.setCompanyType(rs.getString("company_type"));
                company.setCompanyName(rs.getString("company_name"));
                company.setCompanyEmail(rs.getString("company_email"));
                company.setCompanyWebsite(rs.getString("company_website"));
                company.setCompanyAddress(rs.getString("company_address"));
                company.setCompanySize(rs.getString("company_size"));
                company.setFoundedYear(rs.getString("founded_year"));
                company.setLogo(rs.getString("logo"));

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
                job.setEducation(rs.getString("education_req"));
                job.setCreatedAt(rs.getTimestamp("posted_on"));
                job.setJobStatus(rs.getString("status"));
                job.setLastDate(rs.getTimestamp("last_date"));
                job.setCompany(company);
            }
            return job;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Job> searchJobs(String keyword, String jobType, String jobLocation, String experience) {

        List<Job> jobs = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT j.*, c.*, u.* FROM job j " +
                "JOIN company c ON j.company_id = c.company_id " +
                "JOIN user u ON j.employer_id = u.user_id WHERE 1=1 ");

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append("AND (job_title LIKE ? OR company_name LIKE ? OR location LIKE ? OR job_type LIKE ?) ");
        }
        if (jobType != null && !jobType.isEmpty()) {
            sql.append("AND job_type = ? ");
        }
        if (jobLocation != null && !jobLocation.isEmpty()) {
            sql.append("AND location = ? ");
        }
        if (experience != null && !experience.isEmpty()) {
            sql.append("AND experience <= ? ");
        }

        try {
            PreparedStatement stmt = con.prepareStatement(sql.toString());

            int index = 1;
            if (keyword != null && !keyword.trim().isEmpty()) {
                stmt.setString(index++, "%" + keyword + "%");
                stmt.setString(index++, "%" + keyword + "%");
                stmt.setString(index++, "%" + keyword + "%");
                stmt.setString(index++, "%" + keyword + "%");
            }
            if (jobType != null && !jobType.isEmpty()) {
                stmt.setString(index++, jobType);
            }
            if (jobLocation != null && !jobLocation.isEmpty()) {
                stmt.setString(index++, jobLocation);
            }
            if (experience != null && !experience.isEmpty()) {
                stmt.setString(index++, experience);
            }

            ResultSet rs = stmt.executeQuery();

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
                job.setEducation(rs.getString("education_req"));
                job.setCreatedAt(rs.getTimestamp("posted_on"));
                job.setJobStatus(rs.getString("status"));
                job.setLastDate(rs.getTimestamp("last_date"));
                job.setCompany(company);
                job.setUser(user);

                jobs.add(job);
            }
            return jobs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Job viewJobDetails(int jobId, int userId) {

        try {
            PreparedStatement preparedStatement = con.prepareStatement("select * from job where job_id = ? and employer_id = ?");
            preparedStatement.setInt(1, jobId);
            preparedStatement.setInt(2, userId);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
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
                job.setEducation(rs.getString("education_req"));
                job.setCreatedAt(rs.getTimestamp("posted_on"));
                job.setJobStatus(rs.getString("status"));
                job.setLastDate(rs.getTimestamp("last_date"));

                return job;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateJob(Job job) {

        try {
            PreparedStatement preparedStatement = con.prepareStatement("update job set job_title = ?, job_description = ?, location = ?, salary = ?, job_type = ?, education_req = ?, experience = ?, requirements = ?, responsibilities = ?, benefits = ?, vacancy = ?, status = ? where job_id = ?");
            preparedStatement.setString(1, job.getJobTitle());
            preparedStatement.setString(2, job.getJobDescription());
            preparedStatement.setString(3, job.getJobLocation());
            preparedStatement.setString(4, job.getJobSalary());
            preparedStatement.setString(5, job.getJobType());
            preparedStatement.setString(6, job.getEducation());
            preparedStatement.setString(7, job.getExperience());
            preparedStatement.setString(8, job.getRequirements());
            preparedStatement.setString(9, job.getResponsibilities());
            preparedStatement.setString(10, job.getBenefits());
            preparedStatement.setString(11, job.getVacancy());
            preparedStatement.setString(12, job.getJobStatus());
            preparedStatement.setInt(13, job.getJobId());
            return preparedStatement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteJob(int jobId) {

        try {
            PreparedStatement preparedStatement = con.prepareStatement("delete from job where job_id = ?");
            preparedStatement.setInt(1, jobId);
            return preparedStatement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Job> getRecentJobsWithCompany() {
        List<Job> jobs =new ArrayList<>();

        try {
            PreparedStatement preparedStatement = con.prepareStatement("select j.*, c.*, u.* from job j join company c on j.company_id=c.company_id join user u on j.employer_id=u.user_id order by j.posted_on desc limit 5");
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
                job.setEducation(rs.getString("education_req"));
                job.setCreatedAt(rs.getTimestamp("posted_on"));
                job.setJobStatus(rs.getString("status"));
                job.setLastDate(rs.getTimestamp("last_date"));
                job.setCompany(company);
                job.setUser(user);

                jobs.add(job);
            }
            return jobs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}