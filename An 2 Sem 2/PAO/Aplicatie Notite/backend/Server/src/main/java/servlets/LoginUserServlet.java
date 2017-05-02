package servlets;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;
import managers.Manager;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;

import org.json.JSONObject;

/**
 * Created by calin on 29.04.2017.
 */

public class LoginUserServlet extends HttpServlet {



    public void init() throws ServletException {

    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        
        StringBuilder buffer = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            buffer.append(line);
        }
        String data = buffer.toString();


        JsonObject jsonObject = (JsonObject) new JsonParser().parse(data);
        String username = jsonObject.get("user").toString();
        username = username.replace("\"","");
        log("username is " + username);



        boolean isUserInDB = false;
        try {
            isUserInDB = Manager.getInstance().getDatabaseManager().findUser(username);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        if (isUserInDB){
            jsonObject.addProperty("logged",true);
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
        }else{
            jsonObject.addProperty("logged",false);
        }



        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println(jsonObject.toString());



    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {


    }

    public void destroy() {
        // do nothing.
    }

}
