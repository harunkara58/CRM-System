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
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/registerdb?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&characterEncoding=UTF-8","root","Harunk.1"); //create connection
	  request.setCharacterEncoding("UTF-8");
	if(request.getParameter("btn_register")!=null) //check register button click event not null
	{      
		String isim,soyisim,mail,sifre,sirket;              		
                isim=request.getParameter("isim"); 
		soyisim=request.getParameter("soyisim"); 
		mail=request.getParameter("mail"); 
		sifre=request.getParameter("sifre"); 
		sirket=request.getParameter("sirket");
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("INSERT INTO registertable(sirket, isim, soyisim, mail, sifre) values(?, ?, ?, ?, ?)"); //sql insert query
		
                pstmt.setString(2,isim);
		pstmt.setString(3,soyisim);
		pstmt.setString(4,mail);
		pstmt.setString(5,sifre);
		pstmt.setString(1,sirket);
		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Kayıt Olundu ...! Lütfen giriş yapınız"); //register success messeage

		con.close(); //close connection
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
			var isim= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var soyisim= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
                        var sirket= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var mail= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation
			var sifre=/^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter 
			
			var isim = document.getElementById("isim"); //textbox id fname
            var soyisim = document.getElementById("soyisim"); //textbox id lname
            var mail = document.getElementById("mail"); //textbox id email
            var sifre = document.getElementById("sifre"); //textbox id password
            var kullaniciAdi = document.getElementById("sirket"); //textbox id kAdi
			
			if(!isim.test(isim.value) || isim.value=='') 
            {
				alert("Enter Firstname Alphabet Only....!");
                fname.focus();
                fname.style.background = '#f08080';
                return false;                    
            }
			if(!soyisim.test(soyisim.value) || soyisim.value=='') 
            {
				alert("Enter Lastname Alphabet Only....!");
                lname.focus();
                lname.style.background = '#f08080';
                return false;                    
            }
			if(!mail.test(mail.value) || mail.value=='') 
            {
				alert("Enter Valid Email....!");
                mail.focus();
                mail.style.background = '#f08080';
                return false;                    
            }
			if(!sifre.test(sifre.value) || sifre.value=='') 
            {
				alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
                password.focus();
                password.style.background = '#f08080';
                return false;                    
            }
            if(!sirket_valid.test(sirket.value) || sirket.value=='') 
            {
				alert("Enter Valid sirket....!");
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
                        <h1>Müşteri Kayıt</h1>
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
                            <span>Ad</span>
                            <input type="text" name="isim" id="fname" placeholder="Adınızı giriniz...">
                        </label>
                    </div>
					<div class="form-row">
                        <label>
                            <span>Soyad</span>
                            <input type="text" name="soyisim" id="lname" placeholder="Soyadınızı giriniz...">
                        </label>
                    </div>
                                   <div class="form-row">
                        <label>
                            <span>Şirket Adı</span>
                            <input type="text" name="sirket" id="kAdi" placeholder="Şirket adı giriniz...">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>E-Posta</span>
                            <input type="text" name="mail" id="email" placeholder="E-posta adresinizi giriniz...">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Şifre</span>
                            <input type="password" name="sifre" id="password" placeholder="Şifrenizi giriniz...">
                        </label>
                    </div>

					<input type="submit" name="btn_register" value="Kayıt ol">
					
                </div>
				
                <a href="loginPage.jsp" class="form-log-in-with-existing"> <b> Oturum açın... </b></a>

            </div>

        </form>

    </div>

</body>

</html>
