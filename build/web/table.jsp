<%-- 
    Document   : table
    Created on : 3 Oca 2021, 13:11:59
    Author     : Admin
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "registerdb";
String userid = "root";
String password = "Harunk.1";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Müşteri İlişkileri Yönetim Sistemi</title>
	<!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Roboto&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Roboto&display=swap" rel="stylesheet">
<script type="text/javascript">
function onayla(){
    alert('Ürün Onaylandı');
}
function onaylama(){
    alert('Ürün Onaylanmadı');
}
function revizyonIste(){
    alert('Revizyon İstendi');
}
</script>
</head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Gezinmeyi değiştir</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp"><i class="fa fa-comments"></i> <strong>AnadoluCRM </strong></a>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">

                        <li class="divider"></li>
                        <li>
                        </li>
                        <li class="divider"></li>
                        <li>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Tüm Mesajları Oku</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Kullanıcı Profili</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Ayarlar</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="loginPage.jsp"><i class="fa fa-sign-out fa-fw"></i> Çıkış Yap</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!--/. NAV TOP  -->
        
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                   
                   
                    <li>
                        <a class="active-menu"  href="table.jsp"><i class="fa fa-table"></i>Teklifler</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Müşteriler
                        </h1>
                    </div>
                </div> 
                 <!-- /. ROW  -->
               <div class="row">
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Müşteriler</h4>
						<div class="easypiechart" id="easypiechart-blue" data-percent="82" ><span class="percent">82%</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Satışlar</h4>
						<div class="easypiechart" id="easypiechart-orange" data-percent="55" ><span class="percent">55%</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Karlar</h4>
						<div class="easypiechart" id="easypiechart-teal" data-percent="84" ><span class="percent">84%</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Ziyaret Sayısı</h4>
						<div class="easypiechart" id="easypiechart-red" data-percent="46" ><span class="percent">46%</span>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->		
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Kullanıcılar
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                             <th>id</th>
                                            <th>sirket</th>
                                            <th>isim</th>
                                            <th>soyisim</th>
                                            <th>mail</th>
                                            <th>Sil</th>
                                            <th>Düzenle</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/registerdb?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&characterEncoding=UTF-8","root","Harunk.1");
statement=connection.createStatement();
String sql ="select * from registertable";
resultSet = statement.executeQuery(sql);
int i =0;
while(resultSet.next()){
%>  
                                        <tr>
                                            <td><%=resultSet.getString("id") %></td>                
                                            <td><%=resultSet.getString("sirket") %></td>
                                            <td><%=resultSet.getString("isim") %></td>
                                            <td><%=resultSet.getString("soyisim") %></td>
                                            <td><%=resultSet.getString("mail") %></td>
                                            <td><a href="delete.jsp?id=<%=resultSet.getString("id") %>"><button type="button" class="delete">SİL</button></a></td>
                                            <td><a href="update.jsp?id=<%=resultSet.getString("id")%>"><button type="button" class="delete">DÜZENLE</button></a></td>
                                        </tr>
                                        <%
  i++;                                       
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
                                    
            </div>
 <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Teklifler Paneli
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                         
                                            <th>Ürün Adı</th>
                                            <th>Ürünün Fiyatı</th>
                                            <th>Ürünün Adedi</th>
                                            <th>Onayla</th>
                                            <th>Onaylama</th>
                                            <th>Revizyon İste</th
                                        </tr>
                                    </thead>
                                    <tbody>
                                 <%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/registerdb?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&characterEncoding=UTF-8","root","Harunk.1");
statement=connection.createStatement();
String sql ="select * from tekliftable";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>  
                                        <tr>
                                                     
                                            <td><%=resultSet.getString("urunAdi") %></td>
                                            <td><%=resultSet.getString("urunFiyat") %></td>
                                            <td><%=resultSet.getString("urunAdedi") %></td>
                                            <td><a href="#"><button type="button" class="delete" onclick="onayla();">ONAYLA</button></a></td>
                                            <td><a href="#"><button type="button" class="delete" onclick="onaylama();">ONAYLAMA</button></a></td>
                                            <td><a href="#"><button type="button" class="delete" onclick="revizyonIste();">REVİZYON İSTE</button></a></td>
                                        </tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
                                    
            </div>
               
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
   
    <!-- Morris Chart Js -->
    <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
	
	<script src="assets/js/easypiechart.js"></script>
	<script src="assets/js/easypiechart-data.js"></script>
	
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
   
</body>
</html>

