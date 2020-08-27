var stepPg = $('#stepPg').val();

/**************전체 페이지 기능***************/
 //이전과 다음 버튼 기능
$('#backwardBtn').click(function(){
	history.back();
});


$('document').ready(function(){
   //step2
     $('.switch_infomation').hide();

   //상단 진행바 컨트롤러
   if(stepPg==0){
       $('.step1').css('background-color','#d7ccc8');
       $('.step2').css('background-color','#e9eae4');
       $('.step3').css('background-color','#e9eae4');
     } else if(stepPg==1){
       $('.step1').css('background-color','#e9eae4');
       $('.step2').css('background-color','#d7ccc8');
       $('.step3').css('background-color','#e9eae4');
    } else if(stepPg==2){
     $('.step1').css('background-color','#e9eae4');
       $('.step2').css('background-color','#e9eae4');
       $('.step3').css('background-color','#d7ccc8');
    }
});
//공개 설정
$('.switch').mouseover(function(){
  $('.switch_infomation').show();
});
$('.switch').mouseout(function(){
  $('.switch_infomation').hide();
});

/*******************stpe1*********************/
//다음 버튼 클릭 시 유효성 검사 및 DB 안에 사진 저장
  $('#forwardBtn').click(function(){
  if(stepPg==1){
     if($('#subject').val()==''){
   		Swal.fire({
		  icon: 'warning',
		  text: '여행기 제목을 입력해주세요!',
		})
     } else if($('#backgroundImg')[0].files[0]==undefined){
    	Swal.fire({
		  icon: 'warning',
		  text: '여행기 배경사진을 입력해 주세요!',
		})
     }  else {
        let sendingData = 'startdate='+$('#startdate').val()+'&enddate='+$('#enddate').val()+'&subject='+$('#subject').val()+'&fileName='+encodeURI($('#backgroundImg')[0].files[0].name);
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
               location.href="writeBlog2?"+'startdate='+$('#startdate').val()+'&enddate='+$('#enddate').val()+'&subject='+$('#subject').val()+'&fileName='+encodeURI(fileName);
            },error: function(err){
               console.log(err);
            }
         });
     }
  } 
  if(stepPg ==0){
  	checkBlank();
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
  
  //날짜 형식 변환
Date.prototype.format = function (f) {
    if (!this.valueOf()) return " ";
    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    var d = this;
    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear(); // 년 (4자리)
            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
            case "dd": return d.getDate().zf(2); // 일 (2자리)
            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
            case "ss": return d.getSeconds().zf(2); // 초 (2자리
            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
            default: return $1;
        }
    });
};
String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
Number.prototype.zf = function (len) { return this.toString().zf(len); };



/*******************stpe2*********************/
 $('#summernote').summernote({
	  height:500,
	  maxHeight:560,
	  minHeight:560,
      focus: true,
      lang: 'en-EN',
      map: {
          apiKey: 'AIzaSyC4wQxb6hFjF1nrDEg6ePZcTbmswq89hAE',
          center: {
	          lat: -33.8688,
	          lng: 151.2195
	        },
          zoom: 13
      },
      lang: 'en-US',
      toolbar: [
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['fontsize', ['fontsize']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['insert', ['link', 'picture', 'map', 'table']]
      ],
		callbacks: {
			onImageUpload: function(files, editor, welEditable) {
	            for (var i = files.length - 1; i >= 0; i--) {
	            	sendFile(files[i], this);
	            }
	        }
		}
  });
  
  function sendFile(file, el) {
      var form_data = new FormData();
      form_data.append('file', file);
  	//let filePath = file.value;
      $.ajax({
        data: form_data,
        type: "POST",
        url: '/morip/myblog/imageUpload',
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        dataType:"json",
        success: function(data) {
          	$('#summernote').summernote('insertImage', data.url, data.fileName);
        }
      });
    }
