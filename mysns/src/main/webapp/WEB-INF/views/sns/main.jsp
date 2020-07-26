<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <script src="https://kit.fontawesome.com/e78c69c572.js" crossorigin="anonymous"></script>
      <link href="https://fonts.googleapis.com/css2?family=Sriracha&display=swap" rel="stylesheet">
      <style>
          i{
              font-size: 1.5rem;
              margin: 1rem;
          }
          
          .main{
              background-color: #efefef;
              display: flex;
              flex-direction: row;
              justify-content: center;
              border-top: 1px solid #4a4a4a;
              height: 100vh;
              width: 100vw;
              padding-top: 65px;
          }
          
          .card{
              border: 1px solid #fafafa;
              background-color: white;
              margin-top: 1rem;
              margin-bottom: 1rem;
              width: 500px;
          }
          
          body{
              margin: 0;
          }
          
          .right_user, .user{
              display: flex;
              align-items: center;
          }
          
          .profile_image{
              border-radius: 50%;
              height: 30px;
              width: 30px;
              border: 1px solid #efefef;
              margin: 1rem;
          }
          
          .right_profile_image{
              border-radius: 50%;
              height: 60px;
              width: 60px;
              border: 1px solid #efefef;
              margin: 1rem;
          }
          
          #recommend{
              color: gray;
              font-weight: 600;
          }
          
          .user_name{
              font-weight: 600;
          }
          
          .info i{
              font-size: 1.5rem;
          }
          
          .main_left{
              margin: 1rem;
              overflow: auto;
          }
          
          .main_right #fixed_nav{
              margin: 1rem;
              position: fixed;
              z-index: 1;
          }
          
          .info{
              display: flex;
              justify-content: space-between;
          }
          
          .comment{
              margin: 0rem 1rem 1rem 1rem;
              border-bottom: 1px solid #efefef;
              padding-bottom: 1rem;
          }
          
          .comment_form form{
              padding-bottom: 0px;
              display: flex;
              flex-direction: row;
          }
          
          .comment_form form input{
              width: 550px;
              height: 30px;
              border: none;
              padding-left: 10px;
          }
          
          .comment_form form #sumbit{
              border: none;
              background-color: white;
          }
          
          ::-webkit-scrollbar {
              display: none; /* Chrome, Safari, Opera*/
          }
      </style>
  </head>

  <body>
      <%@include file="../includes/header_nav.jsp" %>
      <div class="main">
          <div class="main_left">
              <section class="card_section">
                  <div class="card">
                      <header class="user">
                          <img class="profile_image" src="image/image_01.jpg" alt="404">
                          <div class="user_name">username</div>
                      </header>
                      <div class="card_image">
                          <img src="image/image_02.jpg" alt="404">
                      </div>
                      <div class="info">
                          <div class="info_left">
                              <i class="far fa-heart"></i>
                              <i class="far fa-comment"></i>
                              <i class="fas fa-upload"></i>
                          </div>
                          <div class="info_right">
                              <i class="far fa-bookmark"></i>
                          </div>
                      </div>
                      <div class="comment">
                          comment1<br>
                          comment2<br>
                      </div>
                      <div class="comment_form">
                          <form action="">
                              <input type="text" placeholder="ëê¸ ìë ¥...">
                          </form>
                      </div>
                  </div>
                  
                  <div class="card">
                      <header class="user">
                          <img class="profile_image" src="image/image_02.jpg" alt="404">
                          <div class="user_name">username</div>
                      </header>
                      <div class="card_image">
                          <img src="image/image_01.jpg" alt="404">
                      </div>
                      <div class="info">
                          <div class="info_left">
                              <i class="far fa-heart"></i>
                              <i class="far fa-comment"></i>
                              <i class="fas fa-upload"></i>
                          </div>
                          <div class="info_right">
                              <i class="far fa-bookmark"></i>
                          </div>
                      </div>
                      <div class="comment">
                          comment1<br>
                          comment2<br>
                      </div>
                      <div class="comment_form">
                          <form action="">
                              <input type="text" placeholder="ëê¸ ìë ¥...">
                          </form>
                      </div>
                  </div>
              </section>
          </div>
          <div class="main_right">
              <div class="right_nav">
                  <div id="fixed_nav">
                      <div class="right_user">
                          <img class="right_profile_image" src="image/image_01.jpg" alt="404">
                          <div class="user_name">username</div>
                      </div>
                      <div id="recommend">
                          íìëì ìí ì¶ì²
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </body>
</html>