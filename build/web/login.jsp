<%-- 
    Document   : login
    Created on : Nov 25, 2016, 7:14:41 AM
    Author     : Iqbal
    Correct by : Danboru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
 *{margin:auto;padding:0;}
 body{font-family:helvetica;background:#000;}
 #con{background:#fff;width:350px;padding:30px;margin-top:200px;border-radius:20px;border:1 solid #eee;box-shadow:2px 6px 10px #ccc;}
 h2{text-align:center;margin-bottom:15px;}
 p{margin-bottom:10px;}
 label{display:inline-block;width:100px;}
 input[type=submit]{border:none;color:#fff;background:linear-gradient(top, #333 0%, #777 100%);background:-moz-linear-gradient(top, #333 0%, #777 100%);background:-webkit-linear-gradient(top, #333 0%, #777 100%);height:30px;width:100px;border-radius:5px;}
 input[type=submit]:active{background:linear-gradient(top, #888 0%, #bbb 100%);background:-moz-linear-gradient(top, #888 0%, #bbb 100%);background:-webkit-linear-gradient(top, #888 0%, #bbb 100%);}
        </style>
    </head>
    <body>
        <div id="con">
 <h2>Login Area</h2>
 <form action="loginaksi.jsp" method="post">
 <p>
  <label>Username</label>
  <input type="text" name="username"/>
 </p>
 <p>
  <label>Password</label>
  <input type="password" name="password"/>
 </p>
 <p>
  <label></label>
  <input type="submit" name="submit" Value="Masuk"/>
                
 </p>
 </form>
        </div>
    </body>
</html>