/**
 * 
 */
 
 
 
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
	  $("#summernote").summernote('code',  '');
	});
	
	
	
function write_check()
{
	if(document.write.name.value == "")
	{
		document.getElementById("write-name").style.marginLeft="20px";
		document.getElementById("write-name").innerText="작성자를 입력해주세요.";
		document.getElementById("write-name").style.color="red";
		return false;
	}
	else
	{
		document.getElementById("write-name").style.display="none";
	}
	
	if(document.write.title.value == "")
	{
		document.getElementById("write-title").style.marginLeft="20px";
		document.getElementById("write-title").innerText="제목을 입력해주세요.";
		document.getElementById("write-title").style.color="red";
		return false;
	}
	else
	{
		document.getElementById("write-title").style.display="none";
	}
}	