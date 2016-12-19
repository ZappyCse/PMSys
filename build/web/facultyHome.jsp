<%-- 
    Document   : facultyHome
    Created on : 8 Oct, 2016, 11:13:20 AM
    Author     : Arun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Home</title>
        <script>
           function scrp(){
               var tbl=document.getElementById("tb1");
               var row=tbl.insertRow(tbl.rows.length);
               var cell=row.insertCell(0);
               var element=document.createElement("input");
               element.setAttribute("type","text");
               cell.appendChild(element);
           }
        </script>
    </head>
    <body>
        <% 
           HttpSession ses=request.getSession(false);
           if(ses.getAttribute("UN")==null){
        %>
                <jsp:forward page="index.jsp"/>
        <% } %>
        <h1>Welcome <%=(String)ses.getAttribute("UN")%></h1>
        <% ses.invalidate();%>
        <form method="get" action="MainServlet">
            <div>
                <table id="tb1" style="border-width: 3px;border-style: solid;border-color: black">
                    <th>Age</th>
                </table>
                <input type="button" onclick="scrp()">
            </div>
        </form>
    </body>
</html>