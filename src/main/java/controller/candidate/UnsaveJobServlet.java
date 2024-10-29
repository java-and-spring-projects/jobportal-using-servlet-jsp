package controller.candidate;


import dao.SavedJobDao;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/candidate/unsave-job")
public class UnsaveJobServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        int jobId = Integer.parseInt(request.getParameter("jobId"));

        SavedJobDao savedJobDao = new SavedJobDao();
        savedJobDao.deleteSavedJob(jobId, user.getUserId());
        request.setAttribute("success", "Job unsaved successfully");


        request.getRequestDispatcher("/candidate/all-saved-jobs").forward(request, response);

    }
}