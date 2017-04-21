<%-- 
    Document   : SearchCustomers
    Created on : Oct 21, 2016, 5:07:19 PM
    Author     : Do Tien Dung
--%>

<%@page import="entity.Customes"%>
<%@page import="java.util.List"%>
<%@page import="DAO.CustomersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table border="1">
            <tr>
                <td>Username</td>
                <td>Password</td>
                <td>HovaTen</td>
                <td>GioiTinh</td>
                <td>Email</td>
                <td>Role</td>
                <td>Edit</td>
                <td>Delete</td>
            </tr>
            <%
                
                List<Customes> list = CustomersDAO.layDanhSachKH("");
                for (Customes kh : list) {
                    out.print("<tr><td>" + kh.getUsername() + "</td><td>" + kh.getPassword()
                            + "</td><td>" + kh.getHoten() + "</td><td>" + kh.getGioitinh()
                            + "</td><td>" + kh.getEmail() + "</td><td>" + kh.getRole() + "</td></tr>");
                }
            %>
        </table>
    </body>
</html>
