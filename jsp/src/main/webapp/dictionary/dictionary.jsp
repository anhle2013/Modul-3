<%--
  Created by IntelliJ IDEA.
  User: anh lee
  Date: 6/9/2022
  Time: 5:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vietnamese Dictionary</title>
</head>
<body>
    <h1>Vietnamese Dictionary</h1>
    <form action="/dictionary/result.jsp" method="post">
        <p>
            <label>English</label>
            <label>
                <input type="text" placeholder="Enter your word:" name="search">
            </label>
        </p>
        <button type="submit">Translate</button>
    </form>
</body>
</html>
