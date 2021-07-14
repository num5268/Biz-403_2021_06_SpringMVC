<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
	section.main_sec {
		background-color: #90e0d8;
		width: 550px;
		height: 600px;
		border-radius: 10px;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%,-50%);
	}
	section.main_sec label {
		font-size: 20px;
		margin-bottom: 20px;
		text-align: center;
		display: inline-block;
		width: 100%;
		border-style: none;
		
	}
	section.main_sec input,textarea {
		display: flex;
		border: hidden;
		border-radius: 5px;
		width: 150px;
		height: 30px;
		text-align: center;
		transform: translate(-50%,-50%);
		position: relative;
		left: 50%;
	}
	section.main_sec textarea {
		margin-top: 20px;
	}
	section.main_sec button {
		border-style: none;
		width: 50px;
		background-color: white;
		border-radius: 5px;
		position: relative;
		left: 50%;
		transform: translate(-50%,-50%);
	}
</style>
<form method="POST" enctype="multipart/form-data">

	<div>
		<label>작성자</label>
		<input name="g_writer" value="${CMD.g_writer}">
	</div>
	<div>
		<label>작성일자</label>
		<input name="g_date" value="${CMD.g_date}">
	</div>
	<div>
		<label>작성시각</label>
		<input name="g_time" value="${CMD.g_time}">
	</div>
	<div>
		<label>제목</label>
		<input name="g_subject">
	</div>
	<div>
		<label></label>
		<textarea name="g_content"></textarea>
	</div>
	<div>
		<label>대표이미지</label>
		<input type="file" name="one_file"/>
	</div>
	<div>
		<label>갤러리</label>
		<input type="file" multiple="multiple" name="m_file"/>
	</div>
	<button>전송</button>
</form>
