<%--
  Created by IntelliJ IDEA.
  User: anh lee
  Date: 6/9/2022
  Time: 4:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
    <h1>Currency Converter</h1>
    <form action="/convert" method="post">
        <p>
            <label>Rate:</label>
            <input type="number" name="rate">
        </p>
        <p>
            <label>USD:</label>
            <input type="number" name="usd">
        </p>
        <button type="submit">Converter</button>
    </form>
</body>
</html>
