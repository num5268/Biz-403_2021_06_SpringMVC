<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 홈페이지</title>
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

article h1 {
	background-color: black;
	text-align: center;
	font-size: 40px;
	color: white;
	height: 100px;
	padding: 2rem;
}

nav#main_nav ul {
	display: flex;
	list-style: none;
	background-color: green;
}
nav#main_nav li {
	
	color:white;
	padding: 5px 12px;
}
nav#main_nav li:nth-of-type(4) {
	margin-left: auto;
		
}
</style>
</head>
<body>
	<article>
		<h1>대한 고교 성적처리 2021 v1</h1>
	</article>
	<nav id="main_nav">
		<ul>
			<li>Home</li>
			<li>학생정보</li>
			<li>성적알림표</li>
			<li>로그인</li>
		</ul>
	</nav>

	<section class="st_table">
		<table>
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>전공</td>
				<td>학년</td>
				<td>응시과목</td>
				<td>총점</td>
				<td>평균</td>
			</tr>
		</table>
	</section>
	<footer> </footer>
</body>
</html>