package com.calculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ResultSimpleCalculatorServlet", urlPatterns = "/calculator/result")
public class ResultSimpleCalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/calculator/result.jsp");
        float firstOperand = Float.parseFloat(req.getParameter("firstOperand"));
        String operator = req.getParameter("operator");
        float secondOperand = Float.parseFloat(req.getParameter("secondOperand"));
        float result = 0;

        switch (operator) {
            case "+":
                result = firstOperand + secondOperand;
                break;
            case "-":
                result = firstOperand - secondOperand;
                break;
            case "*":
                result = firstOperand * secondOperand;
                break;
            case "/":
                result = firstOperand / secondOperand;
                break;
        }
        req.setAttribute("firstOperand", firstOperand);
        req.setAttribute("operator", operator);
        req.setAttribute("secondOperand", secondOperand);
        req.setAttribute("result",result);
        dispatcher.forward(req,resp);
    }
}
