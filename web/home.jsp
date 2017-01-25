<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
      <% if(session.getAttribute("facultyId")==null){%>
      <jsp:forward page="index.jsp" />
      <% } %>
      <title><%=session.getAttribute("facultyId") %></title>
      <script src="js/common.js" type="text/javascript"></script>
      <script language="javascript" type="text/javascript" >
       
      </script>
      
      <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
      <link href="CSS/common.css" rel="stylesheet" type="text/css"/>
      <style type="text/css">
 
      </style>
  </head>

  <body>

    <div id="mySidenav" class="div">
     <a class="closebtn" onclick="closeNav()">&times;</a>
     <a class="active">Home</a> 
     <a href="personalInformation.jsp">Personal Info</a>
     <a href="skillset.jsp">Skill Set</a>
     <a href="additionalInformation.jsp">Additional Information</a>
     <a href="events.jsp">Events</a>
     <a href="publications.jsp">Publication</a>
    </div>

    <div class="content" id="fm">
      <span id="navbut" onclick="openNav()">&#9776;</span>
      <form method="POST" action="MainServlet">
        

      </form>
    </div>
  </body>
</html>

