<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>profile</title>

    <link rel="stylesheet" href="/resources/css/profile.css">
</head>
	<script src="https://kit.fontawesome.com/e78c69c572.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Sriracha&display=swap" rel="stylesheet">
    
    <!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

	<!-- ajax_module -->
	<script src="/resources/js/user.js"></script>
	
	<script>
		$(document).ready(function(){
			console.log(userService);
			
			$("input").filter("[value=null]").val(""); //input null 필터
			
			var container = $(".right");
			var inputEmail = container.find("input[name='email']");	//로그인 이메일

			var pathArray = window.location.pathname.split('/');
			
			var email = pathArray[3];	//프로필 이메일
			
			window.onload = function(){
				userService.getByEmail(email, function(user){
					$("#username").html(user.username);
					$("#name").html(user.name);
				});
				
				if(inputEmail.val() == email){
					$(".edit").show();
					$(".bio__follow").hide();
				}else{
					$(".edit").hide();
					$(".bio__follow").show();
				}
			};
		});
	</script>
    
    <style>
        /* headers */
    	 #insta_icon{
              padding-right: 1rem;
              border-right: 1px solid black;
              font-size: 22px;
         }
          
         #pthgram{
              display: inline-block;
              font-family: 'Sriracha', cursive;
              font-weight: bold;
              font-size: 22px;
         }
        
         .i{
              font-size: 1.5rem;
              margin: 1rem;
         }
          
         a:hover { 
          	text-decoration:none; 
         }
         
         .edit {
         	display: inline-block;
         	color: black;
         	background-color: white;
         	border-color: silver;
         	
         }
         /* end-headers */
    </style>
<header>
    <a href="/posts/main">
        <i id="insta_icon" class="fab fa-instagram"></i>
        &nbsp;
        <i id="pthgram">Pthgram</i>
    </a>
    <div class="search-outline">
        <i class="fa fa-search" style="color:grey;" aria-hidden="true"></i>
        <input class="search" type="text" autocapitalize="none" placeholder="Search" value="" size="25" />
    </div>
    <sec:authorize access="isAnonymous()">
    <button aria-label="login" onclick="location.href='/authlogin'">
    	로그인
    </button>
    <a class="signup" href="/users/signup9">가입</a>	
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
    <div class="right">
    	<a href="/posts/main"><i class="fas fa-home i"></i></a>
        <i class="far fa-compass i"></i>
        <i class="far fa-heart i"></i>
        <a href="/users/profile/<sec:authentication property="principal.user.email"/>"><i class="far fa-user i"></i></a>
        <input name="email" type="hidden" value="<sec:authentication property="principal.user.email"/>">
    </div>
    </sec:authorize>
</header>
<main>
    <section class="bio">
        <div class="bio__img-block">
            <a href=""><img class="bio__img" src="https://placekitten.com/150/150" alt="profile picture" /></a>
        </div>
        <div class="bio__header">
            <h1 class="bio__account" id="username"></h1>
            <!-- <span class="bio__verified"><i class="fa fa-check" aria-hidden="true"></i></span> -->
            &nbsp;&nbsp;
            <sec:authorize access="isAuthenticated()">
            <button class="edit" onclick="location.href='/users/edit'">프로필 수정</button>
            <button class="logout" ></button>
            <button class="bio__follow">팔로우</button>
            </sec:authorize>
            
        </div>
        <div class="bio__stats">
            <span class="bio__posts stats"><strong>5,097</strong> 포스트</span>
            <span class="bio_followers stats"><strong>165m</strong> 팔로워</span>
            <span class="bio__following stats"><strong>37</strong> 팔로잉</span>
        </div>
        <div class="bio_blurb">
            <h2 class="bio__name" id="name"></h2>
            <p class="bio__description">description</p>
        </div>
    </section>
    <nav class="story">
        <ul>
            <li>
                <a href="">
                    <img src="https://www.fillmurray.com/77/77" alt="story with bill murray">
                    <h2>KKW FRAGRANCE</h2>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="https://baconmockup.com/77/77" alt="story with slab of bacon">
                    <h2>SKIMS</h2>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="https://www.fillmurray.com/150/150" alt="story with random photo">
                    <h2>KKW BEAUTY</h2>
                </a>
            </li>
        </ul>
    </nav>
    <nav class="mobile-stats">
        <ul>
            <li class="mobile-stats__posts stats"><a href=""><strong>5,097</strong><br>posts</a></li>
            <li class="mobile-stats_followers stats"><a href=""><strong>165M</strong><br>followers</a></li>
            <li class="mobile-stats__following stats"><a href=""><strong>37</strong><br>following</a></li>
        </ul>
    </nav>
    <section class="tabbed-pane">
        <nav class="tabbed-pane__header">
            <ul>
                <li><a href="" class="tab-link selected"><i class="fa fa-table" aria-hidden="true"></i><span class="tab-link-text"> Posts</span></a></li>
                <li><a href="" class="tab-link"><i class="fa fa-television" aria-hidden="true"></i><span class="tab-link-text"> IGTV</span></a></li>
                <li><a href="" class="tab-link"><i class="fa fa-user" aria-hidden="true"></i><span class="tab-link-text"> Tagged</span></a></li>
            </ul>
        </nav>
        <div class="tabbed-pane__posts">
            <a href=""><img src="https://www.fillmurray.com/300/300" alt="bill murray post picture"></a>
            <a href=""><img src="https://baconmockup.com/300/300" alt="bacon post picture"></a>
            <a href=""><img src="https://www.fillmurray.com/400/400" alt="bill murray post picture"></a>
            <a href=""><img src="https://baconmockup.com/400/400" alt="bacon post picture"></a>
            <a href=""><img src="https://www.fillmurray.com/500/500" alt="bill murray post picture"></a>
            <a href=""><img src="https://baconmockup.com/800/800" alt="bacon post picture"></a>
            <a href=""><img src="https://www.fillmurray.com/600/600" alt="post picture"></a>
            <a href=""><img src="https://www.fillmurray.com/800/800" alt="bill murray post picture"></a>
        </div>
        <div class="tabbed-pane__igtv">

        </div>
        <div class="tabbed-pane__tagged">

        </div>
    </section>
