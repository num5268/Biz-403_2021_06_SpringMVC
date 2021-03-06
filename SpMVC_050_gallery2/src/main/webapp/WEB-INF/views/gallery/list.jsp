<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<style>
	div.ga_box{
		display: flex;
		justify-content: center;
		margin-top:30px;
		margin-bottom: 50px;
	}

	div.ga_box div.img_box img {
		width: 200px;
		display: inline-block;
		box-sizing: border-box;
	}
	div.ga_box div {
		margin: 20px
	}
	
	h3 {
		font-size: 25px;
		font-style: normal;
		font-weight: bold;
	}
	div.text_box p, a {
		font-size: 20px;
		display: flex;
		text-decoration: none;
		color: black;
		position:relative;
		top: 30%;
	}
	
}
</style>
<c:forEach items="${GALLERYS}" var="GALLERY">
<div class="ga_box">
	<div class="img_box">
		<c:if test="${empty GALLERY.g_image}">
			<img src="${rootPath}/files/noImage.png" width="100%">
		</c:if>
		
		<c:if test="${not empty GALLERY.g_image}">
			<img src="${rootPath}/files/${GALLERY.g_image}" width="100%">
		</c:if>
		<img src="${rootPath}/files/${GALLERY.g_image}" >
	</div>
	<div class="text_box">
		<h3>
		<a href="${rootPath}/gallery/detail2/${GALLERY.g_seq}">
			${GALLERY.g_subject}( ${GALLERY.g_seq} )
		</a>
		</h3>
		<p>${GALLERY.g_content}</p>
	</div>
</div>

</c:forEach>
<%@ include file="/WEB-INF/views/include/include_page_nav.jsp" %>