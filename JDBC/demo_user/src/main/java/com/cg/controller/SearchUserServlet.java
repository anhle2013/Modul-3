package com.cg.controller;

import com.cg.dto.UserDTO;
import com.cg.service.CityService;
import com.cg.service.ICityService;
import com.cg.service.IUserService;
import com.cg.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchUserServlet", urlPatterns = "/users/search")
public class SearchUserServlet extends HttpServlet {
    IUserService userService;
    ICityService cityService;
    @Override
    public void init() throws ServletException {
        userService = new UserService();
        cityService = new CityService();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/search_user.jsp");
        String field_name = req.getParameter("field_name");
        String search = req.getParameter("search");
        String query = "";
        switch (field_name) {
            case "full_name":
                query = "WHERE u.full_name LIKE '%" + search + "%';";
                break;
            case "phone":
                query = "WHERE u.phone LIKE '%" + search + "%';";
                break;
            case "address":
                query = "WHERE u.address LIKE '%" + search + "%';";
                break;
            case "age":
                query = "WHERE u.age LIKE '%" + search + "%';";
                break;
            case "city":
                query = "WHERE c.city LIKE '%" + search + "%';";
                break;
            case "status":
                query = "WHERE u.status LIKE '%" + search + "%';";
                break;
        }
        List<UserDTO> userList = userService.findUsersDTO(query);
        req.setAttribute("userList", userList);
        dispatcher.forward(req,resp);
    }
}
