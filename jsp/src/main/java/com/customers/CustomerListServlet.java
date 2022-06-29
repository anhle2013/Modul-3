package com.customers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerListServlet", urlPatterns = "/customers")

public class CustomerListServlet extends HttpServlet {
    static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Phan Thành Nam", LocalDate.of(2000,12,1),"Hà Nội","https://i.pravatar.cc/150?img=3\n"));
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/customers/customers.jsp");
        String fullName = req.getParameter("fullName");
        String strDate = req.getParameter("dateOfBirth");
//        Date dateOfBirth = null;
//        try {
//            dateOfBirth = new SimpleDateFormat("yyyy-MM-dd").parse(strDate);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }

//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dateOfBirth = LocalDate.parse(strDate);
        String address = req.getParameter("address");
        String imgPath = req.getParameter("imgPath");
        customerList.add(new Customer(fullName, dateOfBirth, address, imgPath));

        req.setAttribute("customersList", customerList);
        dispatcher.forward(req, resp);
    }
}
