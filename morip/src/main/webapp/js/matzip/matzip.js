/*
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/

(function($) {

	var	$window = $(window),
		$body = $('body');

	// Breakpoints.
		breakpoints({
			xlarge:   [ '1281px',  '1680px' ],
			large:    [ '981px',   '1280px' ],
			medium:   [ '737px',   '980px'  ],
			small:    [ '481px',   '736px'  ],
			xsmall:   [ '361px',   '480px'  ],
			xxsmall:  [ null,      '360px'  ]
		});

	// Play initial animations on page load.
		$window.on('load', function() {
			window.setTimeout(function() {
				$body.removeClass('is-preload');
			}, 100);
		});

	// Touch?
		if (browser.mobile)
			$body.addClass('is-touch');

	// Forms.
		var $form = $('form');

		// Auto-resizing textareas.
			$form.find('textarea').each(function() {

				var $this = $(this),
					$wrapper = $('<div class="textarea-wrapper"></div>'),
					$submits = $this.find('input[type="submit"]');

				$this
					.wrap($wrapper)
					.attr('rows', 1)
					.css('overflow', 'hidden')
					.css('resize', 'none')
					.on('keydown', function(event) {

						if (event.keyCode == 13
						&&	event.ctrlKey) {

							event.preventDefault();
							event.stopPropagation();

							$(this).blur();

						}

					})
					.on('blur focus', function() {
						$this.val($.trim($this.val()));
					})
					.on('input blur focus --init', function() {

						$wrapper
							.css('height', $this.height());

						$this
							.css('height', 'auto')
							.css('height', $this.prop('scrollHeight') + 'px');

					})
					.on('keyup', function(event) {

						if (event.keyCode == 9)
							$this
								.select();

					})
					.triggerHandler('--init');

				// Fix.
					if (browser.name == 'ie'
					||	browser.mobile)
						$this
							.css('max-height', '10em')
							.css('overflow-y', 'auto');

			});

	// Menu.
		var $menu = $('#menu');

		$menu.wrapInner('<div class="inner"></div>');

		$menu._locked = false;

		$menu._lock = function() {

			if ($menu._locked)
				return false;

			$menu._locked = true;

			window.setTimeout(function() {
				$menu._locked = false;
			}, 350);

			return true;

		};

		$menu._show = function() {

			if ($menu._lock())
				$body.addClass('is-menu-visible');

		};

		$menu._hide = function() {

			if ($menu._lock())
				$body.removeClass('is-menu-visible');

		};

		$menu._toggle = function() {

			if ($menu._lock())
				$body.toggleClass('is-menu-visible');

		};

		$menu
			.appendTo($body)
			.on('click', function(event) {
				event.stopPropagation();
			})
			.on('click', 'a', function(event) {

				var href = $(this).attr('href');

				event.preventDefault();
				event.stopPropagation();

				// Hide.
					$menu._hide();

				// Redirect.
					if (href == '#menu')
						return;

					window.setTimeout(function() {
						window.location.href = href;
					}, 350);

			})
			.append('<a class="close" href="#menu">Close</a>');

		$body
			.on('click', 'a[href="#menu"]', function(event) {

				event.stopPropagation();
				event.preventDefault();

				// Toggle.
					$menu._toggle();

			})
			.on('click', function(event) {

				// Hide.
					$menu._hide();

			})
			.on('keydown', function(event) {

				// Hide on escape.
					if (event.keyCode == 27)
						$menu._hide();

			});

})(jQuery);
var clicks0;
var clicks1;
var clicks2;
var clicks3;
var clicks4;
var clicks5;
var clicks6;
var clicks7;
var clicks8;
var clicks9;
var clicks10;
var clicks11;
var clicks12;
var clicks13;
var clicks14;
var $window = $(this);
	var scrollTop = $window.scrollTop();
	var windowHeight = $window.height();
	var documentHeight = $(document).height();
	var height=1500;
	var pg = $('#pg').val();
	var count = $('#count').val();
	var list = "";
	var loading = false;    //중복실행여부 확인 변수
    var page = 1;   //불러올 페이지
$(document).ready(function(){
	$('#allDiv').hide();
	$('#pajuDiv').hide();
	$('#chuncheonDiv').hide();
	$('#incheonDiv').hide();
	$('#seoulDiv').hide();
	$('#gangneungDiv').hide();
	$('#suwonDiv').hide();
	$('#cheonanDiv').hide();
	$('#andongDiv').hide();
	$('#jeonjuDiv').hide();
	$('#chungjuDiv').hide();
	$('#gyeongjuDiv').hide();
	$('#yeosuDiv').hide();
	$('#jejuDiv').hide();
	$('#busanDiv').hide();
	$('#showSearch').hide();
	clicks0=0;
	clicks1=0;
	clicks2=0;
	clicks3=0;
	clicks4=0;
	clicks5=0;
	clicks6=0;
	clicks7=0;
	clicks8=0;
	clicks9=0;
	clicks10=0;
	clicks11=0;
	clicks12=0;
	clicks13=0;
	clicks14=0;
	
});

$('#allA').click(function(){
	$('#pajuDiv').hide();
	$('#chuncheonDiv').hide();
	/*
	$.ajax({
		type:'get',
		url:'../matzip/matzipList/infinityScroll',
		data:'pg='+$('#pg').val(),
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#pajuImg'+index).prop('src','../image/matzip/'+data.list[index].image3);
				$('#pajuTitle'+index).text(data.list[index].title);
				$('#pajuAddr'+index).text(data.list[index].roadAddress);
				$('#pajuTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	*/
	var number=1;
	var number2=300;
	$(window).scroll(function(){
    console.log("documentHeight:" + documentHeight + " | scrollTop:" + $window.scrollTop() + " | windowHeight: " + windowHeight );
        //if($(window).scrollTop()>=($(document).height() - $(window).height())/number)
        //if($(window).scrollTop()%500==0)
        if($(window).scrollTop()>=600*number+number2)
        {
            if(!loading)    //실행 가능 상태라면?
            {
                loading = true; //실행 불가능 상태로 변경
                console.log(number);
                number++;
                number2 = number2+200;
                loadingPage(); 
            }
        }
    });  
