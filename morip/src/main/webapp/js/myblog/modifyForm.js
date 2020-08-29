var bgImgName;
	var nickname = $('#nickname').val();
	var seq = $('.view_seq').val();
	let modifyFormCheck=true;
	let hashtagText="";
	
	$(document).ready(function() {
		bgImgName = $('.bgImgName').val();
		var seq = $('.view_seq').val();

		let divheight = $('.contentWrapper').height();
		$('#footer').css("z-index", "90");
		let footer = $('#footer');
		$('.contentWrapper').append(footer);
		footer.css("width", $('.contentWrapper').width());
		$('.userMenu').css("z-index", "90");
		
		//해쉬태그 로드
		var ar = new Array();
	});

	//flatpicker
	$('#startdate').flatpickr({
		enableTime : false,
		dateFormat : "Y-m-d",
	});
	$('#enddate').flatpickr({
		enableTime : false,
		dateFormat : "Y-m-d",
	});
	// 옵션 버튼을 클릭했을 때
	function backgroundImgChange() {
		$('#bgImgChange').modal();
	}

	$('#modifyBtn').click(function() {
		updateBoard();
	});

	function updateBoard() {
		var markupStr = $('#summernote').summernote('code');
		let publicOption = '0';		
		let startdate = $('#startdate').val();
		let enddate = $('#enddate').val();
		let subject = $('#subject').val();
		let backgroundImg = bgImgName;
		let content = markupStr.replace(/&nbsp;/g, " ");
		let hashtag = $('#hashtagInputText').val();
		let jsonData = {
			"seq" : seq,
			"startdate" : startdate,
			"enddate" : enddate,
			"content" : content,
			"subject" : subject,
			"backgroundImg" : backgroundImg,
			"publicoption" : publicOption,
			"hashtag" : hashtag
		};
		if (markupStr.trim() == '') {
			Swal.fire({
			  icon: 'warning',
			  text: '내용을 입력해 주세요!',
			})
		} else {
			$.ajax({
				type : 'post',
				url : '/morip/myblog/modify',
				data : JSON.stringify(jsonData),
				contentType : "application/json",
				success : function() {
					Swal.fire({
						title: '수정 완료!',
				    	text: '여행기 수정이 완료되었습니다!',
				    	icon: 'success',
				    	confirmButtonText: '확인',
				   		confirmButtonColor: '#3085d6',
						 }).then((result) => {
							if (result.value) {                                 
								location.href = "mypage?nickname=" + nickname;
			               }
				        })
				},
				error : function(e) {
					console.log(e);
				}
			});
		}
	}
	
	$('#bgImageSave').click(
			function() {
				$.ajax({
					type : 'post',
					enctype : 'multipart/form-data',
					processData : false, //문자열이 아닌 파일 형식으로 보내준다
					contentType : false,
					url : "/morip/myblog/imageSave",
					//data: sendingData, //imageboardWriteForm안의 0번째 방에있는 data들을 모두 가져간다
					data : new FormData($('#modifyForm')[0]),
					dataType : "text",
					success : function(fileName) {
						$('.backgroundImg').css(
								'background',
								'url("../storage/' + fileName
										+ '") no-repeat 50% 50%');
						$('.backgroundImg').css('background-size', 'cover');
						bgImgName = fileName;
						$('.bgImgName').val(fileName);
					},
					error : function(err) {
						console.log(err);
					}
				});
			});
	$('#returnBtn').click(function(){
		location.href="view?seq="+seq;
	});
	

   	//해쉬태그 꺼내오기 
    function loadHashtag(){
    $.ajax({
        type:'post',
        url:"/morip/myblog/loadHashtagList",
        data:{'seq':$('.view_seq').val()},
        dataType:'json',
        success:function(data){
           $.each(data.list,function(index,items){
              hashtagText+= items.hashtag+' ';
              console.log(hashtagText);
           })
           if(hashtagText!='null '){  //null이 아닐 때
           	$('#hashtagInputText').val(hashtagText);
           }
           
        },
        error:function(err){
           console.log(err);
        }
     });
}