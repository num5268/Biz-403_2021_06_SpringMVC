<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<style>
	section.page_box{
		width: 80%;
		margin: 10px auto;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	section.page_box ul {
		width:80%;
		display: flex;
	}
	section.page_box li {
		display: inline-block;
		width: 30px;
		height: 30px;
		border: 1px solid green; 
		line-height: 20px;
	}
	section.page_box li.active{
		color:#FFF;
		background-color: #007BFF;
		border-color: #007BFF;
	}
</style>
<section class="page_box">
	<ul>
		<li data-num="0">&lt;</li>
		<c:forEach begin="1" end="10" var="pageNum">
			<li data-num="${pageNum}"
			<c:if test="${PAGE_NUM == pageNum}">active</c:if>
			
			>${pageNum}</li>
		</c:forEach>
		<li data-num="99">&lt;</li>
	</ul>
</section>
<script>
	const page_nav_main = documnet.querySelector("ul.page_nav_main")
	if(page_nav_main){
		page_nav_main.addEventListener("click",(e)=>{
			const li = e.target
			if(li.tagName === "LI"){
				const pageNum = e.target.dataset.num
				location.href = "#{rootPath}/gallery?pageNum"+pageNum;
			}
		})
	}
</script>