<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 홈페이지</title>
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Otomanopee+One&display=swap" rel="stylesheet">
<style>
	*{
		padding: 0;
		margin: 0;
		box-sizing: border-box;
		font-family: 'Jua', sans-serif;
		font-family: 'Noto Sans KR', sans-serif;
		font-family: 'Otomanopee One', sans-serif;
	}
	header {
		height:100px;	
	}
	header h1 {
		text-align: center;
	}
	nav#main_nav ul {
	display: flex;
	list-style: none;
	}
	nav#main_nav ul li {
	padding-left: 10px;
	}
</style>
<body>
<header>
	<h1>내 갤러리</h1>
	<%@ include file="/WEB-INF/views/include/include.jsp" %>
</header>
	<c:choose>
		<c:when test="${BODY eq 'GA-INPUT'}">
			<%@ include file="/WEB-INF/views/gallery/input.jsp" %>
		</c:when>
		
		<c:when test="${BODY eq 'GA-LIST'}">
			<%@ include file="/WEB-INF/views/gallery/list.jsp" %>
			<a href="${rootPath}/gallery/input"> 이미지 등록</a>
		</c:when>
		
		<c:when test="${BODY eq 'GA-DETAIL'}">
			<%@ include file="/WEB-INF/views/gallery/detail.jsp" %>
		</c:when>
		
		<c:when test="${BODY eq 'JOIN'}">
			<%@ include file="/WEB-INF/views/member/join.jsp" %>
		</c:when>
		
		<c:when test="${BODY eq 'LOGIN'}">
			<%@ include file="/WEB-INF/views/member/login.jsp" %>
		</c:when>
		
		<c:otherwise>
			<a href="${rootPath}/gallery/input"> 이미지 등록</a>
		</c:otherwise>
	</c:choose>

<c:forEach items="${FILSE}" var="FILE">
	<a href="${rootPath}/files/${FILE}" target="_NEW">
	<img 
	src="${rootPath}/files/${FILE}" 
	width="100px" height="100px"/>
	</a>
</c:forEach>

<img src="${rootPath}/files/title.jpg" width="400px"/>

</body>
<script>
	let main_nav = document.querySelector("nav#main_nav")
	
	if(main_nav){
		main_nav.addEventListener("click",(e)=>{
			let menu = e.target
			if(menu.tagName === "LI"){
				
				if(menu.id === "join"){
					location.href = "${rootPath}/member/join"
				} else if(menu.id === "login"){
					location.href = "${rootPath}/member/login"
				} else if(menu.id === "logout"){
					location.href = "${rootPath}/member/logout"
				} else if(menu.id === "image_create") {
					location.href = "${rootPath}/gallery/input"
				} else if(menu.id === "home") {
					location.href = "${rootPath}/"
				}
			}
		})
	}
</script>
</html>