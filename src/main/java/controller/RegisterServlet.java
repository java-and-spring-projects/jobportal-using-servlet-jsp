package controller;

import dao.UserDao;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/register")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1 MB
        maxFileSize = 10 * 1024 * 1024,   // 10 MB
        maxRequestSize = 20 * 1024 * 1024  // 20 MB
)
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //get values from register.jsp form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        Part filePart = request.getPart("pic"); // Retrieves <input type="file" name="image">



        //create user object
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setPhone(phone);
        user.setRole(role);
        user.setPic(filePart.getSubmittedFileName());


        //create userdao object for database operations
        UserDao userDao=new UserDao();
        userDao.registerUser(user);


        /*save image in folder*/

        //find out the path to upload the file
        String path = getServletContext().getRealPath("/images")+ File.separator+"users"+File.separator+filePart.getSubmittedFileName();
        System.out.println(path);

        FileOutputStream fileOutputStream = new FileOutputStream(path);
        InputStream inputStream = filePart.getInputStream();

        //read the data
        byte[] data = new byte[inputStream.available()];
        inputStream.read(data);

        //write the data
        fileOutputStream.write(data);
        fileOutputStream.close();

        //redirect to login page after successful registration
        response.sendRedirect("login.jsp");

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }
}


/*
* store only image name in database and image data in folder 'images/users'
* */