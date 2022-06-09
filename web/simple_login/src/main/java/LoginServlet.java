import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet",value = "/simple_login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String password = req.getParameter("password");

        PrintWriter printWriter = resp.getWriter();
        printWriter.println("<html>");

        if ("admin".equals(userName) && "admin".equals(password)) {
            printWriter.printf("<h1>Welcome: %s to website</h1>",userName);
        } else
            printWriter.println("<h1>Error login</h1>");
        printWriter.println("</html>");
    }

}
