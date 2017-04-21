<%-- 
    Document   : showCustomers
    Created on : Oct 21, 2016, 5:12:17 PM
    Author     : Do Tien Dung
--%>
<%@page import="DAO.CustomersDAO"%>
<%@page import="entity.Customes" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <form action="ControllerCustomers">
            Ten KH: <input type="text" name="txtTenKH" value=""/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <table border="1">
            <tr>
                <td>Username</td>
                <td>Password</td>
                <td>HovaTen</td>
                <td>GioiTinh</td>
                <td>Email</td>
                <td>Role</td>
                <td>Delete</td>
            </tr>
            <c:forEach var="rows" items="${listKH}">
                <form action="ControllerCustomers">
                    <tr>
                        <td>${rows.username}</td>
                        <td>${rows.password}</td>
                        <td>${rows.hoten}</td>
                        <td>${rows.gioiyinh}</td>
                        <td>${rows.email}</td>
                        <td>${rows.role}</td>
                        <td>
                            <input type="hidden" name="txtMaKH" value="${rows.userName}"/>
                            <input type="submit" name="action" value="Delete"/>
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </table>
    </body>
</html>
