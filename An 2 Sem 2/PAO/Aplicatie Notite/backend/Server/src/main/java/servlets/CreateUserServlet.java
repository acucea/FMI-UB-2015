package servlets;

import com.google.gson.JsonObject;
import managers.Manager;
import responses.RequestResponse;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by calin on 20.04.2017.
 */
public class CreateUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    public CreateUserServlet(){
        super();
    }

    public void init() throws ServletException {

    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        String username;
        try {

            username = Manager.getInstance().getDatabaseManager().createUser();

            JsonObject rs = new JsonObject();
            if(username.length() > 0 ){
                rs.addProperty("success", true);
                rs.addProperty("username", username);

            }


            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "GET");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");
            response.setContentType("application/json");
            response.addHeader("Access-Control-Allow-Origin", "*");

            PrintWriter out = response.getWriter();
            out.println(rs.toString());
            out.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }





    }

    public void destroy() {
        // do nothing.
    }

}
