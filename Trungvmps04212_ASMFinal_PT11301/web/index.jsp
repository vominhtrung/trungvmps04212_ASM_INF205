<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                        
                        <a href="login.jsp" class="dn">Đăng Nhập</a>

                        <a href="login.jsp" class="dx">Đăng Xuất</a>
                       
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

                    <table border="1">
            <tr>
                <td>Ma SP</td>
                <td>Ten SP</td>
                <td>Gia</td>
            </tr>      
        <%
            Products listSP = new Products();
           List<Product> list = listSP.showProduct("");
           for(Product sp:list){
                out.print("<form action=\"ControllerCartBean\">");
                out.print("<tr><td>"+sp.getCode()+"</td><td>"+sp.getName()+ "</td>"+
                        "<td>"+sp.getPrice()+"</td><td><input type=\"submit\" "
                        + "value=\"Add to Cart\" name=\"action\" /></td>"
                        + "<input type=\"hidden\" name=\"txtCode\" value='" + sp.getCode() + "'>"
                        + "<input type=\"hidden\" name=\"txtName\" value='" + sp.getName() + "'>"
                        + "<input type=\"hidden\" name=\"txtPrice\" value='" + sp.getPrice() + 
                        "'></tr>");
                out.print("</form>");
                
           }
           
        %>     
        </table>
        <form action="ControllerCartBean">
            <input type="submit" value="View Cart" name="action" />
        </form>
                </div>
            </div>
            <div id="footer">
                <div class="head-img"><img src="image/footer.PNG" alt="" height="200" width="1300"/></div>
            </div>
        </div>             


    </body>
</html>
