<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>signup</title>
    <link rel="stylesheet" href="/resources/css/signup.css">
    <link href="https://fonts.googleapis.com/css2?family=Sriracha&display=swap" rel="stylesheet">
</head>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<!-- ajax_module -->
<script src="/resources/js/user.js"></script>

<script>
	function check() {
		var formObj = document.getElementById("regForm");
		var email = formObj.email.value;
		var name = formObj.name.value;
		var username = formObj.username.value;
		var password = formObj.password.value;
		
		if(!email || !name || !username || !password){
			alert('모든 필드를 입력하세요.');
			return false;
		}
		
		return true;
	}
	
	$(document).ready(function(){
		console.log(userService);
		
		var container = $(".container");
		var inputEmail = container.find("input[name='email']");
		var inputName = container.find("input[name='name']");
		var inputUsername = container.find("input[name='username']");
		var inputPassword = container.find("input[name='password']");
		
		var csrfHeaderName = container.find("input[name='csrfHeaderName']").val();
		var csrfTokenValue = container.find("input[name='csrfToken']").val();
		
		//Ajax spring security header...
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
		
		var registerBtn = $("#registerBtn");
		
		registerBtn.on("click", function(e) {
			if(check()){
				var user = {
						email : inputEmail.val(),
						name : inputName.val(),
						username : inputUsername.val(),
						password : inputPassword.val()
					};
				userService.add(user, function(result){
					alert("RESULT: " + result);
					
					location.replace('/authlogin')
				});
			}
		});
	});
</script>

<style>
	.logo{
		font-family: 'Sriracha', cursive;
	}
</style>

<body>
    <main>
        <div class="page">
            <div class="header">
                <h1 class="logo">Pthgram</h1>
                <p>친구들의 사진과 동영상을 보려면 가입하세요.</p>
                <button><i class="fab fa-facebook-square"></i> Facebook으로 로그인</button>
                <div>
                    <hr>
                    <p>or</p>
                    <hr>
                </div>
            </div>
            <div class="container">
                <form id="regForm" action="">
                    <input type="text" name="email" placeholder="이메일 주소">
                    <input type="text" name="name" placeholder="성명">
                    <input type="text" name="username" placeholder="사용자 이름">
                    <input type="password" name="password" placeholder="비밀번호">
                    <button id="registerBtn" type="button">가입</button>
                    <input type="hidden" name="csrfHeaderName" value='${_csrf.headerName}'>
      				<input type="hidden" name="csrfToken" value='${_csrf.token}'>
                </form>

                <ul>
                    <li>가입하면 PTHGRAM의</li>
                    <li><a href="">약관,</a></li>
                    <li><a href="">데이터 정책</a></li>
                    <li>및</li>
                    <li><a href="">쿠키 정책</a> .</li>
                </ul>
            </div>
        </div>
        <div class="option">
            <p>계정이 있으신가요? <a href="/authlogin">로그인</a></p>
        </div>
        <div class="otherapps">
           <!--  <p>Get the app.</p>
            <button type="button"><i class="fab fa-apple"></i> App Store</button>
            <button type="button"><i class="fab fa-google-play"></i> Google Play</button> -->
        </div>
        <div class="footer">
            <ul>
                <li><a href="">ABOUT</a></li>
                <li><a href="">HELP</a></li>
                <li><a href="">PRESS</a></li>
                <li><a href="">API</a></li>
                <li><a href="">JOBS</a></li>
                <li><a href="">PRIVACY</a></li>
                <li><a href="">TEMS</a></li>
                <li><a href="">LOCATIONS</a></li>
                <li><a href="">TOP ACCOUNTS</a></li>
                <li><a href="">HASHTAGS</a></li>
                <li><a href="">LANGUAGE</a></li>
            </ul>
            <p>© 2020 PTHGRAM</p>
        </div>
    </main>
</body>

</html>
