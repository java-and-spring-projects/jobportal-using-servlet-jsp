package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Department {
    private int departmentId;
    private String name;
    private String description;
    private Timestamp createdAt;
}
