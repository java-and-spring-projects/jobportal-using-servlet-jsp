package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int userId;
    private String username;
    private String password;
    private String phone;
    private String email;
    private String role;
    private String pic;
    private String status;
    private String createdAt;
    private String updatedAt;

    // Relationships
//    private List<Job> jobs;  // If the user is an employer, they can post multiple jobs.
//    private List<Application> applications; // If the user is a job seeker, they can have multiple job applications.

}
