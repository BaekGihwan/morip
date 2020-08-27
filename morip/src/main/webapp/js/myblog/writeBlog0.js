/**************************** writeBlog0.jsp *******************************/

	//변수 선언
	let start;
	let end;
	let count = 0;
	let current = new Date();
	
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			defaultDate : current,
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				//var title = prompt('간단한 여행 일정을 등록하세요!');
				if(count==1){
					count=0;
					var event = calendar.getEventById('date');
					event.remove();
				}
				//if (title) {
					calendar.addEvent({
						//title : title,
						id : 'date',
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					})
					count++;
				//}
				start = arg.start;
				end = arg.end;
				calendar.unselect()
			},
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : [],
			eventClick : function(info) {
                     //delete event from calender
                    info.event.remove();

           	}
		});
		calendar.render();
	});

	//height 영역 값에 맞춰서 달력 생성
	$(document).ready(function() {
		var calendarH = $('#calendarWrapper').height();
		$('.editorContent').css("height", calendarH + 20);
		$('.editorContentWrapper').css("height", calendarH + 100);
		showMinute();
	});
	function showMinute(){
		setTimeout(function() {
			$('#infoBoxWrapper').fadeOut(500);
		}, 3000);
	}


	//다음 페이지로 넘어갈 때
	$('#forwardBtn').click(function() {
		
		checkBlank();
	});
	//유효성검사
	function checkBlank(){
		if(start==undefined){
			Swal.fire({
			  icon: 'warning',
			  text: '여행일자를 드래그하여 입력해 주세요!',
			})
		} else {
			let startdate = new Date(start).format('yyyy-MM-dd');
			let enddate = new Date(end).format('yyyy-MM-dd');
			location.href = "/morip/myblog/writeBlog1?startdate="
					+ startdate + "&enddate=" + enddate;
		}
	}
	
	$('#infoIcon').mouseover(function(){
		$('#infoBoxWrapper').show();
	});
	
 	$('#infoIcon').mouseout(function(){
		$('#infoBoxWrapper').hide();
	}); 
