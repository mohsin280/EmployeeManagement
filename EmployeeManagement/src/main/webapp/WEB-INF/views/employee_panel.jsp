<%@page import="com.nagarro.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<title>Employee Panel</title>

<style type="text/css">
body{        
    
}
.container{
    width: 80%;
    margin: 0 auto; /* Center the DIV horizontally */
}
.fixed-header, .fixed-footer{
    width: 100%;        
    background: lightblue;
    padding: 0;
    color: black;
}
.content{
    border: 1px solid skyblue;
}
.heading{
    position: absolute;
    transform: translateY(-17px);
    background-color: white;
}
.logouticon{
    width: 20px;
}
table,th,td{
    border: 1px solid black;
    border-collapse: collapse;
}
tr{
    height: 30px;
    font-weight: lighter;
}
thead{
    font-weight: bolder;
    font-size: 15px;
    text-align: center;
}
tbody{
    font-weight: lighter;
    font-size: 13px;
}
.fixed-header{
    top: 0;
  padding:40px;
}
.fixed-footer{
    bottom: 0;
}  
</style>
</head>
<body>
    <div class="fixed-header mt-0 mb-5 p-1">
        <div class="container">
            <h1></h1>
            <div class="text-right">
                <p>Welcome ${user }! <a href=""><img class="logouticon" src="wrong.png" alt="" title="logout"></a></p>
            </div>
        </div>
    </div>
    <div class="container content">
        <p class="heading p-1">Employee List</p>
        <div class="text-right p-3">
<!--             <button type="button"  class="btn btn-info">Upload Employee Details</button> -->
			<a href="emp_details" class="btn btn-info">Upload Employee Details</a>
            <button type="button" class="btn btn-success">Download Employee Details</button>
        </div>
        <% Employee[] employees = (Employee[])request.getAttribute("employees"); %>
    	<table style="width: 100%">
            <caption>table title and/or explanatory text</caption>
            <thead>
                <tr>
                    <th>Employee Code</th>
                    <th>Employee Name</th>
                    <th>Location</th>
                    <th>Email</th>
                    <th>Date of Birth</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%for(Employee emp : employees ){ %>
            
                <tr>
                    <th><%=emp.getEmpCode() %></th>
                    <th><%=emp.getEmpName() %></th>
                    <th><%=emp.getEmpLocation() %></th>
                    <th><%=emp.getEmpEmail() %></th>
                    <th><%=emp.getEmpDob() %></th>
                    <td><a href="empEdit/<%=emp.getEmpCode() %>">
							        <button type="button" class="btn">Edit</button></a></td>  
                </tr>
            
            <%} %>
            </tbody>
        </table>
    </div>    
    <div class="fixed-footer mt-5">
        <div class="container">Copyright &copy; Nagarro Pvt. Limited</div>        
    </div>
</body>
</html>