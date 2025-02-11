package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Job {
    private int jobId;
    private String jobTitle;
    private String jobDescription;
    private String jobLocation;
    private String jobSalary;
    private String jobStatus;
    private String jobType;
    private Timestamp createdAt;
    private Timestamp lastDate;
    private String experience;
    private String education;
    private String requirements;
    private String responsibilities;
    private String benefits;
    private String vacancy;


    private Company company;
    private User user;
}
