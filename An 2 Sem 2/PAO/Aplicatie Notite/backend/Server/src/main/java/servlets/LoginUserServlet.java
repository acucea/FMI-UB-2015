package servlets;

import managers.Manager;
import responses.RequestResponse;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by calin on 29.04.2017.
 */

public class LoginUserServlet extends HttpServlet {



    public void init() throws ServletException {

    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {


        String user = request.getParameter("user");
        boolean isUserInDB = false;
        String userExist = "";

        try {
            isUserInDB = Manager.getInstance().getDatabaseManager().findUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        if (isUserInDB){
            userExist = "true";
        }else{
            userExist = "false";
        }

        RequestResponse rs = new RequestResponse(200,userExist + " " + user,"fine");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println(rs.toJson());



    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {


    }

    public void destroy() {
        // do nothing.
    }

}
