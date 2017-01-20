<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
      <% if(session.getAttribute("facultyId")==null){%>
      <jsp:forward page="index.jsp" />
      <% } %>
      <title><%=session.getAttribute("facultyId") %></title>
    <script language="javascript" type="text/javascript" >

      function hide(t,t1){
        document.getElementById(t).style.display="none";
        t1.setAttribute("src","add.png");
        t1.setAttribute("onclick","unhide('"+t+"',this)");    
      }

      function unhide(t,t1){
        document.getElementById(t).style.display="inline-block";
        t1.setAttribute("src","rem.png");
        t1.setAttribute("onclick","hide('"+t+"',this)");
      }

    </script>
    
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="CSS/common.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
      
    </style>
  </head>

  <body>

    <div class="div">
      <div class="row">
        <ul class="ul">
          <li><a class="active">Home</a></li> 
          <li><a href="personalInformation.jsp">Personal Info</a></li>
          <li><a href="skillset.jsp">Skill Set</a></li>
          <li><a href="additionalInformation.jsp">Additional Information</a></li>
          <li><a href="events.jsp">Events</a></li>
          <li><a href="publications.jsp">Publications</a></li>
        </ul>
      </div>
    </div>
    
      <div class="content" id="fm">
      <form method="POST" action="MainServlet">

        

      </form>
    </div>
  </body>
</html>

