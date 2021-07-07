<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<style>
	div.ga_box{
		display: flex;
	}
	div.ga_box div:first-of-type {
		flex:1;
	}
	div.ga_box div:last-of-type {
		flex:3;
	}

	div.ga_box div img {
		width: 200px;
		border-radius: 10px;
		border: 3px solid black;
		display: flex;
	}
	div.ga_box div {
		margin: 20px
	}
	
	h3 {
		font-size: 25px;
		font-style: normal;
		font-weight: bold;
	}
	p {
		font-size: 20px;
		position: relative;
		top:20px;
		left: 10px;
		
	}
	
	a {
		text-decoration: none;
		color: black;
		position: relative;
		top:20px;
		left: 10px;
		
	}
}
</style>
<c:forEach items="${GAS}" var="GALLERY">
<div class="ga_box">
	<div>
		<img src="${rootPath}/files/${GALLERY.g_image}" >
	</div>
	<div>
		<h3>
		<a href="${rootPath}/gallery/detail/${GALLERY.g_seq}">
			${GALLERY.g_subject}
		</a>
		</h3>
		<p>${GALLERY.g_content}</p>
	</div>
</div>
</c:forEach>