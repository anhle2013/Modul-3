<%--
  Created by IntelliJ IDEA.
  User: anh lee
  Date: 6/9/2022
  Time: 9:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Product Discount Calculator</title>
  </head>
  <body>
    <form action="/display-discount " method="get">
      <table>
        <tr>
          <td>Product Description</td>
          <td><input type="text" name="product" placeholder="Product Description"></td>
        </tr>
        <tr>
          <td>List Price</td>
          <td><input type="text" name="price" placeholder="List Price"></td>
        </tr>
        <tr>
          <td>Discount Percent</td>
          <td><input type="text" name="discount" placeholder="Discount Percent"></td>
        </tr>
      </table>
      <button type="submit">Calculate</button>
    </form>
  </body>
</html>
