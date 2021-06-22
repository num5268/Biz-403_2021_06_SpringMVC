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
	 <section class="main_list">
      <table class="container">
        <tr>
          <th>학번</th>
          <th>이름</th>
          <th>전공</th>
          <th>학년</th>
          <th>응시과목</th>
          <th>총점</th>
          <th>평균</th>
        </tr>
       	<c:forEach items="${LIST}" var="LIST" >
		<tr data-num="${LIST.st_num}">
			<td>${LIST.st_num}</td>
			<td>${LIST.st_name}</td>
			<td>${LIST.st_dept}</td>
			<td>${LIST.st_grade}</td>
			<td>${LIST.sc_subject}</td>
			<td>${LIST.sc_scores}</td>
			<td>${LIST.sc_avg}</td>
		</tr>	
		</c:forEach>	
      </table>
    </section>
    <footer></footer>
</body>
</html>