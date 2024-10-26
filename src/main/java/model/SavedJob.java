package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SavedJob {
    private int savedjobId;
    private String isSaved;

    private Job job;
    private User user;
}
