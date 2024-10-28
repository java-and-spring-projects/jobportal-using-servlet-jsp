package controller.candidate;


import dao.CandidateDao;
import dao.CompanyDao;
import model.Candidate;
import model.Company;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/candidate/register-candidate")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1 MB
        maxFileSize = 10 * 1024 * 1024,   // 10 MB
        maxRequestSize = 20 * 1024 * 1024  // 20 MB
)
public class AddCandidateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String education = request.getParameter("education");
        String skills = request.getParameter("skills");
        String experience = request.getParameter("experience");
        Part filePart = request.getPart("resume"); // Retrieves <input type="file">

        // Convert Part to byte[]
        byte[] resume = new byte[(int) filePart.getSize()];
        try (InputStream inputStream = filePart.getInputStream()) {
            inputStream.read(resume);
        }

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Candidate candidate = new Candidate();
        candidate.setUser(user);
        candidate.setName(name);
        candidate.setAddress(address);
        candidate.setEducation(education);
        candidate.setSkills(skills);
        candidate.setExperience(experience);
        candidate.setResume(resume);
        candidate.setPhone(user.getPhone());


        CandidateDao candidateDao = new CandidateDao();
        candidateDao.addCandidate(candidate);
        request.setAttribute("success", "Candidate added successfully");

//        request.getRequestDispatcher("/candidate/candidate-dashboard").forward(request, response);

        response.sendRedirect(request.getContextPath() + "/candidate/candidate-dashboard");
    }
}