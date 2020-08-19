<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <!-- full calender API -->
<link href='../js/myblog/packages/core/main.css' rel='stylesheet' />
<link href='../js/myblog/packages/daygrid/main.css' rel='stylesheet' />
<link href='../js/myblog/packages/timegrid/main.css' rel='stylesheet' />
<link href='../js/myblog/packages/list/main.css' rel='stylesheet' />
<script src='../js/myblog/packages/core/main.js'></script>
<script src='../js/myblog/packages/interaction/main.js'></script>
<script src='../js/myblog/packages/daygrid/main.js'></script>
<script src='../js/myblog/packages/timegrid/main.js'></script>
<script src='../js/myblog/packages/list/main.js'></script>
	<style>
	html, body {
	  margin: 0;
	  padding: 0;
	  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	  font-size: 14px;
	}
	#external-events {
	  position: fixed;
	  z-index: 2;
	  top: 20px;
	  left: 20px;
	  width: 150px;
	  padding: 0 10px;
	  border: 1px solid #ccc;
	  background: #eee;
	}
	
	.demo-topbar + #external-events { /* will get stripped out */
	  top: 60px;
	}
	
	#external-events .fc-event {
	  margin: 1em 0;
	  cursor: move;
	}
	
	#calendar-container {
	  position: relative;
	  z-index: 1;
	  margin-left: 200px;
	}
	#calendar {
	  max-width: 900px;
	  margin: 20px auto;
	}
	/*caleder style*/
	#calendarWrapper{
		margin:10px auto;
		width:95%;
		height:95%;
		background-color:gray;
	}
	</style>
    
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->

    <!--AOS 라이브러리-->
     <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
     <!--hover.css-->
     <link href="../css/hover.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/myblog/writeBlog.css" rel="stylesheet" />
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="../css/myblog/step2.css" rel="stylesheet" />

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <title></title>
  </head>
  <body>
  <form method="post" id="writeBlogForm" name="writeBlogForm"  enctype="multipart/form-data" action="">    
    <article class="contentWrapper">
      <div class="content">
        <div class="writeEditor">
          <!--상태 진행 바-->
          <div class="contentHeader" style=" ">
            에세이 작성
          </div>
          <div class="stepBarWrapper">
            <input type="hidden" id="stepPg" value="0">
            <div class="step1">
              <div class="stepHeader">STEP1</div>
              <div class="stepContent">
               	여행 일정 등록
              </div>
            </div>
            <div class="step2">
              <div class="stepHeader">STEP2</div>
              <div class="stepContent">
               	에세이 제목과 배경 설정
              </div>
            </div>
            <div class="step3">
              <div class="stepHeader">STEP3</div>
              <div class="stepContent">
               	에세이 내용 작성
              </div>
            </div>
          </div>
       	<div id="external-events">
		   <p>
		     <strong>Draggable Events</strong>
		   </p>
		   <div class="fc-event">My Event 1</div>
		   <div class="fc-event">My Event 2</div>
		   <div class="fc-event">My Event 3</div>
		   <div class="fc-event">My Event 4</div>
		   <div class="fc-event">My Event 5</div>
		   <p>
		      <input type="checkbox" id="drop-remove">
		      <label for="drop-remove">remove after drop</label>
		   </p>
		</div>
          <!--본격적인 에디터 본문-->
	          <div class="editorContentWrapper">
	            <div class="editorContent">
					<div id="calendarWrapper">
						<div id='calendar'></div>
					</div>
	            </div>
	          </div>
        </div>
        <div class="writeOption">
          <div class="stepChoiceWrapper">
            <div class="hvr-forward" id="forwardBtn">
              <div class="stepChoiceContent">
               	 다 음
              </div>
            </div>
          </div>
        </div>
      </div>
    </article>
    </form>
  </body>
  <!-- Bootstrap core JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
  <!-- Third party plugin JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
  <!--AOS 라이브러리-->
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <!-- Core theme JS-->
  <script src="../js/myblog/writeBlog.js"></script>
  
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
       var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendarInteraction.Draggable;
     
        var containerEl = document.getElementById('external-events');
        var calendarEl = document.getElementById('calendar');
        var checkbox = document.getElementById('drop-remove');
     
        // initialize the external events
        // -----------------------------------------------------------------
     
        new Draggable(containerEl, {
          itemSelector: '.fc-event',
          eventData: function(eventEl) {
            return {
              title: eventEl.innerText
            };
          }
        });
     
        // initialize the calendar
        // -----------------------------------------------------------------
     
        var calendar = new Calendar(calendarEl, {
          plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
          editable: true,
          droppable: true, // this allows things to be dropped onto the calendar
          drop: function(info) {
            // is the "remove after drop" checkbox checked?
            if (checkbox.checked) {
              // if so, remove the element from the "Draggable Events" list
              info.draggedEl.parentNode.removeChild(info.draggedEl);
            }
          }
        });
     
        calendar.render();
   });
   
/*    $(function () {
      // page is now ready, initialize the calendar...
      $('#calendar').fullCalendar({
         // put your options and callbacks here
      })
   }); */
</script>
</html>
>