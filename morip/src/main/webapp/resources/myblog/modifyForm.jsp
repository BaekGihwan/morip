<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>view</title>
    <!-- jQuery -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- 구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="../css/myblog/view.css">
    <link rel="stylesheet" type="text/css" href="../css/hover.css">
    
    <!-- 썸머노트부분 -->
    <!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<!-- include summernote css/js-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="/js/board/summernote-ko-KR.js"></script>
	
	<!-- flatpicker -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <style>
   	input{
   		color:black;
   	}
    .imgInput{
  		width:50%;
  		height:350px;
  		margin:0 auto;
  		padding-top:30px;
  	}
  	.userChoiceImg{
  		height:150px;
  		width:90%;
  		margin:10px auto;
  	}
  	.bgImg{
  		height:200px;
  	}
  	#modifyBtnWrapper{
  		justify-content:center;
  		align-items:center;
  		width:100%;
  		height:100px;
  		display:flex;
  	}
  	#modifyBtn{
  		width:100px;
  		height:50px;
  		display:flex;
  		justify-content:center;
  		align-items:center;
  		border:1px solid #bdbdbd;
  		cursor:pointer;
  	}
  	#hashtagInputWrapper{
  		margin-top:50px;
  		width:100%;
  		height:100px;
  	}
  	#hashtagInput{
  		width:100%;
  		height:100%;
  	}
  	#hashtagInputText{
  		width:100%;
  		height:60px;
  		resize: none;
  	}
  	#hashtagInput h5{
  		letter-spacing: 10px;
  		margin-bottom: 20px;
  	}
    </style>
  </head>
  <body>
 	<input type="hidden" id="nickname" value="${nickname }">
    <input type="hidden" class="view_seq" value="${seq }">
    <input type="hidden" class="bgImgName" value="${myblogDTO.mainimage }">
    <div id="viewheader">
      <div class="background">
      	<div class="backgroundImg" style="background: url('../storage/${myblogDTO.mainimage}') no-repeat 50% 50%; background-size: cover;">s </div>
      	<div class="backgroundCover" ></div>
      </div>
      <div class="subjectbackground">
          <div class="blogSubjectWrapper">
            <div class="dateWrapper">
              <input type="text" id="startdate" value="${myblogDTO.startdate}" readonly> ~ <input type="text" id="enddate" value="${myblogDTO.enddate}" readonly>
            </div>
            <div class="subjectWrapper">
              <input type="text" id="subject" value="${myblogDTO.subject}">
            </div>
            <div class="userinfowrapper">
              <img class="view_userImg"src="../image/myblog/pic01.jpg">
              <div class="view_userId" id="view_userId">${myblogDTO.nickname}</div>
            </div>
          </div>
      </div>
    </div>
    <article class="contentContainer">
      <div class="contentWrapper">
        <div id="bgChangeOption" style="font-size: 15px; margin-left:505; left:75%; top:50px;cursor:pointer; position:absolute; width:20px;">
	  		<i class="fas fa-cog"  onclick="backgroundImgChange()" ></i>
	  	</div>
        <div class="content">
          <div class="contentInner" style="margin:0;">
          	<textarea name="content" id="summernote" value="">${myblogDTO.content}</textarea>
          </div>
          <div id="hashtagInputWrapper">
          	<div id="hashtagInput">
          		<h5>해쉬태그</h5>
          		<textarea id="hashtagInputText" placeholder="#해쉬태그 #입력하세요" ></textarea>
          	</div>
          </div>
          <div id="modifyBtnWrapper">
          	<div id="modifyBtn" class="hvr-outline-in">
          		<div>수정하기</div>
          	</div>
          </div>
        </div>
      </div>
    </article>
    <form id="modifyForm">
  <div class="modal fade" id="bgImgChange" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content" style="width:400px; margin:auto;">
        <div class="modal-header" style="height:50px;">
          <h4 class="modal-title"></h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body">
				     <div class="imgInput">
	                    <h6>배경 사진 선택</h6><br>
	                    <div class="userChoiceImg">
	                    	<img id="bgImg" src="../storage/basicUserImage.png" style="width:100%; height:100%;"/>
	                    </div>
	                    <input name="backgroundImg" id="backgroundImg" class="backgroungImgChoice" type="file" style="margin-top:20px;">
	                 </div>
        </div>
        			<div class="modal-footer">
		         <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		         <button type="button" id="bgImageSave" class="btn btn-default" data-dismiss="modal">저장</button>
		    </div>
        <div id="count" value="1"></div>
      </div>
    </div>
  </div>
  </form>
  </body>
  <!-- sweetAlert -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script src="../js/myblog/view.js"></script>
  <script src="../js/myblog/writeBlog.js"></script>
  <Script>
  var bgImgName;
  var nickname=$('#nickname').val();
  
  	$(document).ready(function(){
  		bgImgName = $('.bgImgName').val();
     	console.log($('.view_seq').val());
      	var seq = $('.view_seq').val();
      	
  		let divheight= $('.contentWrapper').height();
  		$('#footer').css("z-index", "90");
  		let footer = $('#footer');
  		$('.contentWrapper').append(footer);
  		footer.css("width", $('.contentWrapper').width());
  		$('.userMenu').css("z-index","90");
  	});

    
    //flatpicker
    $('#startdate').flatpickr({
      enableTime: false,
      dateFormat: "Y-m-d",
    });
    $('#enddate').flatpickr({
  	  enableTime: false,
  	  dateFormat: "Y-m-d",
  });
   	// 옵션 버튼을 클릭했을 때
   	function backgroundImgChange(){
   		$('#bgImgChange').modal();
   	}
   	
   	$('#modifyBtn').click(function(){
		updateBoard();
   	});
   	
   	function updateBoard(){
    	  var markupStr = $('#summernote').summernote('code');
    	  let content = markupStr.replace(/&nbsp;/g, " ");
    	  //let hashtag = $('#hashtagInputText').val();
    	  let hashtag = '#해쉬태그';
    	  let publicOption = '0';
    	  console.log(content);
    	  if(markupStr.trim()==''){
    		  alert("내용을 입력해주세요");
    	  } else {
    	    	$.ajax({
    	    		type : 'post',
    	    		url : '/morip/myblog/modify',
    	    		data : 'seq='+$('.view_seq').val()+'&startdate='+$('#startdate').val()+'&enddate='+$('#enddate').val()+'&content='+content+"&subject="+$('#subject').val()+"&backgroundImg="+bgImgName+"&publicoption="+publicOption+"&hashtag="+hashtag,
    	    		success : function(){
    	    			alert("여행기 수정이 완료되었습니다!"+nickname);
        				location.href="mypage?nickname="+nickname;
    	    		},
    	    		error : function(e){
    					console.log(e);
    				}
    	    	});
    	  }
   	}

    $('#bgImageSave').click(function(){
        $.ajax({
            type: 'post',
            enctype: 'multipart/form-data',
            processData: false, //문자열이 아닌 파일 형식으로 보내준다
            contentType: false,
            url: "/morip/myblog/imageSave",
            //data: sendingData, //imageboardWriteForm안의 0번째 방에있는 data들을 모두 가져간다
            data: new FormData($('#modifyForm')[0]),
            dataType:"text",
            success: function(fileName){
            	$('.backgroundImg').css('background','url("../storage/'+fileName+'") no-repeat 50% 50%');
            	$('.backgroundImg').css('background-size','cover');
            	bgImgName = fileName;
            	$('.bgImgName').val(fileName);
            	alert(bgImgName+"저장 완료!!!");
            },error: function(err){
               console.log(err);
            }
         });
    });

  </Script>
</html>

