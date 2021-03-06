<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	
		
		
		<!-- CSS -->	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	</head>


<body>
<style>

.navbar-search {
  margin-top: 4px;
}

.navbar .btn, .navbar .btn-group {
  margin-top: 1px;
}

.navbar-search select {
  position: relative;
  left: 84px;
  z-index: 99;
}

.navbar-search input {
  padding-left: 84px;
}

.navbar-search select,
.navbar-search input {
margin-bottom: 0px;
}

.icon-size
{
    font-size: 87px;
}

.navbar-login
{
    width: 305px;
    padding: 10px;
    padding-bottom: 0px;
}

.navbar-login-session
{
    padding: 10px;
    padding-bottom: 0px;
    padding-top: 0px;
}

</style>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/Cinapex1/">
      <img alt="Logo" href="/Cinapex1/" src="${pageContext.request.contextPath}/CinApex.png" style="max-width:150px; margin-top: -5px;">
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
 
           <form class="navbar-form navbar-left" action="/Cinapex1/FindMovie">
                <div class='input-prepend'>
                    <font color = "red">Category: </font>
                    <select id="select" name="selector" style="width: 80px; height: 30px">
                        <option>Title </option>
                        <option>Genre</option>
                        <option>Actor</option>
                        <select>
	        <div class="form-group">
	          <input id="keyword" name="search" type="text" class="form-control" placeholder="Search">
	        </div>
	        <button type="submit" class="btn btn-default">Submit</button>
	      </form>
	       </div>

      <ul class="nav navbar-nav navbar-right">
      <c:if test="${loggedInUser eq null}">  

        <li><a href="/Cinapex1/Movie">Available Movies</a></li>
        <li><a href="/Cinapex1/BestSellers">  <span class="glyphicon glyphicon-fire"></span> Best Sellers</a></li>
        <li><a href="/Cinapex1/Login">Login</a></li>
<li><a href="${pageContext.request.contextPath}/UserGuide.pdf"><span class = "glyphicon glyphicon-question-sign"></span></a></li>   
        </c:if>
        
        
 <c:if test="${personType eq 'Customer' }">       
        <li><a href="/Cinapex1/BestSellers">  <span class="glyphicon glyphicon-fire"></span> Best Sellers</a></li> 
                <li><a href="/Cinapex1/Movie">Available Movies</a></li>
         <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span>
                        <strong>${loggedInUser.firstName}</strong>
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="navbar-login">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <p class="text-center">
                                        <table>
                                        <tr>
                                        <th>
                                            <img src = "${pageContext.request.contextPath}/icon.png" class="icon-size"></span>
                                            </th>
                                        </p>
                                    </div>
                                    <div class="col-lg-8">
                                        <th><p class="text-left" style="padding-left: 15px;"><strong>${loggedInUser.firstName}</strong></p>
                                        <p class="text-left small" style="padding-left: 15px;">${loggedInUser.email}</p>
                                        <p class="text-left">
                                        </p>
                                        </th>
                                    </div>
                                    </tr>
                                    </table>
                                </div>
                            </div>
                        </li>
                        <li class="divider navbar-login-session-bg"></li>
                         <li><a href="/Cinapex1/Settings">Account Settings <span class="glyphicon glyphicon-cog pull-right"></span></a></li>
            <li class="divider"></li>
            <li><a href="/Cinapex1/Queue">Queue <span class="glyphicon glyphicon-stats pull-right"></span></a></li>
            <li class="divider"></li>
            <li><a href="/Cinapex1/History">History<span class="glyphicon glyphicon-book pull-right"></span></a></li>
            <li class="divider"></li>
            <li><a href="/Cinapex1/personalList">Your Personalized List <span class="glyphicon glyphicon-heart pull-right"></span></a></li>
            <li class="divider"></li>
            <li><a href="/Cinapex1/currentMovies">Current Movies Held <span class="glyphicon glyphicon-facetime-video pull-right"></span></a></li>
            <li class="divider"></li>
            <li><a href="/Cinapex1/History">Rate Your Movies <span class="glyphicon glyphicon-thumbs-up pull-right"></span></a></li>
            <li class="divider"></li>
            
            <li><a href="/Cinapex1/Logout">Logout<span class="glyphicon glyphicon-log-out pull-right"></span></a></li>
                    </ul>
                </li>
             <li><a href="${pageContext.request.contextPath}/UserGuide.pdf"><span class = "glyphicon glyphicon-question-sign"></span></a></li>   
                
      </c:if>  
      
   <c:if test="${(personType eq 'Employee')}">

     	<li><a href="/Cinapex1/BestSellers">  <span class="glyphicon glyphicon-fire"></span> Best Sellers</a></li>  
		<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Representatives<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/Cinapex1/AddCust">Add Customer</a></li>
            <li><a href="/Cinapex1/EditDelCust">Edit Customers</a></li>
            <li><a href="/Cinapex1/EditDelCust">Delete Customers</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="/Cinapex1/MailingList">Produce Customer Mailing List</a></li>
            <li><a href="/Cinapex1/MovieSugg">Produce a list of movie suggestions</a></li>
            <li><a href="/Cinapex1/RecordOrder">Record an Order</a></li>
            <li><a href="/Cinapex1/ViewEmployees">View Employees</a></li>
            <li><a href="/Cinapex1/Movie">View Available Movies</a></li>
             <li role="separator" class="divider"></li>
            <li><a href="/Cinapex1/Logout">       <span class="glyphicon glyphicon-log-out"></span> Logout</span></a></li>
          </ul>
        </li>
<li><a href="${pageContext.request.contextPath}/UserGuide.pdf"><span class = "glyphicon glyphicon-question-sign"></span></a></li>   
   </c:if>
   
   <c:if test="${(personType eq 'Manager')}">
     <li><a href="/Cinapex1/BestSellers">  <span class="glyphicon glyphicon-fire"></span> Best Sellers</a></li> 
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Manager<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/Cinapex1/AddEmp">Add Employees</a></li>
            <li><a href="/Cinapex1/EditDelEmp">Edit Employees</a></li>
            <li><a href="/Cinapex1/DeleteEmp">Delete Employees</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="/Cinapex1/AddMovie">Add Movies</a></li>
            <li><a href="/Cinapex1/EditDelMovie">Edit Movies</a></li>
            <li><a href="/Cinapex1/EditDelMovie">Delete Movies</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="/Cinapex1/ActivelyRentedMovies">List Active Movies</a></li>
            <li><a href="/Cinapex1/FindRentedMovies">List Rentals</a></li>
            <li><a href="/Cinapex1/SalesReport">Sales Report</a></li>
            <li><a href="/Cinapex1/AllMovies">All Movie Listings</a></li>
            <li><a href="/Cinapex1/Movie">All Available Movie Listings</a></li>
            <li><a href="/Cinapex1/Backup">Backup DataBase</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="/Cinapex1/Logout">       <span class="glyphicon glyphicon-log-out"></span> Logout</span></a></li>
          </ul>
        </li>
<li><a href="${pageContext.request.contextPath}/UserGuide.pdf"><span class = "glyphicon glyphicon-question-sign"></span></a></li>   
      </ul>
</c:if>
   
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>



<!-- Scripts -->	
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>    
</body>
</html>