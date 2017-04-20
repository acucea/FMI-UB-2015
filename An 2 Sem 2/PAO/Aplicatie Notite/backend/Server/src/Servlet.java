import java.io.IOException;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Created by calin on 12.04.2017.
 */
public class Servlet extends HttpServlet {


    private String message;

    public void init() throws ServletException{
        message = "Hello world !";
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.println("<h1>" + message + "</h1>");
    }

    public void destroy() {
        // do nothing.
    }

}