</main>
<footer class="site-footer">
    <nav>
        <ul>
            <li>
                <a href="https://about.instagram.com/about-us" rel="nofollow noopener noreferrer" target="_blank">About</a>
            </li>
            <li>
                <a href="https://help.instagram.com/">Help</a>
            </li>
            <li>
                <a href="https://instagram-press.com/">Press</a>
            </li>
            <li><a href="/developer/">API</a></li>
            <li><a href="/about/jobs/">Jobs</a></li>
            <li>
                <a href="/legal/privacy/">Privacy</a>
            </li>
            <li>
                <a href="/legal/terms/">Terms</a>
            </li>
            <li>
                <a href="/explore/locations/">Locations</a>
            </li>
            <li>
                <a href="/directory/profiles/">Top Accounts</a>
            </li>
            <li>
                <a href="/directory/suggested/kimkardashian">Suggested Accounts</a>
            </li>
            <li>
                <a href="/directory/hashtags/">Hashtags</a>
            </li>
            <li>
                <span class="site-footer__language">Language<select aria-label="Switch Display Language">
                        <option value="af">Afrikaans</option>
                        <option value="cs">Čeština</option>
                        <option value="da">Dansk</option>
                        <option value="de">Deutsch</option>
                        <option value="el">Ελληνικά</option>
                        <option value="en">English</option>
                        <option value="es">Español (España)</option>
                        <option value="es-la">Español</option>
                        <option value="fi">Suomi</option>
                        <option value="fr">Français</option>
                        <option value="id">Bahasa Indonesia</option>
                        <option value="it">Italiano</option>
                        <option value="ja">日本語</option>
                        <option value="ko">한국어</option>
                        <option value="ms">Bahasa Melayu</option>
                        <option value="nb">Norsk</option>
                        <option value="nl">Nederlands</option>
                        <option value="pl">Polski</option>
                        <option value="pt-br">Português (Brasil)</option>
                        <option value="pt">Português (Portugal)</option>
                        <option value="ru">Русский</option>
                        <option value="sv">Svenska</option>
                        <option value="th">ภาษาไทย</option>
                        <option value="tl">Filipino</option>
                        <option value="tr">Türkçe</option>
                        <option value="zh-cn">中文(简体)</option>
                        <option value="zh-tw">中文(台灣)</option>
                        <option value="bn">বাংলা</option>
                        <option value="gu">ગુજરાતી</option>
                        <option value="hi">हिन्दी</option>
                        <option value="hr">Hrvatski</option>
                        <option value="hu">Magyar</option>
                        <option value="kn">ಕನ್ನಡ</option>
                        <option value="ml">മലയാളം</option>
                        <option value="mr">मराठी</option>
                        <option value="ne">नेपाली</option>
                        <option value="pa">ਪੰਜਾਬੀ</option>
                        <option value="si">සිංහල</option>
                        <option value="sk">Slovenčina</option>
                        <option value="ta">தமிழ்</option>
                        <option value="te">తెలుగు</option>
                        <option value="vi">Tiếng Việt</option>
                        <option value="zh-hk">中文(香港)</option>
                        <option value="bg">Български</option>
                        <option value="fr-ca">Français (Canada)</option>
                        <option value="ro">Română</option>
                        <option value="sr">Српски</option>
                        <option value="uk">Українська</option>
                    </select></span>
            </li>
        </ul>
    </nav>
    <span class="copyright">© 2020 Pthgram</span>
</footer></html>
