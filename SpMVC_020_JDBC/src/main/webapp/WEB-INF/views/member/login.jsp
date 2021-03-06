<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf" %>
<style>
	form#login_form {
		width: 400px;
		padding: 40px;
		margin: 150px auto;
		
		background-color: #006574;
		text-align: center;
		border-radius: 20px;
	}
	form#login_form h2{
		color:white;
		font-weight: 500;
	}
	form#login_form input {
		outline: 0;
		display: block;
		
		width: 200px;
		margin: 20px auto;
		
		padding: 14px 10px;
		color: white;
		border-radius: 25px; 
		background: none;
		border: 2px solid #A7EEFF;
		text-align: center;
		transition: 0.5s;
	}
	form#login_form input:focus {
		width: 280px;
		border-color: #2ecc71;
	}
	form#login_form button {
		border: 0;
		outline: none;
		background: none;
		display: block;
		margin: 20px auto;
		text-align: center;
		border: 1px solid #2ecc71;
		color:white; 
		border-radius: 25px;
		cursor: pointer;
	}
	form#login_form button.btn_join {
		background-color: #006574;
	}
	form#login_form button:hover {
		background-color: #ddd;
	}
	form#login_form div.msg {
		margin: 5px auto;
		background-color: red;
		padding:12px 16px;
		border-radius:15px;
		color:yellow;
		font-size: 20px; 
		 
	}
	
</style>
<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf" %>
		<form id="login_form" method="POST">
		<h2>로그인</h2>
		<div class="msg">${MSG}</div>
			<input name="m_username" id="m_username" placeholder="사용자 ID" />
			<input type="password" name="m_password" id="m_password" placeholder="비밀번호" />
			<button type="button" class="btn_login">로그인</button>
			<button type="button" class="btn_join">회원가입</button>
		</form>
	<%@ include file="/WEB-INF/views/include/include_footer.jspf" %>
</body>
<script>

//if("${MSG}" === "NONE"){
	document.querySelector("div.msg").style.display = "${MSG}"

document.querySelector("button.btn_join")
	.addEventListener("click",()=>{
		location.href = "${rootPath}/member/join";
});
document.querySelector("button.btn_login")
	.addEventListener("click",()=>{
	let username = document.querySelector("input#m_username")
	let password = document.querySelector("input#m_password")
	
	/*
		view 단에서 입력 유효성 검사하기
		값이 입력되었는 가를 검사하기
		입력되지 않으면 alert을 보이고 입력 box에 focus 주기
	*/
	if(username.value === "") {
		alert("사용자 id를 입력하세요")
		username.focus()
		/* 더 이상 이벤트를 진행하지 말라 이벤트를 끝낸다*/
		return false;
	}
	if(password.value === "") {
		alert("비밀번호를 입력하세요")
		password.focus()
		return false;
	}
	// 유효성 검사를 통과하면
	// 서버로 전송하기
	document.querySelector("form#login_form").submit();
})
</script>
</html>