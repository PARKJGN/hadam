
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/sign/signin.js"></script>
    
  </head>
  <body>
  	<div hidden>
  	<form action='/signup/naverSignup' method='post' id="naver">
  		<input id='memberId' name='memberId' value=''>
  		<input id='memberPassword' name='memberPassword' value=''>
  		<input id='memberPhoneNumber' name='memberPhoneNumber' value=''>
  		<input id='memberNickname' name='memberNickname' value=''>
  		<input id='memberBirth' name='memberBirth' value=''>
  		<input id='memberSex' name='memberSex' value=''>
  		<input id='memberType' name='memberType' value=''>
  		<input id='accesstoken' name='accesstoken' value=''>
  	</form>
  
  	</div>
  </body>
</html>