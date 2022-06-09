import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String product = req.getParameter("product");
        double price = Double.parseDouble(req.getParameter("price"));
        float discount = Float.parseFloat(req.getParameter("discount"));

        double discountAmount = price * discount * 0.01;
        double discountPrice = price - discountAmount;

        PrintWriter writer =resp.getWriter();
        writer.println("<html>");
        writer.println("<h1>Product Description: " + product + "</h1>");
        writer.println("<h1>List Price: " + price + "</h1>");
        writer.println("<h1>Discount Percent: " + discount + "</h1>");
        writer.println("<h1>DiscountAmount: " + discountAmount + "</h1>");
        writer.println("<h1>Discount Price: " + discountPrice + "</h1>");
        writer.println("</html>");
    }


}
