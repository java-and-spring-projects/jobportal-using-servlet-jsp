package dao;

import model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {

    Connection con = null;

    public UserDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "hitesh123");
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    public boolean registerUser(User user) {

        try {
            PreparedStatement pst = con.prepareStatement("insert into user(username,password,email,phone,role,pic) values(?,?,?,?,?,?)");
            pst.setString(1, user.getUsername());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getEmail());
            pst.setString(4, user.getPhone());
            pst.setString(5, user.getRole());
            pst.setString(6, user.getPic());

            pst.executeUpdate();
            return true;
        } catch (Exception e) {
            // TODO: handle exception
            return false;
        }
    }

    public User loginUser(String username, String password) {
        User user = null;
        try {
            PreparedStatement pst = con.prepareStatement("select * from user where username=? and password=?");
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("role"));
                user.setPic(rs.getString("pic"));
                user.setStatus(rs.getString("status"));
                user.setCreatedAt(rs.getString("created_on"));
                user.setUpdatedAt(rs.getString("updated_on"));
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return user;
    }


}