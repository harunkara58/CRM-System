<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Oturum Aç</title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
	
</head>

<body>

   

    <div class="main-content">

        <form class="form-register" method="post" action="loginControl.jsp" >

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Müşteri Giriş</h1>
                    </div>
					
				

                    <div class="form-row">
                        <label>
                            <span>E-Posta</span>
                            <input type="text" name="mail" id="mail" placeholder="E-posta adresinizi giriniz...">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Şifre</span>
                            <input type="password" name="sifre" id="sifre" placeholder="Şifrenizi giriniz...">
                        </label>
                    </div>

                                  <input type="submit" onclick="setMailCookie()"  value="Giriş Yap">
                </div>

				<a href="register.jsp" class="form-log-in-with-existing"><b>Müşteri Kayıt Ol... </b></a>
                                <br>
                                <br>
                                <br>
                                <a href="adminRegister.jsp" class="form-log-in-with-existing"><b> Admin Kayıt Ol... </b></a>
            </div>

        </form>

    </div>
<script>

function setMailCookie() { // Declare a function
  let mail = document.getElementById("mail").value;
  localStorage.setItem("mail", mail);
   document.cookie = mail;

}
 
</script>
</body>

</html>
