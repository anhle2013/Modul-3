package com.cg.controller;

import com.cg.dto.UserDTO;
import com.cg.model.City;
import com.cg.model.User;
import com.cg.service.CityService;
import com.cg.service.ICityService;
import com.cg.service.IUserService;
import com.cg.service.UserService;
import com.cg.utils.ValidateUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    IUserService userService;
    ICityService cityService;
    @Override
    public void init() throws ServletException {
        userService = new UserService();
        cityService = new CityService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null)
            action = "";

        int id;
        switch (action) {
            case "create":
                showCreatePage(req,resp);
                break;
            case "update":
                showUpdatePage(req,resp);
                break;
            case "disable":
                id = Integer.parseInt(req.getParameter("id"));
                userService.remove(id);
                showListPage(req,resp);
                break;
            case "active":
                id = Integer.parseInt(req.getParameter("id"));
                userService.reActive(id);
                showListPage(req,resp);
                break;
            default:
                showListPage(req,resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null)
            action = "";

        switch (action) {
            case "create":
                doCreate(req,resp);
                break;
            case "update":
                doUpdate(req,resp);
                break;
            default:
                showListPage(req,resp);
                break;
        }
    }


    public void showListPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/list.jsp");

        List<UserDTO> userList = userService.findAllUserDTO();

        req.setAttribute("userList", userList);

        dispatcher.forward(req, resp);
    }

    public void showCreatePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/create_user.jsp");
        List<City> cityList = cityService.findAll();
        req.setAttribute("cityList", cityList);

        dispatcher.forward(req,resp);
    }

    public void showUpdatePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/update_user.jsp");
        List<City> cityList = cityService.findAll();
        req.setAttribute("cityList", cityList);
        dispatcher.forward(req,resp);
    }

    public void doCreate (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/create_user.jsp");

        String full_name = req.getParameter("full_name");
        String strAge = req.getParameter("age");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        int city_id = Integer.parseInt(req.getParameter("city_id"));

        List<String> errors = new ArrayList<>();

        boolean ageIsNumber = ValidateUtils.isNumberValid(strAge);
        int ageLength = strAge.length();

        if (!ageIsNumber || ageLength > 3) {
            errors.add("Age is not valid");
        }
        if (errors.size() == 0) {
            int age = Integer.parseInt(strAge);
            User user = new User(full_name, phone, address, city_id, age);
            boolean exist = cityService.existById(city_id);
            boolean success = false;
            if (exist) {
                success = userService.create(user);
            }
            else {
                errors.add("City not found");
            }
            if (success) {
                req.setAttribute("success", true);
            }
            else {
                req.setAttribute("error", true);
                errors.add("Invalid data, please check data again!");
            }
        }
        if (errors.size() > 0) {
            req.setAttribute("errors", errors);
        }
        List<City> cityList = cityService.findAll();
        req.setAttribute("cityList", cityList);
        dispatcher.forward(req, resp);
    }

    public void doUpdate (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/update_user.jsp");
        int id = Integer.parseInt(req.getParameter("id"));
        String fullName = req.getParameter("full_name");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        int city_id = Integer.parseInt(req.getParameter("city_id"));
        int age = Integer.parseInt(req.getParameter("age"));
        User user = new User(id,fullName,phone,address,city_id,age);
        boolean success = userService.update(user);
        if (success)
            req.setAttribute("success",true);
        else
            req.setAttribute("error",true);

        dispatcher.forward(req,resp);
    }

}
