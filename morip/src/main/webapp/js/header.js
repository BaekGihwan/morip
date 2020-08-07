$('.userPhoto').click(function(){ 
	$('.userMenu').toggle();
	$('.userMenu').css({
		position:'absolute',
		top:event.pageY+20,
		left:event.pageX-140,
		width:'200px',
		height:'126px',
		border:'1px solid gray'
	});
});