function loadingPage(){
    	$.ajax({
					type: 'post',
					url: '../matzip/infinityScroll',
					data: 'pg='+pg,
					dataType: 'json',
					success: function(data){
						pg++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='<div id="smallDiv" class="hvr-grow">';
							list+='<div id="allTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;overflow:hidden;width:100%;">'+items.title+'</div>';
							list+='<div id="allImgDiv" style="width:100%;height:180px;">';
							list+='<img id="allImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="allAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:7px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="allTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#allDiv').append(list);
						$('#pg').val(pg);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	if(clicks0==0) {
		$('#allDiv').slideDown(1000);
		loadingPage();
		clicks0++;
		if(clicks2==1) clicks2--;
		if(clicks1==1) clicks1--;
	}else {
		$('#allDiv').slideUp(1000);
		clicks0--;
	}
});
$('#pajuA').click(function(){
	$('#allDiv').hide();
	$('#chuncheonDiv').hide();
	
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=파주',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#pajuImg'+index).prop('src','../image/matzip/'+data.list[index].image3);
				$('#pajuTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#pajuReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#pajuAddr'+index).text(data.list[index].roadAddress);
				$('#pajuTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});

	if(clicks1==0) {
		$('#pajuDiv').slideDown(1000);
		clicks1++;
		if(clicks0==1) clicks0--;
		if(clicks2==1) clicks2--;
	}else {
		$('#pajuDiv').slideUp(1000);
		clicks1--;
	}
});
$('#chuncheonA').click(function(){
	$('#allDiv').hide();
	$('#pajuDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=춘천',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#chuncheonImg'+index).prop('src','../image/matzip/'+data.list[index].image1);
				$('#chuncheonTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#chuncheonReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#chuncheonAddr'+index).text(data.list[index].roadAddress);
				$('#chuncheonTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#chuncheonDiv').slideDown(1000);
	if(clicks2==0) {
		$('#chuncheonDiv').slideDown(1000);
		clicks2++;
		if(clicks1==1) clicks1--;
		if(clicks0==1) clicks0--;
	}else {
		$('#chuncheonDiv').slideUp(1000);
		clicks2--;
	}
});
$('#incheonA').click(function(){
	$('#seoulDiv').hide();
	$('#gangneungDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=인천',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#incheonImg'+index).prop('src','../image/matzip/'+data.list[index].image1);
				$('#incheonTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#incheonReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#incheonAddr'+index).text(data.list[index].roadAddress);
				$('#incheonTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#incheonDiv').slideDown(1000);
	if(clicks3==0) {
		$('#incheonDiv').slideDown(1000);
		clicks3++;
		if(clicks4==1) clicks4--;
		if(clicks5==1) clicks5--;
	}else {
		$('#incheonDiv').slideUp(1000);
		clicks3--;
	}
});
$('#seoulA').click(function(){
	$('#incheonDiv').hide();
	$('#gangneungDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=서울',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#seoulImg'+index).prop('src','../image/matzip/'+data.list[index].image1);
				$('#seoulTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#seoulReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#seoulAddr'+index).text(data.list[index].roadAddress);
				$('#seoulTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#seoulDiv').slideDown(1000);
	if(clicks4==0) {
		$('#seoulDiv').slideDown(1000);
		clicks4++;
		if(clicks3==1) clicks3--;
		if(clicks5==1) clicks5--;
	}else {
		$('#seoulDiv').slideUp(1000);
		clicks4--;
	}
});
$('#gangneungA').click(function(){
	$('#incheonDiv').hide();
	$('#seoulDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=강릉',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#gangneungImg'+index).prop('src','../image/matzip/'+data.list[index].image1);
				$('#gangneungTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#gangneungReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#gangneungAddr'+index).text(data.list[index].roadAddress);
				$('#gangneungTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#gangneungDiv').slideDown(1000);
	if(clicks5==0) {
		$('#gangneungDiv').slideDown(1000);
		clicks5++;
		if(clicks3==1) clicks3--;
		if(clicks4==1) clicks4--;
	}else {
		$('#gangneungDiv').slideUp(1000);
		clicks5--;
	}
});
$('#suwonA').click(function(){
	$('#cheonanDiv').hide();
	$('#andongDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=수원',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#suwonImg'+index).prop('src','../image/matzip/'+data.list[index].image1);
				$('#suwonTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#suwonReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#suwonAddr'+index).text(data.list[index].roadAddress);
				$('#suwonTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#suwonDiv').slideDown(1000);
	if(clicks6==0) {
		$('#suwonDiv').slideDown(1000);
		clicks6++;
		if(clicks7==1) clicks7--;
		if(clicks8==1) clicks8--;
	}else {
		$('#suwonDiv').slideUp(1000);
		clicks6--;
	}
});
$('#cheonanA').click(function(){
	$('#andongDiv').hide();
	$('#suwonDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=천안',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#cheonanImg'+index).prop('src','../image/matzip/'+data.list[index].image3);
				$('#cheonanTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#cheonanReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#cheonanAddr'+index).text(data.list[index].roadAddress);
				$('#cheonanTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#cheonanDiv').slideDown(1000);
	if(clicks7==0) {
		$('#cheonanDiv').slideDown(1000);
		clicks7++;
		if(clicks6==1) clicks6--;
		if(clicks8==1) clicks8--;
	}else {
		$('#cheonanDiv').slideUp(1000);
		clicks7--;
	}
});
$('#andongA').click(function(){
	$('#suwonDiv').hide();
	$('#cheonanDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=안동',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#andongImg'+index).prop('src','../image/matzip/'+data.list[index].image1);
				$('#andongTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#andongReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#andongAddr'+index).text(data.list[index].roadAddress);
				$('#andongTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#andongDiv').slideDown(1000);
	if(clicks8==0) {
		$('#andongDiv').slideDown(1000);
		clicks8++;
		if(clicks6==1) clicks6--;
		if(clicks7==1) clicks7--;
	}else {
		$('#andongDiv').slideUp(1000);
		clicks8--;
	}
});
$('#jeonjuA').click(function(){
	$('#chungjuDiv').hide();
	$('#gyeongjuDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=전주',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#jeonjuImg'+index).prop('src','../image/matzip/'+data.list[index].image1);
				$('#jeonjuTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#jeonjuReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#jeonjuAddr'+index).text(data.list[index].roadAddress);
				$('#jeonjuTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#jeonjuDiv').slideDown(1000);
	if(clicks9==0) {
		$('#jeonjuDiv').slideDown(1000);
		clicks9++;
		if(clicks10==1) clicks10--;
		if(clicks11==1) clicks11--;
	}else {
		$('#jeonjuDiv').slideUp(1000);
		clicks9--;
	}
});
$('#chungjuA').click(function(){
	$('#gyeongjuDiv').hide();
	$('#jeonjuDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=충주',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#chungjuImg'+index).prop('src','../image/matzip/'+data.list[index].image1);
				$('#chungjuTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#chungjuReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#chungjuAddr'+index).text(data.list[index].roadAddress);
				$('#chungjuTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#chungjuDiv').slideDown(1000);
	if(clicks10==0) {
		$('#chungjuDiv').slideDown(1000);
		clicks10++;
		if(clicks9==1) clicks9--;
		if(clicks11==1) clicks11--;
	}else {
		$('#chungjuDiv').slideUp(1000);
		clicks10--;
	}
});
$('#gyeongjuA').click(function(){
	$('#jeonjuDiv').hide();
	$('#chungjuDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=경주',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#gyeongjuImg'+index).prop('src','../image/matzip/'+data.list[index].image1);
				$('#gyeongjuTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#gyeongjuReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#gyeongjuAddr'+index).text(data.list[index].roadAddress);
				$('#gyeongjuTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#gyeongjuDiv').slideDown(1000);
	if(clicks11==0) {
		$('#gyeongjuDiv').slideDown(1000);
		clicks11++;
		if(clicks9==1) clicks9--;
		if(clicks10==1) clicks10--;
	}else {
		$('#gyeongjuDiv').slideUp(1000);
		clicks11--;
	}
});
$('#yeosuA').click(function(){
	$('#busanDiv').hide();
	$('#jejuDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=여수',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#yeosuImg'+index).prop('src','../image/matzip/'+data.list[index].image1);
				$('#yeosuTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#yeosuReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#yeosuAddr'+index).text(data.list[index].roadAddress);
				$('#yeosuTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#yeosuDiv').slideDown(1000);
	if(clicks12==0) {
		$('#yeosuDiv').slideDown(1000);
		clicks12++;
		if(clicks13==1) clicks13--;
		if(clicks14==1) clicks14--;
	}else {
		$('#yeosuDiv').slideUp(1000);
		clicks12--;
	}
});
$('#jejuA').click(function(){
	$('#busanDiv').hide();
	$('#yeosuDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=제주',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#jejuImg'+index).prop('src','../image/matzip/'+data.list[index].image1);
				$('#jejuTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#jejuReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#jejuAddr'+index).text(data.list[index].roadAddress);
				$('#jejuTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#jejuDiv').slideDown(1000);
	if(clicks13==0) {
		$('#jejuDiv').slideDown(1000);
		clicks13++;
		if(clicks12==1) clicks12--;
		if(clicks14==1) clicks14--;
	}else {
		$('#jejuDiv').slideUp(1000);
		clicks13--;
	}
});
$('#busanA').click(function(){
	$('#yeosuDiv').hide();
	$('#jejuDiv').hide();
	$.ajax({
		type:'get',
		url:'../matzip/matzipList',
		data:'address=부산',
		dataType:'json',
		success:function(data){
			$.each(data.list,function(index,items){
				$('#busanImg'+index).prop('src','../image/matzip/'+data.list[index].image1);
				$('#busanTitle'+index).text(data.list[index].title);
				$.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#busanReview'+index).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
				$('#busanAddr'+index).text(data.list[index].roadAddress);
				$('#busanTel'+index).text(data.list[index].telephone);
			});
		},
		error:function(err){
			console.log(err);
		}		
	});
	//$('#busanDiv').slideDown(1000);
	if(clicks14==0) {
		$('#busanDiv').slideDown(1000);
		clicks14++;
		if(clicks12==1) clicks12--;
		if(clicks13==1) clicks13--;
	}else {
		$('#busanDiv').slideUp(1000);
		clicks14--;
	}
});
$('#pajuCloseBtn').click(function(){
	$('#pajuDiv').slideUp(1000);
});
$('#chuncheonCloseBtn').click(function(){
	$('#chuncheonDiv').slideUp(1000);
});
$('#incheonCloseBtn').click(function(){
	$('#incheonDiv').slideUp(1000);
});
$('#seoulCloseBtn').click(function(){
	$('#seoulDiv').slideUp(1000);
});
$('#gangneungCloseBtn').click(function(){
	$('#gangneungDiv').slideUp(1000);
});
$('#suwonCloseBtn').click(function(){
	$('#suwonDiv').slideUp(1000);
});
$('#cheonanCloseBtn').click(function(){
	$('#cheonanDiv').slideUp(1000);
});
$('#andongCloseBtn').click(function(){
	$('#andongDiv').slideUp(1000);
});
$('#jeonjuCloseBtn').click(function(){
	$('#jeonjuDiv').slideUp(1000);
});
$('#chungjuCloseBtn').click(function(){
	$('#chungjuDiv').slideUp(1000);
});
$('#gyeongjuCloseBtn').click(function(){
	$('#gyeongjuDiv').slideUp(1000);
});
$('#yeosuCloseBtn').click(function(){
	$('#yeosuDiv').slideUp(1000);
});
$('#jejuCloseBtn').click(function(){
	$('#jejuDiv').slideUp(1000);
});
$('#busanCloseBtn').click(function(){
	$('#busanDiv').slideUp(1000);
});
$('#searchBtn').click(function(){
	$('#tiles').hide();
	$('#showSearch').show();
});
/*
$('#smallDiv').click(function(){
	//location.href='../matzip/test2.jsp';
	alert($(this).children().first().text());
});
*/
 $('#allDiv').on('click','#smallDiv', function(){
 	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
 $('#pajuDiv').on('click','#smallDiv', function(){
 	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
 $('#chuncheonDiv').on('click','#smallDiv', function(){
 	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
 $('#incheonDiv').on('click','#smallDiv', function(){
 	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
 $('#seoulDiv').on('click','#smallDiv', function(){
 	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
 $('#gangneungDiv').on('click','#smallDiv', function(){
 	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
 $('#suwonDiv').on('click','#smallDiv', function(){
 	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
 $('#cheonanDiv').on('click','#smallDiv', function(){
 	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
  $('#andongDiv').on('click','#smallDiv', function(){
  	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
  $('#jeonjuDiv').on('click','#smallDiv', function(){
  	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
  $('#chungjuDiv').on('click','#smallDiv', function(){
  	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
  $('#gyeongjuDiv').on('click','#smallDiv', function(){
 	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
  $('#yeosuDiv').on('click','#smallDiv', function(){
  	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
 $('#jejuDiv').on('click','#smallDiv', function(){
 	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });
 $('#busanDiv').on('click','#smallDiv', function(){
 	location.href='../matzip/matzipView?title='+$(this).children().first().text();
 	//alert($(this).children().first().text());
 });