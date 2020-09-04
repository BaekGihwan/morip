	let modifyFormCheck=false;
	var nickname = $('#nickname').val();
	$('#saveBtn').click(function() {
		let publicOption = 0;
/* 		if ($("#primary-switch").is(":checked")) {
			publicOption = '0';
		} else {
			publicOption = '1';
		} */
		var markupStr = $('#summernote').summernote('code');
		let startdate = $('#startdate').val();
		let enddate = $('#enddate').val();
		let subject = $('#subject').val();
		let backgroundImg = $('#backgroundImg').val();
		let content = markupStr.replace(/&nbsp;/g, " ");
		let hashtag = $('#hashtagInputText').val();
		let jsonData = {
			"startdate" : startdate,
			"enddate" : enddate,
			"content" : content,
			"subject" : subject,
			"backgroundImg" : backgroundImg,
			"publicoption" : publicOption,
			"hashtag" : hashtag
		};
		if (markupStr.trim() == '' ||markupStr.trim()=='<p><br></p>') {
			Swal.fire({
			  icon: 'warning',
			  text: '내용을 입력해주세요!',
			})
		} else {
			$.ajax({
				type : "post",
				url : '/morip/myblog/save',
				//data : 'startdate='+$('#startdate').val()+'&enddate='+$('#enddate').val()+'&content='+content+"&subject="+$('#subject').val()+"&backgroundImg="+$('#backgroundImg').val()+"&publicoption="+publicOption+"&hashtag="+hashtag,
				data : JSON.stringify(jsonData),
				contentType : "application/json",
				success : function() {
					Swal.fire({
						title: '작성 완료!',
				    	text: '여행기 작성이 완료되었습니다!',
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
	});
	
	//미리보기 클릭시
	var previewWindow;
	let content;
	let hashtag;
	$('#previewBtn').click(function(){
		var markupStr = $('#summernote').summernote('code');
		let startdate = $('#startdate').val();
		let enddate = $('#enddate').val();
		let subject = $('#subject').val();
		let backgroundImg = $('#backgroundImg').val();
		content = markupStr.replace(/&nbsp;/g, " ");
		hashtag = $('#hashtagInputText').val();
		let getURL = "startdate="+startdate+"&enddate="+enddate+"&subject="+subject
						+"&backgroundImg="+backgroundImg;
					
		previewWindow = window.open("preview?"+getURL, "미리보기", "width=1300, height=900");
		
	});
	function updateContent(){
		let ex = previewWindow.document.getElementById('content');
		if(ex==""){
			updateContent();
		} else {
			ex.innerHTML = content;
			ex.innerHTML += "<br><br><br><br><div id='hashtagDiv'>"+hashtag+"</div>"
		}
	}