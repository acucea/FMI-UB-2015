package servlets;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import managers.Manager;
import pojos.Note;

import javax.servlet.http.HttpServlet;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by calin on 01.05.2017.
 */
public class CreateNoteServlet extends HttpServlet{

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
        String text = jsonObject.get("text").toString();
        boolean hasPassword  = jsonObject.get("hasPassword").getAsBoolean();
        String password = jsonObject.get("password").toString();
        username = username.replace("\"","");
        log("username is " + username);

        Note note;
        if(hasPassword){
            note = new Note(username,hasPassword, password, text);
        }else{
            note = new Note(username,hasPassword, "any", text);
        }

        try {
            Manager.getInstance().getDatabaseManager().createNote(note);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

//        if (isUserInDB){
//            jsonObject.addProperty("logged",true);
//        }else{
//            jsonObject.addProperty("logged",false);
//        }



        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println(jsonObject.toString());
        out.close();


    }
}
