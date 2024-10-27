package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.InputStream;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Candidate {
    private int candidateId;
    private String name;
    private String address;
    private String education;
    private String skills;
    private Timestamp createdAt;
    private String experience;
    private byte[] resume;
    private String bio;
    private String pic;
    private String phone;

    private User user;
}
