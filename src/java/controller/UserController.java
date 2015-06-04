/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import business.User;
import data.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import security.PasswordDigest;

/**
 *
 * @author K G
 */
public class UserController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String requestURI = request.getRequestURI();
        String register = request.getParameter("registerUser");
        String url;
        if (register != null) {
            if (register.equals("registerUser")) {
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String addressLine1 = request.getParameter("addressLine1");
                String addressLine2 = request.getParameter("addressLine2");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String postCode = request.getParameter("postCode");
                String country = request.getParameter("country");
                String emailID = request.getParameter("emailID");
                String password = request.getParameter("password");
                String confPassword = request.getParameter("confPassword");
                String error;
                if (!password.equals(confPassword)) {
                    error = "Password entered did not match!!";
                    request.setAttribute("error", error);
                    url = "/userInfo_error.jsp";
                    getServletContext()
                            .getRequestDispatcher(url)
                            .forward(request, response);
                } else if (firstName == "" || lastName == "" || addressLine1 == "" || addressLine2 == "" || city == "" || state == "" || postCode == "" || country == "" || password == "") {
                    error = "All the information should be filled.";
                    request.setAttribute("error", error);
                    url = "/userInfo_error.jsp";
                    getServletContext()
                            .getRequestDispatcher(url)
                            .forward(request, response);
                } else if (UserDB.getUser(emailID) != null) {
                    error = "Email id provided is already registered!";
                    request.setAttribute("error", error);
                    url = "/userInfo_error.jsp";
                    getServletContext()
                            .getRequestDispatcher(url)
                            .forward(request, response);
                } else {
                    String encryptedPWD = PasswordDigest.doMD5Digest(password);
                    User u = new User(firstName, lastName, emailID, addressLine1, addressLine2, city, state, postCode, country, encryptedPWD, emailID, "customer");
                    UserDB.addUser(u);
                    request.login(emailID, password);
                    url = "/order.jsp";
                    getServletContext()
                            .getRequestDispatcher(url)
                            .forward(request, response);

                }

            }

        }
    }
}
