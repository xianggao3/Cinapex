<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> 
<title>CinApex</title>
</head>

<body>
<body bgcolor = "grey">
<jsp:include page="/WEB-INF/view/menu.jsp"></jsp:include>
	<h1>CinApex</h1>
 
  <%
      java.util.Date date = new java.util.Date();
  %>
 
  <h2>
      It is
      <%=date.toString()%>
  </h2>
  
  
  <div class="container"> 
  <h2>Employees</h2>
  <!--Search Form -->
  <form action="/employee" method="get" id="seachEmployeeForm" role="form" >
    <input type="hidden" id="searchAction" name="searchAction" value="searchByName"/>
    <div class="form-group col-xs-5">
        <input type="text" name="employeeName" id="employeeName" class="form-control" required="true" 
                 placeholder="Type the Name or Last Name of the employee"/>                    
    </div>
    <button type="submit" class="btn btn-info">
        <span class="glyphicon glyphicon-search"></span> Search
    </button>
    <br></br>
    <br></br>
  </form>
</div>

</body>
</html>