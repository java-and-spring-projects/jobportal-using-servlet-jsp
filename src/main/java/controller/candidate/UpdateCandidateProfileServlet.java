package controller.candidate;


import dao.CandidateDao;
import model.Candidate;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/candidate/update-candidate-profile")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1 MB
        maxFileSize = 10 * 1024 * 1024,   // 10 MB
        maxRequestSize = 20 * 1024 * 1024  // 20 MB
)
public class UpdateCandidateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String bio = request.getParameter("bio");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String skills = request.getParameter("skills");
        String experience = request.getParameter("experience");
        String education = request.getParameter("education");
        Part filePart = request.getPart("resume"); // Retrieves <input type="file">

        byte[] resume=null;
       if(filePart != null){
           // Convert Part to byte[]
           resume = new byte[(int) filePart.getSize()];
           try (InputStream inputStream = filePart.getInputStream()) {
               inputStream.read(resume);
           }
       }

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        User user1 = new User();
        user1.setPhone(phone);

        Candidate candidate = new Candidate();
        candidate.setBio(bio);
        candidate.setName(name);
        candidate.setAddress(address);
        candidate.setSkills(skills);
        candidate.setExperience(experience);
        candidate.setEducation(education);
        candidate.setResume(resume);
        candidate.setUser(user1);

        CandidateDao candidateDao = new CandidateDao();
        candidateDao.updateCandidate(candidate, user);

        response.sendRedirect(request.getContextPath() + "/candidate/candidate-profile");
    }
}