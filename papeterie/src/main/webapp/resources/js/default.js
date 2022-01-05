/**
 * 
 */

 
// 일정스크롤 내릴시 두번째층 숨기고 fixed
$(window).scroll(function(){
    if ($(window).scrollTop() >= 180) {
        $('.top_head').addClass('fixed-header');
        $('.top_head_second').css('display','none');
        $('.top-logo-text3').css('display','block');
        $('.top_head_blank').css('height','180px');
    }
    else {
        $('.top_head').removeClass('fixed-header');
        $('.top_head_second').css('display','block');
        $('.top-logo-text3').css('display','none');
        $('.top_head_blank').css('height','0px');
    }
});  

$( '#tothetop' ).click( function() {
    var htmloffset = $( 'html' ).offset();
    $( 'html, body' ).animate( { scrollTop : htmloffset.top }, 400 );
});

// 카테고리 서브메뉴 숨기기,보이기
function view_sub(n)
{
	document.getElementsByClassName("sub")[n].style.visibility="visible";
}

function hide_sub(n)
{
	document.getElementsByClassName("sub")[n].style.visibility="hidden";
}

// 탑버튼
$( document ).ready( function() {
    $( window ).scroll( function() {
      if ( $( this ).scrollTop() > 500 ) {
        $( '.top' ).fadeIn();
      } else {
        $( '.top' ).fadeOut();
      }
    } );
    $( '.top' ).click( function() {
      $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
      return false;
    } );
  } );


