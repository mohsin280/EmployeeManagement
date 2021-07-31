<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">


<!-- <link rel="stylesheet" href="style1.css"> -->
<title>Employee Details page</title>
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
                <p>Welcome ${user }! <a href=""><img class="logouticon" src="wrong.png" alt="" title="logout" ></a></p>
            </div>
        </div>
    </div>
    <div class="container content">
        <p class="heading p-1">Add Employee Details</p>
        
    	<form action="add_emp" autocomplete="on" method="post">
        <div class="row">
            <div class="col-sm-6 text-right p-3">
                <label for="code">Employee Code:</label>
            </div>
            <div class="col-sm-6 text-left p-3">
                <input type="number" id="quantity" name="empCode" maxlength="500">
            </div>

            <div class="col-sm-6 text-right p-3">
                <label for="name">Employee name:</label>
            </div>
            <div class="col-sm-6 text-left p-3">
                <input type="text" id="name" name="empName" maxlength="100">
            </div>

            <div class="col-sm-6 text-right p-3">
                <label for="location">Location:</label>
            </div>
            <div class="col-sm-6 text-left p-3">
                <input type="text" id="location" name="empLocation" maxlength="500">
            </div>

            <div class="col-sm-6 text-right p-3">
                <label for="email"/>Email:</label>
            </div>
            <div class="col-sm-6 text-left p-3">
                <input type="text" id="email" name="empEmail" maxlength="100">
            </div>

            <div class="col-sm-6 text-right p-3">
                <label for="birthday">Date-Of-Birth:</label>
            </div>
            <div class="col-sm-6 text-left p-3">
                <input type="date" id="birthday" name="empDob">
            </div>

            <div class="col-sm-6 text-right p-3">
                <input type="submit" value="Save">
    
            </div>
            <div class="col-sm-6 text-left p-3">
                <input type="submit" value="Cancel">
            </div>
        </div>
  

    </form>
    </div>    
    <div class="fixed-footer mt-5">
        <div class="container">Copyright &copy; Nagarro Pvt. Limited</div>        
    </div>
</body>
</html>