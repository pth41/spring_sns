SpringFramework_SNS
======================
  
## 1. 개요
[**Instagram모방**] 웹 기반 이미지 공유 위주의 미디어 서비스  
  
SpringFramwork를 공부하고 실제로 사용해보기위해 제작해봤습니다  
추가적으로 프로젝트를 진행하면서 Spring Security를 같이 공부하여 적용시켜보았습니다  
기능을 더 추가할 예정입니다  

-개발환경-  
운영체제 : Windows10  
IDE : Eclipse  
SDK : JDK  
API : JDBC  
라이브러리 : Jquery, Lombok, log4jdbc-log4j2, Jackson  
언어 : HTML, CSS, Javascript, Java, JSP  
프레임워크 : SpringFramwork, Spring Security, MyBatis  
테스팅 : Junit  
DB : Oracle  
DBCP : HikariCP  
빌드도구 : Maven  
  
자세한 정보는 프로젝트내 pom.xml 참고  
  
## 2. 기능
- 회원가입
- Bcrypt로 비밀번호 암호화
- 로그인 및 권한 설정(Spring Security)
- 포스트, 댓글 CRUD REST API
- ajax 비동기처리
- 프로필 확인 및 수정
- CSRF 처리
- 파일 업로드 : 진행중

## 3. 구현 화면

회원가입  

![회원가입](https://user-images.githubusercontent.com/37768443/95827400-a7571d80-0d6e-11eb-8ddb-0497a4a62898.PNG)
  
  
로그인  
![로그인](https://user-images.githubusercontent.com/37768443/95827412-ae7e2b80-0d6e-11eb-9f20-be8cce225b76.PNG)
  
  
피드  
![main](https://user-images.githubusercontent.com/37768443/95827470-bfc73800-0d6e-11eb-9e8f-e9c31fcdc12d.PNG)
![main2](https://user-images.githubusercontent.com/37768443/95827477-c190fb80-0d6e-11eb-83c7-f8f10ea05250.PNG)
  
  
포스트  
![post1](https://user-images.githubusercontent.com/37768443/95827514-cbb2fa00-0d6e-11eb-8af9-7e9631ad02ad.PNG)
![post2](https://user-images.githubusercontent.com/37768443/95827517-cd7cbd80-0d6e-11eb-9297-09b8b60b3d7f.PNG)
자신의 게시물 설정  
![post3](https://user-images.githubusercontent.com/37768443/95827538-d2417180-0d6e-11eb-9887-d524d45c904d.PNG)
자신의 댓글 설정  
![post4](https://user-images.githubusercontent.com/37768443/95827545-d40b3500-0d6e-11eb-9fd9-a6c7e776f22c.PNG)
  
  
작성  
![new post](https://user-images.githubusercontent.com/37768443/95827565-db324300-0d6e-11eb-9b4a-916d1f1d5167.PNG)
  
  
프로필  
![profile1](https://user-images.githubusercontent.com/37768443/95827586-e2595100-0d6e-11eb-914a-c9ce9fc0d363.PNG)
  
  
프로필 수정  
![profileEdit1](https://user-images.githubusercontent.com/37768443/95827611-e8e7c880-0d6e-11eb-8f0e-f445275b2d1c.PNG)
![profileEdit2](https://user-images.githubusercontent.com/37768443/95827617-eab18c00-0d6e-11eb-9d91-ec649be3c47a.PNG)

