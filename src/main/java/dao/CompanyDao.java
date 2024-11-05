package dao;


import model.Company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CompanyDao {

    Connection con = null;

    public CompanyDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "hitesh123");
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    public int addCompany(Company company) {
        String sql = "INSERT INTO Company (employer_id,company_type, company_name, company_address, company_website, company_email,company_size, founded_year, logo ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement stmt = con.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);

            stmt.setInt(1,company.getUser().getUserId());
            stmt.setString(2, company.getCompanyType());
            stmt.setString(3, company.getCompanyName());
            stmt.setString(4, company.getCompanyAddress());
            stmt.setString(5, company.getCompanyWebsite());
            stmt.setString(6, company.getCompanyEmail());
            stmt.setString(7, company.getCompanySize());
            stmt.setString(8, company.getFoundedYear());
            stmt.setString(9, company.getLogo());
            int res= stmt.executeUpdate();


            if(res>0) {
                ResultSet generatedKey=stmt.getGeneratedKeys();
                if(generatedKey.next()){
                    int id=generatedKey.getInt(1);
                    return  id;
                }
            }

            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    return  0;
    }


    public Company isCompanyExist(int userId) {
        Company company=null;
        try {
            String sql = "select * from company where employer_id=?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setLong(1, userId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                company=new Company();

                company.setCompanyId(rs.getInt("company_id"));
                company.setCompanyName(rs.getString("company_name"));
                company.setCompanyAddress(rs.getString("company_address"));
                company.setCompanyWebsite(rs.getString("company_website"));
                company.setCompanyEmail(rs.getString("company_email"));
                company.setCompanySize(rs.getString("company_size"));
                company.setFoundedYear(rs.getString("founded_year"));
                company.setLogo(rs.getString("logo"));
                return company;
            }
        } catch (Exception e) {
            // TODO: handle exception
        }

        return company;

    }
}

