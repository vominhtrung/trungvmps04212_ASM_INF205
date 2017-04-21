
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body class="lg">
        <div class="box">
            <h1>Login</h1>
            <form action="ControllerCustomers">
                Username: <input type="text" name="txtUser" value=""/><br/><br/>
                Password: <input type="password" name="txtPass" value=""/><br/><br/>
                
                <div class="nut">
                    <input type="submit" name="action" value="Login"/>
                </div>
                <div class="nut1">
                    <input type="reset" name="Reset" value="Reset"/>
                </div>
            </form>

        </div>
    </body>
</html>
