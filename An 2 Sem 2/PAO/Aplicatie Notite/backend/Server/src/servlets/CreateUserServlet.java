package servlets;

import managers.Manager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by calin on 20.04.2017.
 */
public class CreateUserServlet extends HttpServlet {

    public void init() throws ServletException {

    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        String username;
        try {

            username = Manager.getInstance().getDatabaseManager().createUser();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");

        PrintWriter out = response.getWriter();
        out.println("<h1>" + " " + "</h1>");
    }

    public void destroy() {
        // do nothing.
    }

}
