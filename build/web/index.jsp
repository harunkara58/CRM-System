<%-- 
    Document   : index
    Created on : 3 Oca 2021, 13:02:42
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Müşteri İlişkileri Yönetim Sistemi </title>
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
    <title>JSP Page</title>
</head>
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
                <a class="navbar-brand" href="index.jsp"><i class="fa fa-comments"></i> <strong>Anadolu CRM</strong></a>
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
                <!-- /.dropdown -->
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
                        <li><a  href="loginPage.jsp"><i class="fa fa-sign-out fa-fw"></i> Çıkış Yap</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
		<div id="sideNav" href=""><i class="fa fa-caret-right"></i></div>
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu" href="index.jsp"><i class="fa fa-dashboard"></i>Teklif Verme Paneli</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">


                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Teklif Verme Paneli
                        </h1>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-green green">
                            <div class="panel-left pull-left green">
                                <i class="fa fa-bar-chart-o fa-5x"></i>
                                
                            </div>
                            <div class="panel-right pull-right">
								<h3>-</h3>
                               <strong> Günlük Ziyaretler</strong>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-blue blue">
                              <div class="panel-left pull-left blue">
                                <i class="fa fa-shopping-cart fa-5x"></i>
								</div>
                                
                            <div class="panel-right pull-right">
							<h3>-</h3>
                               <strong> Satış</strong>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-red red">
                            <div class="panel-left pull-left red">
                                <i class="fa fa fa-comments fa-5x"></i>
                               
                            </div>
                            <div class="panel-right pull-right">
							 <h3>-</h3>
                               <strong> Yorumlar </strong>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-brown brown">
                            <div class="panel-left pull-left brown">
                                <i class="fa fa-users fa-5x"></i>
                                
                            </div>
                            <div class="panel-right pull-right">
							<h3>-</h3>
                             <strong>Ziyaret Sayısı</strong>

                            </div>
                        </div>
                    </div>
                </div>
				
                <div class="row">
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                               
                                Görevler Paneli
                            </div>
                            <div class="panel-body">
                                <div class="list-group">

                                    <a href="#" class="list-group-item">
                                        <span class="badge"> </span>
                                        <i class="fas fa-check-circle fa-2x" style="color:green;"></i>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge"> </span>
                                        <i class="fas fa-times fa-2x" style="color:red;"></i> 
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge"> </span>
                                        <i class="fas fa-exclamation-circle fa-2x" style="color:yellow;"></i>  
                                    </a>
                                   
                                </div>
                                <div class="text-right">
                                    <a href="#">Daha Fazla <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-8 col-sm-12 col-xs-12">
           
                    <h4>Teklif Verme Paneli</h4>
                                    <form role="form" action="teklifverControl.jsp">
                                          <%              
try{
 String mail =(String) session.getAttribute("mail");
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/registerdb?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&characterEncoding=UTF-8", "root", "Harunk.1");
statement=connection.createStatement();
ResultSet rs;
Statement st =connection.createStatement();
    rs = st.executeQuery("select * from registertable where mail='" + mail + "'");
    if (rs.next()){
%>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon">@</span>
                                            <input type="text"  name="mail" class="form-control"  placeholder="Mail" value="<%=rs.getString("mail") %>"/>
                                        </div>
                                        <%
}
connection.close();
} catch (Exception e) {
System.out.println(e.getMessage());
}
%>
                                         <div class="form-group input-group">
                                             <span class="input-group-addon"></span>
                                            <input type="text"  name="urunAdi" class="form-control" placeholder="Ürün Adı">
                                        </div>
                                        <div class="form-group input-group">
                                            <input type="text"  name="urunAdedi" class="form-control"placeholder="Ürün Adedi">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                        <div class="form-group input-group">
                                            
                                             <span class="input-group-addon">₺</span>
                                            <input type="text" name="urunFiyat" class="form-control" placeholder="Ürün Fiyatı">
                                            <span class="input-group-addon">.00</span>
                                           
                                        </div>
                                       
                                        <div class="form-group input-group">
                                            
                                               <input class="btn btn-default" type="submit" value="Teklif Ver"  onclick="onay()">
                                            </span>
                                        </div>
                                    </form>
                       

                    </div>
                    
                </div>
                <!-- /. ROW  -->
			
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
	 
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
	
	
	<script src="assets/js/easypiechart.js"></script>
	<script src="assets/js/easypiechart-data.js"></script>
	
	
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
<script>
function onay() {
    

alert("Teklif Verildi");
}


</script>

</body>
</html>
