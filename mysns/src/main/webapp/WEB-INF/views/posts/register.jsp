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
			
			// 파일 업로드 관련
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; //5MB
			
			function checkExtension(fileName, fileSize){
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.")
					return false;
				}
				return true;
			}
			
			function showUploadResult(uploadResultArr){
				if(!uploadResultArr || uploadResultArr.length==0){ return; }
				
				var uploadUL = $(".uploadResult ul");
				var str="";
				
				$(uploadResultArr).each(function(i, obj){
					//image type
					if(obj.image){
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid +"_"+obj.fileName);
						str += "<li><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type'button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str += "</li>";
					}else{
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid +"_"+obj.fileName);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						str += "<li><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type'button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/resources/img/attach.png'></a>";
						str += "</div>";
						str += "</li>";
					}
				});
				
				uploadUL.append(str);
			}
			
			$("input[type='file']").change(function(e){
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				
				for(var i=0; i<files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url: '/uploadAjaxAction',
					processData: false,
					contentType: false, 
					data: formData,
					type: 'POST',
					dataType: 'json',
					success: function(result){
						console.log(result);
						showUploadResult(result); //업로드 결과 처리 함수
					}
				});
			});
			// -파일 처리 end
			
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

			$("#registerBtn").on("click", function(e) {
				if(!(inputContent.val())){
					alert('내용을 입력하세요.');
					return;
				}else{
					var post = {
							user_no : userno,
							email : inputEmail.val(),
							content : inputContent.val()
					};
					
					postService.add(post, function(result){
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
    <h1>새 게시물</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <!-- <img id="pimg" src="/resources/image/image_02.jpg" class="avatar img" alt="avatar"> -->
          <div class="uploadResult"></div>
          <h6>Upload a photo...</h6>
          
          <input type="file" name="uploadFile" class="form-control" multiple>
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
              <input type="button" id="registerBtn" class="btn btn-primary" value="등록">
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