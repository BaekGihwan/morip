$("#sidebarToggle").on("click", function(e) {
    e.preventDefault();
    $("body").toggleClass("sb-sidenav-toggled");
});
//dashboard 페이지
$(document).ready(function(){
  weekChartShow();
});
$('#monthBtn').click(function(){
  monthChartShow();
});
$('#weekBtn').click(function(){
  weekChartShow();
});
function monthChartShow(){
  $('.monthChart').show();
  $('.weekChart').hide();
  $('#weekBtn').css('color',"#bec3e0");
  $('#monthBtn').css('color',"#49599a");
  $('#chartTitle').text("월간 방문자 수 현황");
}
function weekChartShow(){
  $('.monthChart').hide();
  $('.weekChart').show();
  $('#weekBtn').css('color',"#49599a");
  $('#monthBtn').css('color',"#bec3e0");
  $('#chartTitle').text("주간 방문자 수 현황");
}
