/**************전체 페이지 기능***************/
 //이전과 다음 버튼 기능
$('#backwardBtn').click(function(){
  location.href="writeBlog1";
});

var stepPg = $('#stepPg').val();

$('document').ready(function(){
	//step1
	$('#bgImg').attr('src',"../storage/basicUserImg.png");
	
	//step2
  	$('.switch_infomation').hide();

	//상단 진행바 컨트롤러
	if(stepPg==1){
   	 $('.step1').css('background-color','#d7ccc8');
   	 $('.step2').css('background-color','#e9eae4');
  	} else if(stepPg==2){
   	 $('.step1').css('background-color','#e9eae4');
   	 $('.step2').css('background-color','#d7ccc8');
    }
});
/*******************stpe1*********************/
//다음 버튼 클릭 시 유효성 검사 및 DB 안에 사진 저장
  $('.stepChoiceContent').click(function(){
	  console.log($('#backgroundImg')[0].files[0]==undefined);
	  if($('#subject').val()==''){
		  alert("여행기 제목을 입력하세요!");
	  } else if($('#backgroundImg')[0].files[0]==undefined){
		  alert("여행기 배경사진을 넣어주세요!");
	  }  else {
		  let sendingData = 'subject='+$('#subject').val()+'&fileName='+$('#backgroundImg')[0].files[0].name;
			$.ajax({
				type: 'post',
				enctype: 'multipart/form-data',
				processData: false, //문자열이 아닌 파일 형식으로 보내준다
				contentType: false,
				url: "/morip/myblog/imageSave",
				//data: sendingData, //imageboardWriteForm안의 0번째 방에있는 data들을 모두 가져간다
				data: new FormData($('#writeBlogForm')[0]),
				dataType:"text",
				success: function(fileName){
					location.href="writeBlog2?"+'subject='+$('#subject').val()+'&fileName='+fileName;
				},error: function(err){
					console.log(err);
				}
			});
	  }
  });
  
  //사진을 업로드 하였을 때 바로 화면에 뿌려주기
  $('#backgroundImg').change(function() {
      readURL(this);
  });
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {
              $('#bgImg').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      }
  }
/*******************stpe2*********************/
//공개 설정
$('.switch').mouseover(function(){
  $('.switch_infomation').show();
});
$('.switch').mouseout(function(){
  $('.switch_infomation').hide();
});



