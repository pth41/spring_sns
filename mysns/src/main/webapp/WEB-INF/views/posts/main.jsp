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
          .nav_container{
              display: flex;
              justify-content: space-around;
              align-items: flex-end;
              position: fixed;
              z-index: 1;
              width: 100%;
              height: 4rem;
              border-bottom: 1px solid #efefef;
              background-color: white;
          }
          
          #insta_icon{
              padding-right: 1rem;
              border-right: 1px solid black;
          }
          
          #pthgram{
              display: inline;
              font-family: 'Sriracha', cursive;
          }
          
          i{
              font-size: 1.5rem;
              margin: 1rem;
          }
          
          .search{
              margin-left: 5rem;
              margin-bottom: 0.5rem;
          }
          
          /*#search_input{
              border: solid 1px #dbdbdb;
              border-radius: 3px;
          }*/
          
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
          
          .fa-search {
              font-size: 1rem; color: black; z-index: 3;  top: 25%;
              -webkit-transform: translate(-190px, -8px); 
              -ms-transform: translate(-190px, -8px);
              transform: translate(-190px, -8px);
              -webkit-transition-duration: 0.3s;
              transition-duration: 0.3s;
              -webkit-transition: all 0.1s ease-in-out;
              transition: all 0.1s ease-in-out;
          }
          
          .search_field {  
              position: relative;  
              display: inline-block;  
              padding: 0 0 0 40px;  
              background: #fff;  
              border: 1px solid #efefef;  
              border-radius: 5px; 
          }
          
          #search_input, #search_submit {  position: relative;  width: 200px;  height: 30px;  padding: 0;  display: inline-block;  float: left; }
          #search_input {  color: #666;  z-index: 2;  border: 0 none; }
          #search_input:focus {  outline: 0 none; }
          #search_input:focus + #search_submit {
              -webkit-transform: translate(0, 0);
              -ms-transform: translate(0, 0);
              transform: translate(0, 0);
              -webkit-transition-duration: 0.3s;
              transition-duration: 0.3s;
          }

          #search_input:focus + #search_submit .fas {
              -webkit-transform: translate(0px, -8px);
              -ms-transform: translate(0px, -8px);
              transform: translate(0px, -8px);
              -webkit-transition-duration: 0.3s;
              transition-duration: 0.3s;
              color: #fff;
          }

          #search_submit {  
              z-index: 1;  width: 50px;  border: 0 none;  background: #4a4a4a;  cursor: pointer;  border-radius: 0 5px 5px 0;  
              -webkit-transform: translate(-50px, 0);
              -ms-transform: translate(-50px, 0);
              transform: translate(-50px, 0);
              -webkit-transition-duration: 0.3s;
              transition-duration: 0.3s;
          }
      </style>
  </head>

  <body>
      <div class="nav_container">
          <div class="left">
               <i id="insta_icon" class="fab fa-instagram"></i><h2 id="pthgram">Pthgram</h2>
          </div>
          
          <div class="search">
              <form class="search_form" action="">
                  <fieldset class="search_field">
                      <input id="search_input" type="text" name="search" placeholder="검색...">
                      <button id="search_submit" type="submit"><i class="fas fa-search"></i></button>
                  </fieldset>
              </form>
          </div>
          
          <div class="right">
              <i class="fas fa-home"></i>
              <i class="far fa-compass"></i>
              <i class="far fa-heart"></i>
              <i class="far fa-user"></i>
          </div>
      </div>
      <div class="main">
          <div class="main_left">
              <section class="card_section">
                  <div class="card">
                      <header class="user">
                          <img class="profile_image" src="/resources/image/image_01.jpg" alt="404">
                          <div class="user_name">username</div>
                      </header>
                      <div class="card_image">
                          <img src="/resources/image/image_02.jpg" alt="404">
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
                              <input type="text" placeholder="댓글 입력...">
                          </form>
                      </div>
                  </div>

                  <div class="card">
                      <header class="user">
                          <img class="profile_image" src="/resources/image/image_01.jpg" alt="404">
                          <div class="user_name">username</div>
                      </header>
                      <div class="card_image">
                          <img src="/resources/image/image_02.jpg" alt="404">
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
                              <input type="text" placeholder="댓글 입력...">
                          </form>
                      </div>
                  </div>
                  
                  <div class="card">
                      <header class="user">
                          <img class="profile_image" src="/resources/image/image_02.jpg" alt="404">
                          <div class="user_name">username</div>
                      </header>
                      <div class="card_image">
                          <img src="/resources/image/image_01.jpg" alt="404">
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
                              <input type="text" placeholder="댓글 입력...">
                          </form>
                      </div>
                  </div>
              </section>
          </div>
          <div class="main_right">
              <div class="right_nav">
                  <div id="fixed_nav">
                      <div class="right_user">
                          <img class="right_profile_image" src="/resources/image/image_01.jpg" alt="404">
                          <div class="user_name">username</div>
                      </div>
                      <div id="recommend">
                          회원님을 위한 추천
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </body>
</html>