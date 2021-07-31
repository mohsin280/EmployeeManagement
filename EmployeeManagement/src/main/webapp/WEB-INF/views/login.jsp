<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bus login page</title>
    <style>
        body {
            background-image: url("https://cdn-images-1.medium.com/max/2600/1*B0gvqiYAjCNN9DXPK88poQ.jpeg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            }

        * {
            font-size: large;
        }

        #fm {
            background-color: rgb(228, 230, 230);
            padding: 20px;
            border-radius: 6px;
            display: inline-block;
            width: 33%;
            position: absolute;
            top: 50%;
            left: 50%;
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);

        }

        input,
        select {
            display: block;
            margin: 8px auto;
            padding: 12px 20px;
            border-radius: 6px;
            border: 1px solid rgb(82, 81, 81);
            width: 100%;
            box-sizing: border-box;
        }

        input[type=submit] {
            display: block;
            margin: 15px auto;
            padding: 12px 20px;
            border-radius: 6px;
            background-color: #000033;
            width: 100%;
            cursor: pointer;
            color: white;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }
        #para{
            text-align: center;
        }
        p{
            display: inline-block;
            color: gray;
            margin: 0%;
            padding: 0%;  
        }
/*        .adminLogin{

   position:fixed;
   right:10px;
   top:5px;
        }*/
        hr.dashed {
  border-top: 3px dashed #bbb;
}
    </style>
</head>

<body>
    <marquee style="color:rgb(255, 255, 255); font-size: 60px;">${headers }</marquee>
<!--    <form align="right" name="form2" method="post" action="adminLogin.jsp">
            <label class="adminLogin">
                <input name="submit2" type="submit" id="submit2" value="Admin login">
            </label>
        </form>-->
    <div id="fm">
        
        <form action="validate" onsubmit="return validation()" method="POST">
            <div style="font-size: 30px;">login form</div>
            <hr class="solid">
            <label for="un">Username</label>
            <input type="text" id="un" name="username" placeholder="Your name">
            <label for="password">Password</label>
            <input type="password" name="password" id="pw" placeholder="Your password">
            <input type="submit" value="Login">
        </form>
        <div id="para">
            <p>Not registered? <a style="text-decoration: none;" href="sign_up" target="iframe_a">Create an account</a></p>
        </div>
    </div>


</body>

</html>
<script>
    function validation() {
        var u_name = document.forms["login_bus"]["username"].value;
        var u_pas = document.forms["login_bus"]["password"].value;
        
        if (u_name == "") {
            alert("please enter a username");
            return false;
        }
        else if (u_pas == "") {
            alert("please enter a password");
            return false;
        }
        return true;
    }
</script>
