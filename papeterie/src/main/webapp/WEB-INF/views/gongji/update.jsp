<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/papeterie/resources/js/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/papeterie/resources/css/gongji.css">

<script>
$(document).ready(function() {
	  $('.top_head_first').css('paddingTop','5px')
	
	  $('#summernote').summernote({
		  toolbar: [
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	  // Summernote에 글 내용 추가하는 코드
	  $("#summernote").summernote('code',  '${gvo.content}');
	});
</script>
</head>
<body>

<!-- 본문 시작 -->
<div id="section">

	<!-- 페이지 제목 -->
	<h2> 공지사항 수정 </h2>
	
	<!-- 작성 폼 -->
	<form method="post" action="update_ok">
	<input type="hidden" name="id" value="${gvo.id}">
	<table class="table update-center">
		<tr>
			<th width="150">작성자</th>
			<td><input type="text" name="name" id="name" size="40" value="${gvo.name}" readonly></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title" size="40" value="${gvo.title}"></td>
		</tr>
		<tr>
			<th style="padding-top:200px;">내용</th>
			<td><textarea name="content" id="summernote"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center"> 
				<input type="button" value="이전" onclick="location='content?id=${gvo.id}'" id="write-btn">
				<input type="submit" value="저장" id="write-sub">
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>