package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Company {
    private int companyId;
    private String companyName;
    private String companyAddress;
    private String companyWebsite;
    private String companyEmail;
    private Timestamp createdAt;
    private String companySize;
    private String foundedYear;
    private String companyType;
    private String logo;

    private Department department;
    private User user;
}
