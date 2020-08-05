<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="/resources/css/authlogin.css">
    <link rel="shortcut icon" type="image/x-icon" href="./favicon.ico">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body>

    <div class="login">

        <h1>PTHgram</h1>
        <h3><c:out value="${error}"/></h3>
        <h3><c:out value="${logout}"/></h3>

        <form role="form" action="/login" method="POST">

            <input placeholder="전화번호, 사용자 이름 또는 이메일" type="text" name="username">
            <input placeholder="비밀번호" type="password" name="password">

            <input type="submit" value="로그인" /><br>
            
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>

        <div class="divider"><b>또는</b></div>

        <div class="fbwrapper">
            <div class="fb"><a href="https://facebook.com"><img src="https://i.imgur.com/exksovo.png"> Facebook으로 로그인</a></div>
        </div>

        <div class="forgotwrapper">
            <div class="forgot"><a href="https://instagram.com">비밀번호를 잊으셨나요?</a></div>
        </div>


    </div>


    <div class="infobox">

        <p>계정이 없으신가요? <a href="signup.html">가입하기</a></p>

    </div>

    <div class="apps">

        <p>Get the app.</p>
        <span><a href="https://apps.apple.com/app/instagram/id389801252?vt=lo"><img src="https://i.imgur.com/lREV6Qa.png" height="45px" width="153px"></a><a href="https://play.google.com/store/apps/details?id=com.instagram.android&referrer=utm_source%3Dinstagramweb%26utm_campaign%3DloginPage%26ig_mid%3DXRR9_gALAAHKOzMSO3MkAOZ0JJtC%26utm_content%3Dlo%26utm_medium%3Dbadge"><img src="https://i.imgur.com/DFQNKXK.png" height="45" width="151px"></a></span>

    </div>

    <div class="footer">
        <p>
            <a href="https://www.instagram.com/about/us/">ABOUT US</a>
            <a href="https://help.instagram.com/">SUPPORT</a>
            <a href="https://instagram-press.com/">PRESS</a>
            <a href="https://www.instagram.com/developer/">API</a>
            <a href="https://www.instagram.com/about/jobs/">JOBS</a>
            <a href="https://help.instagram.com/519522125107875">PRIVACY</a>
            <a href="https://help.instagram.com/581066165581870">TERMS</a>
            <a href="https://www.instagram.com/explore/locations/">DIRECTORY</a>
            <a href="https://www.instagram.com/directory/profiles/">PROFILES</a>
            <a href="https://www.instagram.com/directory/hashtags/">HASHTAGS</a>
            <a href="">LANGUAGE</a>
            <span>© 2020 INSTAGRAM</span>
        </p>
    </div>

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>





</body>

</html>
