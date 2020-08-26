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
	$('#allDiv2').hide();
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
	$('#pg').val(1);
	$('#allDiv').empty();
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
	var pg = $('#pg').val();
	var loading = false;
	var number=1;
	var number2=300;
	loadingPage();
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
		//$('#allDiv').empty();
		$('#allDiv2').slideDown(1000);
		//loadingPage();
		clicks0++;
		if(clicks2==1) clicks2--;
		if(clicks1==1) clicks1--;
	}else {
		$('#allDiv2').slideUp(1000);
		$('#allDiv').empty();
		$('#pg').val(1);
		//loading = false;
		clicks0--;
	}
});
$('#pajuA').click(function(){
	$('#pg').val(1);
	$('#pajuMiddleDiv').empty();
	$('#allDiv2').hide();
	$('#chuncheonDiv').hide();
	
	var loading = false;
	var number=1;
	var number2=300;
	var pg1= $('#pg').val();
	loadingPage2();
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
                loadingPage2(); 
            }
        }
    });  
function loadingPage2(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg1+'&address=파주',
					dataType: 'json',
					success: function(data){
						pg1++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="pajuTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="pajuImgDiv" style="width:100%;height:160px;">';
							list+='<img id="pajuImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="pajuReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="pajuAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="pajuTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#pajuMiddleDiv').append(list);
						$('#pg').val(pg1);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#pajuTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	if(clicks1==0) {
		$('#pajuDiv').slideDown(1000);
		clicks1++;
		if(clicks0==1) clicks0--;
		if(clicks2==1) clicks2--;
	}else {
		$('#pajuDiv').slideUp(1000);
		$('#pg').val(1);
		clicks1--;
	}
});
$('#chuncheonA').click(function(){
	$('#pg').val(1);
	$('#chuncheonMiddleDiv').empty();
	$('#allDiv2').hide();
	$('#pajuDiv').hide();
	
	var loading = false;
	var number=1;
	var number2=300;
	var pg2= $('#pg').val();
	loadingPage3();
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
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg2+'&address=춘천',
					dataType: 'json',
					success: function(data){
						pg2++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="chuncheonTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="chuncheonImgDiv" style="width:100%;height:160px;">';
							list+='<img id="chuncheonImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="chuncheonReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="chuncheonAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="chuncheonTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#chuncheonMiddleDiv').append(list);
						$('#pg').val(pg2);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
    
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#chuncheonTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#chuncheonDiv').slideDown(1000);
	if(clicks2==0) {
		$('#chuncheonDiv').slideDown(1000);
		clicks2++;
		if(clicks1==1) clicks1--;
		if(clicks0==1) clicks0--;
	}else {
		$('#chuncheonDiv').slideUp(1000);
		$('#pg').val(1);
		clicks2--;
	}
});
$('#incheonA').click(function(){
	$('#pg').val(1);
	$('#incheonMiddleDiv').empty();
	$('#seoulDiv').hide();
	$('#gangneungDiv').hide();
	
	var loading = false;
	var number=1;
	var number2=300;
	var pg3= $('#pg').val();
	loadingPage3();
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
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg3+'&address=인천',
					dataType: 'json',
					success: function(data){
						pg3++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="incheonTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="incheonImgDiv" style="width:100%;height:160px;">';
							list+='<img id="incheonImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="incheonReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="incheonAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="incheonTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#incheonMiddleDiv').append(list);
						$('#pg').val(pg3);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#incheonTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#incheonDiv').slideDown(1000);
	if(clicks3==0) {
		$('#incheonDiv').slideDown(1000);
		clicks3++;
		if(clicks4==1) clicks4--;
		if(clicks5==1) clicks5--;
	}else {
		$('#incheonDiv').slideUp(1000);
		$('#pg').val(1);
		clicks3--;
	}
});
$('#seoulA').click(function(){
	$('#pg').val(1);
	$('#seoulMiddleDiv').empty();
	$('#incheonDiv').hide();
	$('#gangneungDiv').hide();
	
	var loading = false;
	var number=1;
	var number2=300;
	var pg4= $('#pg').val();
	loadingPage3();
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
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg4+'&address=서울',
					dataType: 'json',
					success: function(data){
						pg4++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="seoulTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="seoulImgDiv" style="width:100%;height:160px;">';
							list+='<img id="seoulImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="seoulReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="seoulAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="seoulTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#seoulMiddleDiv').append(list);
						$('#pg').val(pg4);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#seoulTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#seoulDiv').slideDown(1000);
	if(clicks4==0) {
		$('#seoulDiv').slideDown(1000);
		clicks4++;
		if(clicks3==1) clicks3--;
		if(clicks5==1) clicks5--;
	}else {
		$('#seoulDiv').slideUp(1000);
		$('#pg').val(1);
		clicks4--;
	}
});
$('#gangneungA').click(function(){
	$('#pg').val(1);
	$('#gangneungMiddleDiv').empty();
	$('#incheonDiv').hide();
	$('#seoulDiv').hide();
	
	var loading = false;
	var number=1;
	var number2=300;
	var pg5= $('#pg').val();
	loadingPage3();
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
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg5+'&address=강릉',
					dataType: 'json',
					success: function(data){
						pg5++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="gangneungTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="gangneungImgDiv" style="width:100%;height:160px;">';
							list+='<img id="gangneungImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="gangneungReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="gangneungAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="gangneungTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#gangneungMiddleDiv').append(list);
						$('#pg').val(pg5);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#gangneungTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#gangneungDiv').slideDown(1000);
	if(clicks5==0) {
		$('#gangneungDiv').slideDown(1000);
		clicks5++;
		if(clicks3==1) clicks3--;
		if(clicks4==1) clicks4--;
	}else {
		$('#gangneungDiv').slideUp(1000);
		$('#pg').val(1);
		clicks5--;
	}
});
$('#suwonA').click(function(){
	$('#pg').val(1);
	$('#suwonMiddleDiv').empty();
	$('#cheonanDiv').hide();
	$('#andongDiv').hide();
	
	var loading = false;
	var number=1;
	var number2=300;
	var pg6= $('#pg').val();
	loadingPage3();
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
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg6+'&address=수원',
					dataType: 'json',
					success: function(data){
						pg6++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="suwonTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="suwonImgDiv" style="width:100%;height:160px;">';
							list+='<img id="suwonImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="suwonReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="suwonAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="suwonTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#suwonMiddleDiv').append(list);
						$('#pg').val(pg6);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#suwonTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#suwonDiv').slideDown(1000);
	if(clicks6==0) {
		$('#suwonDiv').slideDown(1000);
		clicks6++;
		if(clicks7==1) clicks7--;
		if(clicks8==1) clicks8--;
	}else {
		$('#suwonDiv').slideUp(1000);
		$('#pg').val(1);
		clicks6--;
	}
});
$('#cheonanA').click(function(){
	$('#pg').val(1);
	$('#cheonanMiddleDiv').empty();
	$('#andongDiv').hide();
	$('#suwonDiv').hide();
	
	var loading = false;
	var number=1;
	var number2=300;
	var pg7= $('#pg').val();
	loadingPage3();
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
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg7+'&address=천안',
					dataType: 'json',
					success: function(data){
						pg7++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="cheonanTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="cheonanImgDiv" style="width:100%;height:160px;">';
							list+='<img id="cheonanImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="cheonanReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="cheonanAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="cheonanTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#cheonanMiddleDiv').append(list);
						$('#pg').val(pg7);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#cheonanTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#cheonanDiv').slideDown(1000);
	if(clicks7==0) {
		$('#cheonanDiv').slideDown(1000);
		clicks7++;
		if(clicks6==1) clicks6--;
		if(clicks8==1) clicks8--;
	}else {
		$('#cheonanDiv').slideUp(1000);
		$('#pg').val(1);
		clicks7--;
	}
});
$('#andongA').click(function(){
	$('#pg').val(1);
	$('#andongMiddleDiv').empty();
	$('#suwonDiv').hide();
	$('#cheonanDiv').hide();
	
	var loading = false;
	var number=1;
	var number2=300;
	var pg8= $('#pg').val();
	loadingPage3();
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
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg8+'&address=안동시',
					dataType: 'json',
					success: function(data){
						pg8++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="andongTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="andongImgDiv" style="width:100%;height:160px;">';
							list+='<img id="andongImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="andongReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="andongAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="andongTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#andongMiddleDiv').append(list);
						$('#pg').val(pg8);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#andongTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#andongDiv').slideDown(1000);
	if(clicks8==0) {
		$('#andongDiv').slideDown(1000);
		clicks8++;
		if(clicks6==1) clicks6--;
		if(clicks7==1) clicks7--;
	}else {
		$('#andongDiv').slideUp(1000);
		$('#pg').val(1);
		clicks8--;
	}
});
$('#jeonjuA').click(function(){
	$('#pg').val(1);
	$('#jeonjuMiddleDiv').empty();
	$('#chungjuDiv').hide();
	$('#gyeongjuDiv').hide();
	
	var loading = false;
	var number=2;
	var number2=300;
	var pg9= $('#pg').val();
	loadingPage3();
	$(window).scroll(function(){
    console.log("documentHeight:" + documentHeight + " | scrollTop:" + $window.scrollTop() + " | windowHeight: " + windowHeight );
        //if($(window).scrollTop()>=($(document).height() - $(window).height())/number)
        //if($(window).scrollTop()%500==0)
        if($(window).scrollTop()>=1000+number2*number)
        {
            if(!loading)    //실행 가능 상태라면?
            {
                loading = true; //실행 불가능 상태로 변경
                console.log(number);
                number++;
                number2 = number2+200;
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg9+'&address=전주',
					dataType: 'json',
					success: function(data){
						pg9++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="jeonjuTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="jeonjuImgDiv" style="width:100%;height:160px;">';
							list+='<img id="jeonjuImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="jeonjuReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="jeonjuAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="jeonjuTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#jeonjuMiddleDiv').append(list);
						$('#pg').val(pg9);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#jeonjuTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#jeonjuDiv').slideDown(1000);
	if(clicks9==0) {
		$('#jeonjuDiv').slideDown(1000);
		clicks9++;
		if(clicks10==1) clicks10--;
		if(clicks11==1) clicks11--;
	}else {
		$('#jeonjuDiv').slideUp(1000);
		$('#pg').val(1);
		clicks9--;
	}
});
$('#chungjuA').click(function(){
	$('#pg').val(1);
	$('#chungjuMiddleDiv').empty();
	$('#gyeongjuDiv').hide();
	$('#jeonjuDiv').hide();
	
	var loading = false;
	var number=2;
	var number2=300;
	var pg10= $('#pg').val();
	loadingPage3();
	$(window).scroll(function(){
    console.log("documentHeight:" + documentHeight + " | scrollTop:" + $window.scrollTop() + " | windowHeight: " + windowHeight );
        //if($(window).scrollTop()>=($(document).height() - $(window).height())/number)
        //if($(window).scrollTop()%500==0)
        if($(window).scrollTop()>=1000+number2*number)
        {
            if(!loading)    //실행 가능 상태라면?
            {
                loading = true; //실행 불가능 상태로 변경
                console.log(number);
                number++;
                number2 = number2+200;
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg10+'&address=충주',
					dataType: 'json',
					success: function(data){
						pg10++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="chungjuTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="chungjuImgDiv" style="width:100%;height:160px;">';
							list+='<img id="chungjuImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="chungjuReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="chungjuAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="chungjuTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#chungjuMiddleDiv').append(list);
						$('#pg').val(pg10);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#chungjuTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#chungjuDiv').slideDown(1000);
	if(clicks10==0) {
		$('#chungjuDiv').slideDown(1000);
		clicks10++;
		if(clicks9==1) clicks9--;
		if(clicks11==1) clicks11--;
	}else {
		$('#chungjuDiv').slideUp(1000);
		$('#pg').val(1);
		clicks10--;
	}
});
$('#gyeongjuA').click(function(){
	$('#pg').val(1);
	$('#gyeongjuMiddleDiv').empty();
	$('#jeonjuDiv').hide();
	$('#chungjuDiv').hide();
	
	var loading = false;
	var number=2;
	var number2=300;
	var pg11= $('#pg').val();
	loadingPage3();
	$(window).scroll(function(){
    console.log("documentHeight:" + documentHeight + " | scrollTop:" + $window.scrollTop() + " | windowHeight: " + windowHeight );
        //if($(window).scrollTop()>=($(document).height() - $(window).height())/number)
        //if($(window).scrollTop()%500==0)
        if($(window).scrollTop()>=1000+number2*number)
        {
            if(!loading)    //실행 가능 상태라면?
            {
                loading = true; //실행 불가능 상태로 변경
                console.log(number);
                number++;
                number2 = number2+200;
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg11+'&address=경주',
					dataType: 'json',
					success: function(data){
						pg11++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="gyeongjuTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="gyeongjuImgDiv" style="width:100%;height:160px;">';
							list+='<img id="gyeongjuImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="gyeongjuReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="gyeongjuAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="gyeongjuTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#gyeongjuMiddleDiv').append(list);
						$('#pg').val(pg11);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#gyeongjuTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#gyeongjuDiv').slideDown(1000);
	if(clicks11==0) {
		$('#gyeongjuDiv').slideDown(1000);
		clicks11++;
		if(clicks9==1) clicks9--;
		if(clicks10==1) clicks10--;
	}else {
		$('#gyeongjuDiv').slideUp(1000);
		$('#pg').val(1);
		clicks11--;
	}
});
$('#yeosuA').click(function(){
	$('#pg').val(1);
	$('#yeosuMiddleDiv').empty();
	$('#busanDiv').hide();
	$('#jejuDiv').hide();
	
	var loading = false;
	var number=2;
	var number2=300;
	var pg12= $('#pg').val();
	loadingPage3();
	$(window).scroll(function(){
    console.log("documentHeight:" + documentHeight + " | scrollTop:" + $window.scrollTop() + " | windowHeight: " + windowHeight );
        //if($(window).scrollTop()>=($(document).height() - $(window).height())/number)
        //if($(window).scrollTop()%500==0)
        if($(window).scrollTop()>=1200+number2*number)
        {
            if(!loading)    //실행 가능 상태라면?
            {
                loading = true; //실행 불가능 상태로 변경
                console.log(number);
                number++;
                number2 = number2+200;
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg12+'&address=여수',
					dataType: 'json',
					success: function(data){
						pg12++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="yeosuTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="yeosuImgDiv" style="width:100%;height:160px;">';
							list+='<img id="yeosuImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="yeosuReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="yeosuAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="yeosuTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#yeosuMiddleDiv').append(list);
						$('#pg').val(pg12);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#yeosuTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#yeosuDiv').slideDown(1000);
	if(clicks12==0) {
		$('#yeosuDiv').slideDown(1000);
		clicks12++;
		if(clicks13==1) clicks13--;
		if(clicks14==1) clicks14--;
	}else {
		$('#yeosuDiv').slideUp(1000);
		$('#pg').val(1);
		clicks12--;
	}
});
$('#jejuA').click(function(){
	$('#pg').val(1);
	$('#jejuMiddleDiv').empty();
	$('#busanDiv').hide();
	$('#yeosuDiv').hide();
	
	var loading = false;
	var number=2;
	var number2=300;
	var pg13= $('#pg').val();
	loadingPage3();
	$(window).scroll(function(){
    console.log("documentHeight:" + documentHeight + " | scrollTop:" + $window.scrollTop() + " | windowHeight: " + windowHeight );
        //if($(window).scrollTop()>=($(document).height() - $(window).height())/number)
        //if($(window).scrollTop()%500==0)
        if($(window).scrollTop()>=1200+number2*number)
        {
            if(!loading)    //실행 가능 상태라면?
            {
                loading = true; //실행 불가능 상태로 변경
                console.log(number);
                number++;
                number2 = number2+200;
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg13+'&address=제주',
					dataType: 'json',
					success: function(data){
						pg13++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="jejuTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="jejuImgDiv" style="width:100%;height:160px;">';
							list+='<img id="jejuImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="jejuReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="jejuAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="jejuTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#jejuMiddleDiv').append(list);
						$('#pg').val(pg13);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#jejuTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#jejuDiv').slideDown(1000);
	if(clicks13==0) {
		$('#jejuDiv').slideDown(1000);
		clicks13++;
		if(clicks12==1) clicks12--;
		if(clicks14==1) clicks14--;
	}else {
		$('#jejuDiv').slideUp(1000);
		$('#pg').val(1);
		clicks13--;
	}
});
$('#busanA').click(function(){
	$('#pg').val(1);
	$('#busanMiddleDiv').empty();
	$('#yeosuDiv').hide();
	$('#jejuDiv').hide();
	
	var loading = false;
	var number=2;
	var number2=300;
	var pg14= $('#pg').val();
	loadingPage3();
	$(window).scroll(function(){
    console.log("documentHeight:" + documentHeight + " | scrollTop:" + $window.scrollTop() + " | windowHeight: " + windowHeight );
        //if($(window).scrollTop()>=($(document).height() - $(window).height())/number)
        //if($(window).scrollTop()%500==0)
        if($(window).scrollTop()>=1200+number2*number)
        {
            if(!loading)    //실행 가능 상태라면?
            {
                loading = true; //실행 불가능 상태로 변경
                console.log(number);
                number++;
                number2 = number2+200;
                loadingPage3(); 
            }
        }
    });  
function loadingPage3(){
    	$.ajax({
					type: 'post',
					url: '../matzip/matzipList',
					data: 'pg='+pg14+'&address=부산',
					dataType: 'json',
					success: function(data){
						pg14++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							$.ajax({
								type:'post',
								url:'../matzip/getReviewCount',
								data:'keyword='+items.title,
								dataType:'text',
								success:function(data){
									$.ajax({
										type:'post',
										url:'../matzip/updateReviewCount',
										data:'title='+items.title+'&reviewCount='+data,
										success:function(){
										},
										error:function(err){
											console.log(err);
										}
										
									});
								},
								error:function(err){
									console.log(err);
								}
							});
							//처음 시작을 여는 div
							if(tempNumber%4==0){
								height+=380;
								//$('.content').css('height',height+'px');
								list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
							}
							list+='&emsp;<div id="smallDiv" class="hvr-grow" style="width:22%;">';
							list+='<div id="busanTitle" style="font-size:15pt;font-weight:bold;margin-left:10px;">'+items.title+'</div>';
							list+='<div id="busanImgDiv" style="width:100%;height:160px;">';
							list+='<img id="busanImg" src="../image/matzip/'+items.image3+'" width="100%" height="180px"></div>';
							list+='<br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i><div id="busanReview" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;">'+items.reviewCount+'</div></div>';
            				list+='<div style="display:flex;padding:5px;margin-top:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="busanAddr" style="font-size:10pt;font-weight:bold;height:30px;">'+items.address+'</div></div>';
            				list+='<div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="busanTel" style="font-size:10pt;font-weight:bold;">'+items.telephone+'</div></div>';
            				list+='</div>';
            				//닫아주는 div
							if(tempNumber%4==3){
								list+='</div>';
							}
							tempNumber++;
						});
						$('#busanMiddleDiv').append(list);
						$('#pg').val(pg14);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
	
	/*
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
						$.ajax({
							type:'post',
							url:'../matzip/updateReviewCount',
							data:'title='+$('#busanTitle'+index).text()+'&reviewCount='+data,
							success:function(){
							},
							error:function(err){
								console.log(err);
							}
							
						});
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
	*/
	//$('#busanDiv').slideDown(1000);
	if(clicks14==0) {
		$('#busanDiv').slideDown(1000);
		clicks14++;
		if(clicks12==1) clicks12--;
		if(clicks13==1) clicks13--;
	}else {
		$('#busanDiv').slideUp(1000);
		$('#pg').val(1);
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