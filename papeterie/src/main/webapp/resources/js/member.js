/**
 * 
 */

function show_add()
{
	document.getElementById("update_frm").style.visibility = "hidden";
	document.getElementById("add_frm").style.visibility = "visible";
}

function hide_add()
{
	document.getElementById("add_frm").style.visibility = "hidden";
}

function show_update()
{
	document.getElementById("add_frm").style.visibility = "hidden";
	document.getElementById("update_frm").style.visibility = "visible";
}

function hide_update()
{
	document.getElementById("update_frm").style.visibility = "hidden";
}

function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
{
  new daum.Postcode({
      oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.frm.zip.value = data.zonecode; // 우편번호
          document.frm.addr1.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.frm.addr2.focus();
      }
  }).open();
}

function update_addr_fn(idx)
{
	$.ajax({
		url : "get_addr",
		method : "GET",
		data : {
			idx : idx
		},
		cache : false,
		//contentType : "application/json; charset=UTF-8",
		//datatype : "json",
		success : function(data) {
			//console.log("return OK");
			console.log(data);
			$("#u_idx").val(data.idx);
			$("#u_addr_name").val(data.addr_name);
			$("#u_rname").val(data.rname);
			$("#u_zip").val(data.zip);
			$("#u_addr1").val(data.addr1);
			$("#u_addr2").val(data.addr2);
			$("#u_phone").val(data.phone);
			if (data.sdefault == 1) {
				$("input:checkbox[id='u_sdefault']").prop("checked", true);
			} else {
				$("input:checkbox[id='u_sdefault']").prop("checked", false);
			}
			$("#u_soption").val(data.soption).prop("selected", true);
			show_update();
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	});
}

function del_review(idx) {
	if (confirm("삭제하시겠습니까?")) {
		location = "del_review?idx=" + idx;
	}
}

function updateopen(idx){
    var frmPop= document.frmPopup;
    var url = '/papeterie/review/update';
    window.open('','update','width=450, height=800, toolbar=no, menubar=no, resizable=no');  
     
    frmPop.action = url;
    frmPop.target = 'update'; //window,open()의 두번째 인수와 같아야 하며 필수다.  
    frmPop.idx.value = idx;
    frmPop.submit();   
}

