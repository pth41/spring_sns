<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/profile.css">
    <script src="https://kit.fontawesome.com/e78c69c572.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Sriracha&display=swap" rel="stylesheet">
    <!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

	<!-- ajax_module -->
	<script src="/resources/js/post.js"></script>
	
	<script>
		$(document).ready(function(){
			console.log(postService);
			
			var pathArray = window.location.pathname.split('/');
			
			var pnstr = pathArray[3];
			var post_no = Number(pnstr);
			
			var container = $(".container");
			var inputUserno = container.find("input[name='user_no']");
			var inputEmail = container.find("input[name='email']");
			var inputContent = container.find("input[name='content']");
			
			var csrfHeaderName = container.find("input[name='csrfHeaderName']").val();
			var csrfTokenValue = container.find("input[name='csrfToken']").val();
			
			//Ajax spring security header...
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			});
			
			var userno = Number(inputUserno.val());
			
			window.onload = function(){
				postService.get(post_no, function(post){
					if(userno != post.user_no){
						history.go(-1);
					}else{
						inputContent.val(post.content);
					}
				});
			}

			$("#registerBtn").on("click", function(e) {
				if(!(inputContent.val())){
					alert('내용을 입력하세요.');
					return;
				}else{
					var post = {
							post_no : post_no,
							user_no : userno,
							email : inputEmail.val(),
							content : inputContent.val()
					};
					
					postService.update(post, function(result){
						alert("RESULT: " + result);
						
						location.href='/posts/main';
					});
				}
			});
			
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
          	text-decoration:none; 
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
              height: 300px;
              width: 300px;
              border: 1px solid #efefef;
              margin: 1rem;
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
    <hr>
    <hr>
    <hr>
    <h1>게시물 수정</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img id="pimg" src="/resources/image/image_02.jpg" class="avatar img" alt="avatar">
          <h6>Upload a photo...</h6>
          
          <input type="file" class="form-control">
        </div>
      </div>
      <input type="hidden" name="user_no" value='<sec:authentication property="principal.user.user_no"/>'>
      <input type="hidden" name="email" value='<sec:authentication property="principal.user.email"/>'>
      <input type="hidden" name="csrfHeaderName" value='${_csrf.headerName}'>
      <input type="hidden" name="csrfToken" value='${_csrf.token}'>
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <form class="form-horizontal" role="form">
          <div class="form-group">
            <label class="col-lg-3 control-label">내용 :</label>
            <div class="col-lg-8">
              <input name="content" class="form-control" placeholder="문구 입력..." type="text" value="">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="button" id="registerBtn" class="btn btn-primary" value="수정">
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