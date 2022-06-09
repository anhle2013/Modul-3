<%--
  Created by IntelliJ IDEA.
  User: anh lee
  Date: 6/9/2022
  Time: 9:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Currency Coverter</title>
  </head>
  <body>
    <h2>Currency Coverter</h2>
    <form action="/convert" method="get">
      <label>Rate</label><br/>
      <input type="text" name="rate" placeholder="RATE"><br/>
      <label>USD</label><br/>
      <input type="text" name="usd" placeholder="USD"><br/>
      <button type="submit">Coverter</button>
    </form>
  </body>
</html>
