<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<style>
	nav#main_nav ul {
	display: flex;
	list-style: none;
	background-color: black;
	color: white;
	height: 50px;
	padding: 12px 16px;
	}
	nav#main_nav ul li {
	position: relative;
	margin-right: 20px;
	}
	nav#main_nav li#login, li#logout {
		margin-left:auto;
		
	}
	nav#main_nav li:after {
		content: '';
		position: absolute;
		left:0;
		bottom:0;
		height: 0;
		width: 0;
		
		transition:all 0.7s;
	}
	nav#main_nav li:hover:after {
		border-bottom: 5px solid yellow;
		cursor: pointer;
		width: 100%;	
		height: 100%;
		
	}
</style>
<nav id=main_nav>
		<ul>
			<li id="home">HOME</li>
			
			<c:if test="${MEMBER.m_level <= 6}">
				<li id="image_create">이미지 등록</li>
			</c:if>
			<c:if test="${empty MEMBER }">
				<li id="login">로그인</li>
				<li id="join">회원가입</li>
			</c:if>
			<c:if test="${not empty MEMBER}">
				<li>::${MEMBER.m_nick}님 환영합니다::</li>
				<li id="logout">로그아웃</li>
				<c:if test="${MEMBER.m_level == 0 }">
					<li id="admin">관리자</li>
				</c:if>
			</c:if>
		</ul>
</nav>