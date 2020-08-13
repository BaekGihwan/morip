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
$(document).ready(function(){
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
$('#pajuA').click(function(){
	
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
		if(clicks2==1) clicks2--;
	}else {
		$('#pajuDiv').slideUp(1000);
		clicks1--;
	}
});
$('#chuncheonA').click(function(){
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