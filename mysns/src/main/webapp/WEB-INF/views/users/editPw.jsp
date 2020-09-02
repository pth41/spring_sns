<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
    <meta name="apple-mobile-web-app-title" content="CodePen">
    <link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
    <link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    
    <!-- headers -->
    <link rel="stylesheet" href="/resources/css/profile.css">
    <script src="https://kit.fontawesome.com/e78c69c572.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Sriracha&display=swap" rel="stylesheet">
    <!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

	<!-- ajax_module -->
	<script src="/resources/js/user.js"></script>
    
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
         /* end-headers */
        
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:300);

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
              border-radius: 50%;
              height: 100px;
              width: 100px;
              border: 1px solid #efefef;
              margin: 1rem;
          }
        
        .alert {
        	display: none;
        }
    </style>
	
    <script>
		$(document).ready(function(){
			console.log(userService);
			
			$("input").filter("[value=null]").val(""); //input null 필터
			
			var container = $(".container");
			var inputUserno = container.find("input[name='user_no']");
			var inputPassword = container.find("input[name='password']");
			var inputPasswordNew = container.find("input[name='password_new']");
			var inputPasswordConfirm = container.find("input[name='password_confirm']");
			
			var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
			var csrfTokenValue = $("meta[name='_csrf']").attr("content");
			
			//Ajax spring security header...
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			});
			
			var userno = Number(inputUserno.val());
			
			var modifyBtn = $("#modifyBtn");
			
			modifyBtn.on("click", function(e) {
				
				var usernew = {
						user_no : userno,
						password : inputPasswordNew.val()
				};
				
				if(inputPasswordNew.val() == inputPasswordConfirm.val()){
					
					userService.updatePwd(usernew, function(result){
						alert("RESULT: " + result);
						location.reload();
					});
				}
				
			});
			
		});
    </script>
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
            <a href="/users/profile/<sec:authentication property="principal.user.email"/>"><i class="far fa-user i"></i></a>
    </div>
</header>
<div class="container">
	<hr>
	<hr>
	<hr>
    <h1>프로필 수정</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img id="pimg" src="/resources/image/image_02.jpg" class="avatar img-circle" alt="avatar">
          <h6>Upload a different photo...</h6>
          
          <input type="file" class="form-control">
        </div>
      </div>
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <i class="fa fa-coffee"></i>
          This is an <strong>.alert</strong>. Use this to show important messages to the user.
        </div>
        <h3>비밀번호 변경</h3>
        <input type="hidden" name="user_no" value='<sec:authentication property="principal.user.user_no"/>'>
        <form class="form-horizontal" role="form">
          <div class="form-group">
            <label class="col-md-3 control-label">이전 비밀번호:</label>
            <div class="col-md-8">
              <input class="form-control" type="password" name="password" value=''>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">새 비밀번호:</label>
            <div class="col-md-8">
              <input class="form-control" type="password" name="password_new" value=''>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">새 비밀번호 확인:</label>
            <div class="col-md-8">
              <input class="form-control" type="password" name="password_confirm" value=''>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input id="modifyBtn" type="button" class="btn btn-primary" value="수정">
              <span></span>
              <input type="reset" class="btn btn-default" value="취소">
            </div>
          </div>
        </form>
      </div>
  </div>
</div>
<hr>
</html>