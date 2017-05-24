package servlets;

import com.google.gson.JsonObject;
import managers.Manager;
import org.json.JSONArray;
import org.json.JSONObject;
import pojos.Note;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by calin on 02.05.2017.
 */
public class GetNoteByIdServlet extends HttpServlet {

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        String username;

        try {


            HttpSession session = request.getSession();
            username = (String) session.getAttribute("user");

            int paramName = Integer.parseInt(request.getParameter("id"));

            Note note = Manager.getInstance().getDatabaseManager().getNoteById(paramName);

            JSONObject jsonObject = new JSONObject(note);


            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "GET");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");
            response.setContentType("application/json");
            response.addHeader("Access-Control-Allow-Origin", "*");

            PrintWriter out = response.getWriter();
            out.println(jsonObject.toString());
            out.flush();
            out.close();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }


    }

}
