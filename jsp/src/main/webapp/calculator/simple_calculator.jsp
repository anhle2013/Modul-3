<%--
  Created by IntelliJ IDEA.
  User: anh lee
  Date: 6/11/2022
  Time: 8:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculator/result">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>First operand: </td>
                <td><input type="number" name="firstOperand"></td>
            </tr>
            <tr>
                <td>Operator: </td>
                <td>
                    <select name="operator">
                        <option value="+">Addition</option>
                        <option value="-">Subtraction</option>
                        <option value="*">Multiplication</option>
                        <option value="/">Division</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand: </td>
                <td><input type="number" name="secondOperand"></td>
            </tr>
            <tr>
                <td></td>
                <td><button type="submit">Calculate</button></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
