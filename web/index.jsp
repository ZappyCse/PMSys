<%-- 
    Document   : index
    Created on : 8 Oct, 2016, 9:15:35 AM
    Author     : Arun
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="CSS/login.css" rel="stylesheet" type="text/css"/>
        <title>PMSys Login</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form method="POST" action="MainServlet">
            <div class="tmp">
            <div id="div01">
                <br>
                <% if(request.getAttribute("eMsg")!=null){%>
                <label style="color:red"><i><u><%=request.getAttribute("eMsg") %><% } %></u></i></label>
                <br><br>
                <label><b>Username</b></label>
                <br><br>
                <Input class="input01" type="text" name="UN" placeholder="Enter Username" autocomplete="off" title="Your Employee ID" required/>
                <br><br>
                <label><b>Password</b></label>
                <br><br>
                <input class="input01" type="password" name="PW" placeholder="Enter Your Password" autocomplete="off" title="Your Password" required/>
                <br><br>
                <input type="hidden" name="action" value="login"/>
                <button id="button01" type="submit">Login</button><br><br>
                <a id="a01" href="http://www.google.com">Forget Password</a>
            </div>
            </div>
        </form>
    </body>
</html>
