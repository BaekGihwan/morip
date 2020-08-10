var stepPg = $('#stepPg').val();
$('document').ready(function(){
  //step 처리

  if(stepPg==1){
    $('.step1').css('background-color','#d7ccc8');
    $('.step2').css('background-color','#e9eae4');
    $('.step3').css('background-color','#e9eae4');
    $('.step4').css('background-color','#e9eae4');
  } else if(stepPg==2){
    $('.step1').css('background-color','#e9eae4');
    $('.step2').css('background-color','#d7ccc8');
    $('.step3').css('background-color','#e9eae4');
    $('.step4').css('background-color','#e9eae4');
  } else if(stepPg==3){
    $('.step1').css('background-color','#e9eae4');
    $('.step2').css('background-color','#e9eae4');
    $('.step3').css('background-color','#d7ccc8');
    $('.step4').css('background-color','#e9eae4');
  } else if(stepPg==4){
    $('.step1').css('background-color','#e9eae4');
    $('.step2').css('background-color','#e9eae4');
    $('.step3').css('background-color','#e9eae4');
    $('.step4').css('background-color','#d7ccc8');
  }

  //dayList 처리

  let day = 5;
  let list='';
  for(var i=0;i<day;i++){
    list+='<div class="dayList'+i+'" id="dayList">DAY '+(i+1)+'</div>'
  }
  $('.dayList').html(list);

});
//이전과 다음 버튼 기능
$('#backwardBtn').click(function(){
  location.href="travlesWrite"+(stepPg-1);
});
$('#forwardBtn').click(function(){
  location.href="travlesWrite"+(Number(stepPg)+1);
});
