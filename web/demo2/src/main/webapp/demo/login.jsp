<%--
  Created by IntelliJ IDEA.
  User: anh lee
  Date: 6/8/2022
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/login" method="post" >
        <div>
            <label>User Name</label>
            <input type="text" name="username">
        </div>
        <div>
            <label>Password</label>
            <input type="text" name="password">
        </div>

        <button type="submit">Login</button>
    </form>
</body>
</html>
