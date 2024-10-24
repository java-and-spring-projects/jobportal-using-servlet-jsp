package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.InputStream;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Application {
    private int applicationId;
    private Timestamp appliedDate;
    private Timestamp interviewDate;
    private String status;
    private String feedback;
    private InputStream resume;

    private User user;
    private Job job;
    private Candidate candidate;
}
