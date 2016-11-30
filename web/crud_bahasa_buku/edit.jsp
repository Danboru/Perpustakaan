<%-- 
    Document   : edit
    Created on : Nov 25, 2016, 3:21:15 PM
    Author     : Iqbal
    Correct by : Danboru
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style>
  body{
    background-image: url("assets/perpus.jpg");

  }

  

  #background{
    background-image: url("assets/perpus.jpg");
    background-size: 100% 100%;
  }

    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 800px}

    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #ffbf80;
      height: 100%;
    }
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;}
    }
  </style>
</head>
<body>

  <div  class="container-fluid">
    <div class="row content">
      <div class="col-md-3 sidenav">
        <h4>perpustakaan</h4>
        <ul class="nav nav-pills nav-stacked">
          <li class="active"><a href="${pageContext.request.contextPath}/index/indexlog.jsp">Home</a></li>
          <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Anggota
            <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="">Cari anggota</a></li>
              <li><a href="">Peminjaman</a></li>

            </ul>
            </li>

  <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#" >Buku
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${pageContext.request.contextPath}/pengarang/pengarang.jsp">Pengarang</a></li>
            <li><a href="${pageContext.request.contextPath}/crud_bahasa_buku/bahasa_buku.jsp">Bahasa Buku</a></li>
            <li><a href="${pageContext.request.contextPath}/penerbit/penerbit.jsp">Penerbit</a></li>
            <li><a href="${pageContext.request.contextPath}/jenis_buku/jenis_buku.jsp">Jenis Buku</a></li>
          </ul>
        </li>
          <li><a href="#">Petugas</a></li>

<%
        if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
        %>
            Login dulu,biar afdol<br/>
           <% response.sendRedirect("index.jsp");%>
        <%} else {
        %>
        <br>
            Welcome <%=session.getAttribute("userid")%>
            <li><a href="../logout/logout.jsp"><span class="glyphicon glyphicon-log-out"> Logout</span></a></li>
      </ul><br>
        <%
        }
        %>
       
         
        

    </div>

      <div  class="col-sm-9">
      <div style='height:30px;'></div>
<div id="con2">
            <h3 align="center">Update Data</h3><p></p>
            <form action="editaksi.jsp" method="post">
                 <%
                try {
                    String Host = "jdbc:mysql://localhost:3306/perpustakaan";
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(Host, "root", "");
                    statement = connection.createStatement();
                    String u=request.getParameter("u");
                    int num=Integer.parseInt(u);
                    String Data = "select * from bahasa_buku where id_bahasa_buku='"+num+"'";
                    rs = statement.executeQuery(Data);
                    while (rs.next()) {
                %>   
                <p>
                    <label></label><input type="hidden" name="id_bahasa_buku" value='<%=rs.getString("id_bahasa_buku")%>'/>
                </p>
                <p>
                    <label>Nama</label><input type="text" name="bahasa_buku" value='<%=rs.getString("bahasa_buku")%>'/>
                </p>
                
                <p>
                    <label></label><input type="submit" name="submit" value="Update"/>
                    <a href="bahasa_buku.jsp">Kembali</a>
                </p>
                <%   }
                    rs.close();
                    statement.close();
                    connection.close();
                } catch (Exception ex) {
                    out.println("Can't connect to database.");
                }
                %>
            </form>
        </div>
    



    </div>
  </div>
</div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

</body>
</html>
