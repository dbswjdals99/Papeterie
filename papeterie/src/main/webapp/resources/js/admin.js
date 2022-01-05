/**
 * 
 */
 
 // 날짜 자바스크립트 소스
    var date; 
    $(document).ready(function () { 
        startDate(); 
    }); 

    function startDate() { 
        date = setInterval(function () { 
            var dateString = "현재 날짜/시간"; 
			var yoil = "";
			var time = "";
            var newDate = new Date(); 

            yoil += newDate.getFullYear() + "년 "; 
            yoil += ("0" + (newDate.getMonth() + 1)).slice(-2) + "월 "; //월은 0부터 시작하므로 +1을 해줘야 한다. 
            yoil += ("0" + newDate.getDate()).slice(-2) + "일"; 
            time += ("0" + newDate.getHours()).slice(-2) + ":"; 
            time += ("0" + newDate.getMinutes()).slice(-2) + ":"; 
            time += ("0" + newDate.getSeconds()).slice(-2);
            
            $("#date").text(dateString); 
            $("#yoil").text(yoil); 
            $("#time").text(time); 
        }, 1000); 
    } 

    function stopDate() { 
        clearInterval(date); 
    } 
    
    
    
$(document).ready(function() {
    $('#example').DataTable( {
    	"order" : [[0,"desc"]],
    	"lengthMenu": [[10, 25, 50, 100, 500, -1], [10, 25, 50, 100, 500, "전부"]],
        "language": {
            "decimal" : "",
            "emptyTable" : "데이터가 없습니다.",
            "info" : "_START_ - _END_ (총 _TOTAL_ 명)",
            "infoEmpty" : "0명",
            "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
            "infoPostFix" : "",
            "thousands" : ",",
            "lengthMenu" : "_MENU_ 개씩 보기",
            "loadingRecords" : "로딩중...",
            "processing" : "처리중...",
            "search" : "검색 : ",
            "zeroRecords" : "검색된 데이터가 없습니다.",
            "paginate" : 
            {
                "first" : "첫 페이지",
                "last" : "마지막 페이지",
                "next" : "다음",
                "previous" : "이전"
            },
            "aria" : 
            {
                "sortAscending" : " :  오름차순 정렬",
                "sortDescending" : " :  내림차순 정렬"
            }
        }
    } );
} );



function color_chg()
{
	var element = document.getElementById("div1");
	element.classList.add('click');
	
	var element2 = document.getElementById("div2");
	element2.classList.remove('click');
}

function color_chg2()
{
	var element = document.getElementById("div2");
	element.classList.add('click');
	
	var element2 = document.getElementById("div1");
	element2.classList.remove('click');
}







