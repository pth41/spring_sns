<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          
          .search{
              margin-left: 5rem;
              margin-bottom: 0.5rem;
          }
          
          /*#search_input{
              border: solid 1px #dbdbdb;
              border-radius: 3px;
          }*/

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

<div class="nav_container">
        <div class="left">
            <i id="insta_icon" class="fab fa-instagram"></i><h2 id="pthgram">Pthgram</h2>
        </div>
          
        <div class="search">
            <form class="search_form" action="">
                <fieldset class="search_field">
                    <input id="search_input" type="text" name="search" placeholder="ê²ì...">
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