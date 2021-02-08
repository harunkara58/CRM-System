<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("login")!=null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("loginPage.jsp");
}
%>

<!-- Veri Tabanı Bağlantısı-->
<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/registerdb?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&characterEncoding=UTF-8","root","Harunk.1"); //create connection
	  request.setCharacterEncoding("UTF-8");
	if(request.getParameter("btn_register")!=null) 
	{      
		String idadmin,adminIsim,adminSoyisim,adminSifre,adminKadi;
                idadmin=request.getParameter("idadmin"); 
                adminIsim=request.getParameter("adminIsim"); 
		adminSoyisim=request.getParameter("adminSoyisim"); 
		adminSifre=request.getParameter("adminSifre"); 
		adminKadi=request.getParameter("adminKadi");
		PreparedStatement pstmt=null; 
		
		pstmt=con.prepareStatement("INSERT INTO adminregister(idadmin, adminIsim, adminSoyisim, adminKadi, adminSifre) values(?, ?, ?, ?, ?)"); 
		pstmt.setString(1,idadmin);
                pstmt.setString(2,adminIsim);
		pstmt.setString(3,adminSoyisim);
                pstmt.setString(4,adminKadi);
		pstmt.setString(5,adminSifre);
		
		pstmt.executeUpdate(); 
		
		request.setAttribute("successMsg","Kayıt Olundu ...! Lütfen giriş yapınız"); 

		con.close(); 
	}
}
catch(Exception e)
{
	out.println(e);
}
%> 

<!DOCTYPE html>
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<title>Kayıt Ol</title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			var adminIsim= /^[a-z A-Z]+$/;
			var adminSoyisim= /^[a-z A-Z]+$/;
                        var adminKadi= /^[a-z A-Z]+$/; 
			var adminSifre=/^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/;
			
			var adminIsim = document.getElementById("adminIsim"); 
            var adminSoyisim = document.getElementById("adminSoyisim"); 
            var adminSifre = document.getElementById("adminSifre");
            var adminKadi = document.getElementById("adminKadi");
			
			if(!adminIsim.test(adminIsim.value) || adminIsim.value=='') 
            {
				alert("Yalnızca Ad Alfabesini Girin....!");
                fname.focus();
                fname.style.background = '#f08080';
                return false;                    
            }
			if(!adminSoyisim.test(adminSoyisim.value) || adminSoyisim.value=='') 
            {
				alert("Yalnızca Ad Alfabesini Girin....!");
                lname.focus();
                lname.style.background = '#f08080';
                return false;                    
            }
			if(!adminSifre.test(adminSifre.value) || adminSifre.value=='') 
            {
				alert("Şifre 6 ila 12 arasında olmalı ve izin verilebilir! @ # $% & * () <> Karakter");
                password.focus();
                password.style.background = '#f08080';
                return false;                    
            }
            if(!adminKadi.test(adminKadi.value) || adminKadi.value=='') 
            {
				alert("Geçerli Kullanıcı Adı Girin....!");
                sirket.focus();
                sirket.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>	

</head>

<body>

   

    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Admin Kayıt</h1>
                    </div>
				   
					<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
					</p>
				   
				   </br>
				   
                    <div class="form-row">
                        <label>
                            <span>İsim</span>
                            <input type="text" name="adminIsim" id="fname" placeholder="İsim Giriniz...">
                        </label>
                    </div>
					<div class="form-row">
                        <label>
                            <span>Soyisim</span>
                            <input type="text" name="adminSoyisim" id="lname" placeholder="Soyisim Giriniz...">
                        </label>
                    </div>
                                   <div class="form-row">
                        <label>
                            <span>Kullanıcı Adı</span>
                            <input type="text" name="adminKadi" id="kAdi" placeholder="Kullanıcı Adı Giriniz...">
                        </label>
                    </div>


                    <div class="form-row">
                        <label>
                            <span>Şifre</span>
                            <input type="password" name="adminSifre" id="password" placeholder="Şifre Giriniz...">
                        </label>
                    </div>

					<input type="submit" name="btn_register" value="Kayıt ol">
					
                </div>
				
                <a href="adminLogin.jsp" class="form-log-in-with-existing"><b> Oturum açın... </b></a>

            </div>

        </form>

    </div>

</body>

</html>
