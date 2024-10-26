package controller.candidate;


import dao.JobDao;
import model.Job;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

@WebServlet("/candidate/view-job")
public class ViewJobServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int jobId = Integer.parseInt(request.getParameter("jobId"));

        JobDao jobDao = new JobDao();
        Job job = jobDao.getJobById(jobId);


        /***** Calculating the difference in days between current date and lastDate *******/
       //get lastDate of job
        String lastDateStr = job.getLastDate().toString();

        //get date only from datetime format
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDateTime dateTime = LocalDateTime.parse(lastDateStr, inputFormatter);
        String lastDateOnly = dateTime.format(outputFormatter); //date format only



        LocalDate currentDate = LocalDate.now(); //current date

        // Parse the last date string to LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate lastDate = LocalDate.parse(lastDateOnly, formatter);


        // Calculate the difference in days
        long daysDifference = ChronoUnit.DAYS.between(currentDate, lastDate);



        request.setAttribute("job", job);
        request.setAttribute("daysDifference", daysDifference);
        request.getRequestDispatcher("/candidate/view_job.jsp").forward(request, response);

    }
}