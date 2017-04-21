<%-- 
    Document   : trangchu
    Created on : Oct 18, 2016, 9:27:29 PM
    Author     : Do Tien Dung


--%>
<%
            if (session.getAttribute("USER") == null) {
                String path = request.getContextPath();
                String url = path + "login.jsp";                
                response.sendRedirect(url);
            }
%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="header">

                <div class="head-box1">
                    <div class="head-img"><img src="image/logo.jpg" alt="" height="150" width="700"/></div>
                </div>

                <div class="head-box2">
                    <div class="head-dangnhap">
                        <p>Chào mừng   :   ${sessionScope.USER}</p>
                        <a href="login.jsp" class="dn">Đăng Nhập</a>

                        <a href="login.jsp" class="dx">Đăng Xuất</a>
                        <div class="edit-product1">
                            <form action="ControllerProducts">
                                <input type="submit" name="action" value="New Product"/>
                            </form>
                        </div>
                        <div class="edit-product2">
                            <form action="ControllerProducts">
                                <input type="submit" name="action" value="Update Product"/>
                            </form>
                        </div>
                        <div class="edit-product3">
                            <form action="ControllerProducts">
                                <input type="submit" name="action" value="Delete Product"/>
                            </form>
                        </div>
                    </div>
                </div>    
            </div> 


            <div class="content">
                <div class="topl-content">
                    <div class="image"><img id="hinh" src="image/1.jpg"/></div>  
                    <div class="back"><img src="image/back.png" onclick="back()"/></div>
                    <div class="next"><img src="image/next.png" onclick="next()"/></div>
                    <script>
                        var a = document.getElementById("hinh");
                        var i = 1;

                        function next() {
                            i++;
                            if (i >= 7) {
                                i = 1;
                            } else {
                                //
                            }
                            a.src = "image/" + i + ".jpg";
                        }
                        function back() {
                            if (i == 7)
                                i -= 5;
                            else
                                i--;
                            if (i < 1) {
                                i = 6;
                            } else {
                                //
                            }
                            a.src = "image/" + i + ".jpg";
                        }
                        var mySlideshow;
                        document.mySlideshow = setInterval(next, 4000);
                    </script>
                </div>
                <div class="topr-content">
                    <div class="image"><img id="qc" src="image/qc.jpg"/></div>
                </div>
                <div class="bot-content">

                    <c:set var="shop" value="${sessionScope.SHOP}" />
                    <c:if test="${not empty shop}">
                        <table border="1">
                            <thead>
                                <tr>
                                    <td>No.</td>
                                    <td>Code</td>
                                    <td>Name</td>
                                    <td>Price</td>
                                    <td>Quantity</td>
                                    <td>Action</td>
                                </tr>
                            </thead>
                            <tbody>
                            <form action="ControllerCartBean">
                                <c:set var="count" value="0" />
                                <c:forEach var="rows" items="${shop}">
                                    <c:set var="count" value="${count + 1}" />
                                    <tr>
                                        <td>${count}</td>
                                        <td>${rows.value.sanpham.code}</td> 
                                        <td>${rows.value.sanpham.name}</td> 
                                        <td>${rows.value.sanpham.price}</td> 
                                        <td>${rows.value.quantity}</td>
                                        <td><input type="checkbox" name="rmv" 
                                                   value="${rows.value.sanpham.code}" /></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                <c:url var="add" value="ControllerCartBean">
                                    <c:param name="action" value="AddMore"/>
                                </c:url>
                                <td colspan="2"><a href="${add}">Add more</a></td>
                                <td><input type="submit" value="Remove" name="action"/></td>
                                </tr>
                            </form>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
            <div id="footer">
                <div class="head-img"><img src="image/footer.PNG" alt="" height="200" width="1300"/></div>
            </div>
        </div>             


    </body>
</html>

