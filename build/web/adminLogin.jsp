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

        <form class="form-register" method="post" action="adminLoginControl.jsp" >

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Admin Giriş</h1>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>Kullanıcı Adı</span>
                            <input type="text" name="adminKadi" id="mail" placeholder="Kullanıcı Adı Giriniz...">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Şifre</span>
                            <input type="password" name="adminSifre" id="sifre" placeholder="Şifre Giriniz...">
                        </label>
                    </div>

                                  <input type="submit"  value="Giriş Yap">
                    
                </div>

				<a href="adminRegister.jsp" class="form-log-in-with-existing">Hesabın yok mu? <b> Kayıt Olun... </b></a>

            </div>

        </form>

    </div>

</body>

</html>
