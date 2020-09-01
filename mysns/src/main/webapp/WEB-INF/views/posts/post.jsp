<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
    <meta name="apple-mobile-web-app-title" content="CodePen">
    <link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
    <link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/profile.css">
    <script src="https://kit.fontawesome.com/e78c69c572.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Sriracha&display=swap" rel="stylesheet">
    
    <!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

	<!-- ajax_module -->
	<script src="/resources/js/user.js"></script>
	<script src="/resources/js/post.js"></script>
	<script src="/resources/js/reply.js"></script>
	
	<script>
	function goProfile(unTag) {	//username 클릭시 profile 이동
  		var email = $(unTag).data("email");
		location.href="/users/profile/"+email;
	}
	
	$(document).ready(function(){
		var pathArray = window.location.pathname.split('/');
		
		var pnstr = pathArray[3];
		var post_no = Number(pnstr);
		
		window.onload = function(){
			postService.get(post_no, function(post){
				var user_no = Number(post.user_no);
				userService.get(user_no, function(user){
					var str = '<a class="un-s user_name" href="javascript:void(0)" onclick="goProfile(this);" data-email="'+user.email+'">'+user.email+'</a> '+post.content+'<br>';
					str += '<br><a class="time">'+postService.displayTime(post.regDate)+'</a>';
					var str2 = '<a class="un-s user_name" href="javascript:void(0)" onclick="goProfile(this);" data-email="'+user.email+'">'+user.email+'</a>';
					var time = postService.displayTime(post.regDate);
					
					$(".content").html(str);
					$(".times").html(time);
					$(".user_name").html(str2);
				});
			});
		};
		
		showList_Reply();
		
		function showList_Reply() {
			replyService.getList(post_no, function(list){
				console.log("list: " + list);
				
				let cmstr = "";
				if(list == null || list.length == 0) {
					$(".comment").html("");
					return;
				}
				
            	let un = "";
            	
				for(var i=0, len=list.length||0; i<len; i++){
					let user_no = Number(list[i].user_no);
                	let em = list[i].email;
                	let rc = list[i].reply_content;
                	
					cmstr += '<a class="un-s username-r'+i+'" href="javascript:void(0)" onclick="goProfile(this);" data-email="'+em+'">'+un+'</a> '+rc+'<br>';
					cmstr += '<a class="time">'+replyService.displayTime(list[i].regDate)+'</a><br><br>';
				
					let unDIV = ".username-r"+i;
                	userService.get(user_no, function(user){
						$(unDIV).html(user.username);
					});
				}
				
				$(".comment").html(cmstr);
				
			});
		}
	});
	</script>
	
    <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:300);
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
          	color: black; text-decoration: none;
         }
         
         a{
             color: black; text-decoration: none;
         }
         /* end-headers */

        .body {
        // custom fonts, etcetera can go here 
        }

        .jumbotron-flat {
          background-color: solid #4DB8FFF;
          height: 100%;
          border: 1px solid #4DB8FF;
          background: white;
          width: 100%;
        text-align: center;
        overflow: auto;
        }

        .paymentAmt {
            font-size: 80px; 
        }

        .centered {
            text-align: center;
        }

        .title {
         padding-top: 15px;   
        }
        
        #pimg{
              /*border-radius: 50%;*/
              height: 500px;
              width: 500px;
              border: 1px solid #efefef;
              margin: 1rem;
        }
        
        
        /* 메인 컨테이너 */
        
        .post_left {
            display: inline-block;
        }
        .post_right {
            display: inline-block;
            border: 1px solid #fafafa;
            background-color: white;
            margin-top: 1rem;
            margin-bottom: 1rem;
            width: 360px;
            height: 500px;
        }
        
        .cmi{
            font-size: 1.3rem;
            margin: 1rem;
        }
        
        .info{
              display: flex;
              justify-content: space-between;
        }
          
        .comment{
            margin: 0rem 1rem 1rem 1rem;
            border-bottom: 1px solid #efefef;
            padding-bottom: 1rem;
            width: 330px;
            height: 180px;
            overflow: auto;
        }
        
        .content{
        	height: 70px;
            margin: 0rem 1rem 1rem 1rem;
        }
        
        ::-webkit-scrollbar {
            display: none; /* Chrome, Safari, Opera*/
        }
          
        .comment_form div{
            padding-bottom: 0px;
            display: flex;
            flex-direction: row;
        }
          
        .comment_form div input{
            width: 550px;
            height: 30px;
            border: none;
            padding-left: 10px;
        }
        
        .profile_image{
            border-radius: 50%;
            height: 30px;
            width: 30px;
            border: 1px solid #efefef;
            margin: 1rem;
        }
        
        .user {
            display: flex;
            align-items: center;
        }
        
        .user_name, .un-s{
            font-weight: 600;
        }
        
        * {
          box-sizing: border-box;
        }

        body {
          font-family: Helvetica, Arial, sans-serif;
        }

        .post {
          display: flex;
          width: 80%;
          margin: 50px auto;
          box-shadow: 0 5px 15px 0 #777;
        }

        @media screen and (max-width: 1024px) {
          .post {
            width: 80%;
          }
        }

        @media screen and (max-width: 768px) {
          .post {
            flex-direction: column;
          }
        }
        
        .replyInput {
        	  width:80%;
        	  height:100%;
        	  border: none;
        	  outline: none;
        	  display: inline;
        	  box-sizing: border-box;
        }
        
        .replyBtn {
        	  width:20%;
        	  height:100%;
        	  border: none;
        	  outline: none;
        	  display: inline;
        	  margin-left: -10px;
        	  box-sizing: border-box;
        	  font-size: 0.8em;
        	  background-color: white;
        	  color: #042AaC;
        	  cursor: pointer;
        }
        
        .replyBtn:hover {
        	  font-weight: bolder;
        }
        
        .time{
          	  color: gray;
          	  font-size: 0.7rem;
          	  font-style: normal;
          	  font-weight: bold;
        }
        
        .times{
        	margin-left: 0.8rem;
        	margin-bottom: 1rem;
        }
    </style>
</head>
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
    <div class="right">
    		<a href="/posts/register"><i class="far fa-plus-square i"></i></a>
            <a href="/posts/main"><i class="fas fa-home i"></i></a>
            <i class="far fa-compass i"></i>
            <i class="far fa-heart i"></i>
            <a href='/users/profile/<sec:authentication property="principal.user.email"/>'><i class="far fa-user i"></i></a>
    </div>
</header>
<div class="container">
    <br>
  	<br>
	<div class="post">
        <div class="post_left">
            <img id="pimg" src="/resources/image/image_02.jpg" class="avatar img" alt="avatar">
        </div>
        <div class="post_right">
            <div class="user">
                <img class="profile_image" src="/resources/image/image_01.jpg" alt="404">
                <div class="user_name">username</div>
            </div>
            <hr>
            <div class="content">
            	  <a class="user_name">username</a> content<br>
            </div>
            <div class="comment">
                comment1<br>
                comment2<br>
            </div>
            <div class="info">
                <div class="info_left">
                    <i class="far fa-heart cmi"></i>
                    <i class="fas fa-upload cmi"></i>
                </div>
                <div class="info_right">
                    <i class="far fa-bookmark cmi"></i>
                </div>
            </div>
            <div class="time times">
            </div>
            <div class="comment_form">
                <div class="regform" >
                    <input class="replyInput" type="text" placeholder="댓글 입력..." value="">
                    <button class="replyBtn">게시</button>
                </div>
            </div>
        </div>
    </div>
</div>
<hr>
</html>