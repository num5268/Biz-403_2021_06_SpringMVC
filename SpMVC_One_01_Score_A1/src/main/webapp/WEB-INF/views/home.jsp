<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;;
}
header.main_head {
	height: 100px;
	width: 100%;
	background-color: black;
}

header.main_head h1 {
	color: white;
	text-align: center;
	font-size: 40px;
}
nav.main_nav {
	background-color: green;
	
}
nav.main_nav ul {
	display: flex;
	list-style: none;
	
	font-weight: bold;
}
nav.main_nav ul li {
	padding: 12px 16px;
}
nav.main_nav ul li:nth-of-type(4){
	margin-left: auto;
}
nav.main_nav ul li:hover {
	color: white;
	background-color: black;
	cursor: pointer;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 90%;
	margin: 0 auto;
}

table tr, td {
	border-top: 1px solid #aaa;
	padding: 5px 8px;
}

table td {
	margin-left: 30px;
	text-align: left;
	padding-left: 10px;
	max-width: 0;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

table td:hover {
	overflow: visible;
	text-overflow: inherit;
}

table tr:last-child td {
	border-bottom: 1px solid #aaa;
}

table tr:nth-child(odd) {
	background-color: #eee;
}

table tr:nth-child(even) {
	background-color: #ddd;
}

table tr:hover {
	background-color: #aaa;
	cursor: pointer;
}
</style>
<body>
	<header class="main_head">
		<h1>대한 고교 성적처리 2021 v1</h1>
	</header>
	<nav class="main_nav">
		<ul>
			<li>Home</li>
			<li>학생정보</li>
			<li>성적알람표</li>
			<li>로그인</li>
		</ul>
	</nav>
	<section class="main_sec">
		<table class="container">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>전공</td>
				<td>학년</td>
				<td>응시과목</td>
				<td>총점</td>
				<td>평균</td>
			</tr>
			<c:forEach items="${LIST}" var="LIST">
				<tr data-num="${LIST.st_num}">
					<td>${LIST.st_num}</td>
					<td>${LIST.st_name}</td>
					<td>${LIST.st_dept}</td>
					<td>${LIST.st_grade}</td>
					<td>${LIST.sc_subject}</td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>