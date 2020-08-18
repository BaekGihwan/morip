<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/hover.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script src="https://kit.fontawesome.com/75c3f69c14.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<div id="matzipView">

<input type="hidden" id="title" value="${title }">
<input type="hidden" id="pg" value="1">


<div id="matzipImageSlider" style="height:250px;overflow:hidden;" >
<div class="hvr-grow-shadow" style="width:100%;height:250px"><img class="linkImg0"  style="width:100%;height:250px;background-image:url('../image/matzip/unnamed.jpg');background-size:100% 100%;'"></div>
<div class="hvr-grow-shadow" style="width:100%;height:250px"><img class="linkImg1"  style="width:100%;height:250px;background-image:url('../image/matzip/unnamed.jpg');background-size:100% 100%;"></div>
<div class="hvr-grow-shadow" style="width:100%;height:250px"><img class="linkImg2"  style="width:100%;height:250px;background-image:url('../image/matzip/unnamed.jpg');background-size:100% 100%;"></div>
<div class="hvr-grow-shadow" style="width:100%;height:250px"><img class="linkImg3"  style="width:100%;height:250px;background-image:url('../image/matzip/unnamed.jpg');background-size:100% 100%;"></div>
<div class="hvr-grow-shadow" style="width:100%;height:250px"><img class="linkImg4"  style="width:100%;height:250px;background-image:url('../image/matzip/unnamed.jpg');background-size:100% 100%;"></div>
<div class="hvr-grow-shadow" style="width:100%;height:250px"><img class="linkImg5"  style="width:100%;height:250px;background-image:url('../image/matzip/unnamed.jpg');background-size:100% 100%;"></div>
<div class="hvr-grow-shadow" style="width:100%;height:250px"><img class="linkImg6"  style="width:100%;height:250px;background-image:url('../image/matzip/unnamed.jpg');background-size:100% 100%;"></div>
<div class="hvr-grow-shadow" style="width:100%;height:250px"><img class="linkImg7"  style="width:100%;height:250px;background-image:url('../image/matzip/unnamed.jpg');background-size:100% 100%;"></div>
</div>

<!-- <div style="font-size:30px;width:100%;height:100%"><i class="fas fa-chevron-left prev" style=";float:left"></i> -->
<!-- <i class="fas fa-chevron-right next" style=";float:right"></i></div> -->


<!-- <div id="" style="width:100%;height:250px;display:flex;"> -->
<!-- <div id="matzipImage" class="hvr-grow-shadow" style="width:100%;height:400px;"></div> -->
<!-- </div> -->
<div style="height:530px;">
<div style="width:60%;height:500px;border-top:3px solid gray;border-left:1px solid #D5D5D5;border-right:1px solid #D5D5D5;border-bottom:1px solid #D5D5D5;position:absolute;left:20%;top:300px;background-color:white;">
<div id="matzipTitle" style="width:500px;height:50px;/* left:33%;*/top:15%;position:relative;background-color:white;text-align:center;margin:auto;font-size:25pt;border-bottom:1px solid gray;overflow:hidden;"></div>
<div id="matzipCategory" style="width:30%;margin:auto;top:15%;position:relative;font-size:15pt;text-align:center;padding:5px;"></div>

<div style="display:flex;position:relative;left:10%;top:20%;">
   <div style="width:40%;">
      <div style="width:100%;height:40px;position:relative;left:13%;display:flex;"><i class="fas fa-phone-alt" style="margin:6px;"></i><div id="matzipTelephone" style="margin:5px;color:gray;"></div></div>
      <div style="width:100%;height:50px;position:relative;left:13%;top:5%;display:flex;"><i class="fas fa-map-marker-alt" style="margin:6px;"></i><div id="matzipRoadAddress" style="margin:5px;color:gray;"></div></div>
      <div style="width:100%;height:50px;position:relative;left:13%;top:5%;display:flex;"><div style="border:1px solid #EAEAEA;width:20px;height:15px;margin:5px;border-radius:7px;font-size:7pt;padding:2px;color:gray;">지번</div><div id="matzipAddress" style="margin:5px;color:gray;"></div></div>
      <div style="width:100%;height:50px;position:relative;left:13%;top:5%;display:flex;"><i class="fas fa-clock" style="margin:6px;"></i><div id="matzipTime" style="margin:5px;color:gray;"></div></div>
      <div style="width:100%;height:50px;position:relative;left:13%;top:5%;display:flex;"><i class="fas fa-link" style="margin:6px;"></i><div style="margin-left:10px;"><a id="matzipLink" href="" style="color:gray;"></a></div></div>
   </div>
   <div style="width:40%;margin-left:10%;">
      <div  id="map" style="width:80%;height:250px;/* position:absolute;left:550px;top:200px; */"></div>
   </div>
</div>
<!-- <div style="width:60%;height:80px;position:relative;left:13%;top:25%;display:flex;"><div style="margin:10px;"><img src="../images/homeIcon.png" width="20px"></div><div style="margin:10px;"><a href="http://instagram.com/godosik92" style="color:gray;">http://instagram.com/godosik92</a></div></div>
<div style="width:35%;height:250px;position:absolute;left:550px;top:200px;"><img src="../images/test111.png" width="345px" height="250px"></div>
<div style="width:40%;height:60px;position:relative;left:13%;top:30%;display:flex;"><div style="margin:5px;"><img src="../images/zidoIcon.png" width="20px"></div><div style="margin:5px;color:gray;">서울 송파구 백제고분로45길 28</div></div>
<div style="width:40%;height:60px;position:relative;left:13%;top:35%;display:flex;"><div style="border:1px solid #EAEAEA;width:20px;height:15px;margin:5px;border-radius:7px;font-size:7pt;padding:2px;color:gray;">지번</div><div style="margin:5px;color:gray;">송파동 55-7</div></div> -->
</div>
</div>

<!-- <div style="border:1px solid red;position:absolute;width:100%;"> -->
<div id="reviewOutDiv" style="width:60%;border-top:3px solid gray;border-left:1px solid #D5D5D5;border-right:1px solid #D5D5D5;border-bottom:1px solid #D5D5D5;background-color:white;left:20%; margin: 0 auto;">
<div style="color:gray;font-size:22pt;"><div style="margin:20px;">블로그 리뷰</div><center><hr width="97%"></center></div>
<!-- <div id="reviewInDiv" style="width:100%;height:200px;display:flex;position:relative;">
<div style="border:1px solid black;width:17%;height:130px;margin:35px;"></div>
<div style="border:1px solid black;width:55%;height:30px;margin:25px;position:relative;left:5px;top:0px;"></div>
<div style="border:1px solid black;width:65%;height:60px;position:absolute;left:235px;top:75px;margin-left:5%;"></div>
<div style="border-right:1px solid gray;height:20px;position:absolute;padding:10px;left:220px;top:150px;margin-left:5%;">샐리의 식탁</div><div style="height:20px;position:absolute;padding:10px;left:328px;top:150px;margin-left:5%;">2020.03.24</div>
</div>
<div style="width:100%;height:200px;display:flex;position:relative;">
<div style="border:1px solid black;width:17%;height:130px;margin:35px;"></div>
<div style="border:1px solid black;width:55%;height:30px;margin:25px;position:relative;left:5px;top:0px;"></div>
<div style="border:1px solid black;width:65%;height:60px;position:absolute;left:235px;top:75px;margin-left:5%;"></div>
<div style="border-right:1px solid gray;height:20px;position:absolute;padding:10px;left:220px;top:150px;margin-left:5%;">샐리의 식탁</div><div style="height:20px;position:absolute;padding:10px;left:328px;top:150px;margin-left:5%;">2020.03.24</div>
</div>
<div style="width:100%;height:200px;display:flex;position:relative;">
<div style="border:1px solid black;width:17%;height:130px;margin:35px;"></div>
<div style="border:1px solid black;width:55%;height:30px;margin:25px;position:relative;left:5px;top:0px;"></div>
<div style="border:1px solid black;width:65%;height:60px;position:absolute;left:235px;top:75px;margin-left:5%;"></div>
<div style="border-right:1px solid gray;height:20px;position:absolute;padding:10px;left:220px;top:150px;margin-left:5%;">샐리의 식탁</div><div style="height:20px;position:absolute;padding:10px;left:328px;top:150px;margin-left:5%;">2020.03.24</div>
</div>
<div style="width:100%;height:200px;display:flex;position:relative;">
<div style="border:1px solid black;width:17%;height:130px;margin:35px;"></div>
<div style="border:1px solid black;width:55%;height:30px;margin:25px;position:relative;left:5px;top:0px;"></div>
<div style="border:1px solid black;width:65%;height:60px;position:absolute;left:235px;top:75px;margin-left:5%;"></div>
<div style="border-right:1px solid gray;height:20px;position:absolute;padding:10px;left:220px;top:150px;margin-left:5%;">샐리의 식탁</div><div style="height:20px;position:absolute;padding:10px;left:328px;top:150px;margin-left:5%;">2020.03.24</div>
</div> -->
</div>

</div> <!-- // 메인 닫히는곳 -->
<br><br><br>

</body>
<!-- </div> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=352d90d2c3a60113b4d24ad68f0b720d&libraries=services"></script>

<script type="text/javascript">
let result1;

var imgLink1;
var imgLink2;
var imgLink3;
var imgLink4;
var imgLink5;
var imgLink6;
var imgLink7;
var imgLink8;
  
var imgLink = new Array();

var $window = $(this);
var scrollTop = $window.scrollTop();
var windowHeight = $window.height();
var documentHeight = $(document).height();
var height=1500;
var pg = $('#pg').val();
//var count = $('#count').val();
var list = "";
var loading = false;    //중복실행여부 확인 변수
var page = 1;   //불러올 페이지

$(document).ready(function(){
	$('#matzipImageSlider').css('width',$(window).width());
   //alert($('#title').val());
   var titleSend = $('#title').val();
   titleSend=titleSend.replace('<b>','');
   titleSend=titleSend.replace('</b>','');
   //alert(titleSend);
   $.ajax({
      type:'post',
      url:'../matzip/matzipSearch',
      data:'matzipText='+titleSend,
      dataType:'json',
      success:function(data){
         //alert(data.matzip.address);
         $('#matzipTitle').html(data.list[0].title);
         $('#matzipCategory').text(data.list[0].category);
         $('#matzipRoadAddress').text(data.list[0].roadAddress);
         $('#matzipAddress').text(data.list[0].address);
         $('#matzipLink').text(data.list[0].link);
         $('#matzipLink').prop('href',data.list[0].link);
        
         result1='success';
            
            
            if(result1=='success'){
                    //$('#ex1').css('font-family',"'Noto Sans KR', sans-serif");
                     //alert($('#matzipAddress').text());
                    var matzipAddress=$('#matzipAddress').text()
                  
                    // 주소-좌표 변환 객체를 생성합니다
                    var geocoder = new kakao.maps.services.Geocoder();
                    
                    // 주소로 좌표를 검색합니다
                    geocoder.addressSearch(matzipAddress, function(result, status) {
                    
                        // 정상적으로 검색이 완료됐으면 
                         if (status === kakao.maps.services.Status.OK) {
                          console.log(result);
                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    
                            // 결과값으로 받은 위치를 마커로 표시합니다
                          var marker = new kakao.maps.Marker({
                                map: map,
                                position: coords
                            });
                           
                    
                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                            map.setCenter(coords);
                        }
                        
        
                    });
                    alert($('#matzipTitle').text());
                    
                    $.ajax({
                          type:'post',
                           url:'../matzip/matzipImage',
                           data:{'matzipTitle': $('#matzipTitle').text()+' 맛집'},
                           dataType:'json',
                          success:function(data){
                        	  alert($('#matzipTitle').text());
                             $.each(data.list,function(index,items){
                            	 
                            	imgLink[index]=data.list[index].link;
                            	 
//                             $('#linkImg'+index).prop('src',data.list[index].link);
								
                                   $('.linkImg'+index).css({'background-image':'url('+items.link+')'})
                                   $('.linkImg'+index).css({'background-size':'100% 100%'})
									
                                   
                                   
                                   
                                }); 
                             /* $.each(data.list,function(index,items){
                                $('<a/>',{
//                                    href:items.link
                                }).append($('<img/>',{
                                   class:'img',
                                   src:items.link,
                                   width:'20%',
                                   height:'100%'
                                }))   .appendTo($('#matzipImage'));
                                
                                
                                
                             }); */
//                              
                             /* $('#matzipImage').on('click','.img',function(){
                                   let url = $('.img').attr('src');
                                   let imgWindow = window.open(url,"","width=500,height=500");
                                }); */
//                              
                          },
                          error:function(err){
                               console.log(err);
                            }
                       });
                    
                    }
                    
                    var mapContainer = document.getElementById('map'),
                     mapOption = {
                         center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                         level: 3 // 지도의 확대 레벨
                     };
                     
                     // 지도를 생성합니다    
                    var map = new kakao.maps.Map(mapContainer, mapOption);

      },
      error:function(err){
         console.log(err);
      }
   });
   
   
   $.ajax({
      type:'post',
      url:'../matzip/getMatzipView2',
      data:'title='+$('#title').val(),
      dataType:'json',
      success:function(data){
         $('#matzipTelephone').text(data.matzip.telephone);
         $('#matzipTime').text(data.matzip.time);
         /* $('#img1').prop('src','../image/matzip/'+data.matzip.image1);
         $('#img2').prop('src','../image/matzip/'+data.matzip.image2);
         $('#img3').prop('src','../image/matzip/'+data.matzip.image3);
         $('#img4').prop('src','../image/matzip/'+data.matzip.image4); */
      },
      error:function(err){
         console.log(err);
      }
   }); 
   let imgWindow;
   $('.linkImg0').click(function(){
      let imgWindow = window.open(imgLink[0],"","width=500,height=500,top=100,left="+$(window).width()/3);
   });
   $('.linkImg1').click(function(){
      let imgWindow = window.open(imgLink[1],"","width=500,height=500,top=100,left="+$(window).width()/3);
   });
   $('.linkImg2').click(function(){
      let imgWindow = window.open(imgLink[2],"","width=500,height=500,top=100,left="+$(window).width()/3);
   });
   $('.linkImg3').click(function(){
      let imgWindow = window.open(imgLink[3],"","width=500,height=500,top=100,left="+$(window).width()/3);
   });
   $('.linkImg4').click(function(){
      let imgWindow = window.open(imgLink[4],"","width=500,height=500,top=100,left="+$(window).width()/3);
   });
   $('.linkImg5').click(function(){
      let imgWindow = window.open(imgLink[5],"","width=500,height=500,top=100,left="+$(window).width()/3);
   });
   $('.linkImg6').click(function(){
      let imgWindow = window.open(imgLink[6],"","width=500,height=500,top=100,left="+$(window).width()/3);
   });
   $('.linkImg7').click(function(){
      let imgWindow = window.open(imgLink[7],"","width=500,height=500,top=100,left="+$(window).width()/3);
   });
   /* imgWindow.onunload=function(){
	   location.reload();
   } */
   $(window).scroll(function(){
	    console.log("documentHeight:" + documentHeight + " | scrollTop:" + $window.scrollTop() + " | windowHeight: " + windowHeight );
	        //if($(window).scrollTop()>=($(document).height() - $(window).height())/number)
	        //if($(window).scrollTop()%500==0)
	        //if($(window).scrollTop()>=600*number+number2)
	        if($(window).scrollTop()+100>=$(document).height() - $(window).height())
	        {
	            if(!loading)    //실행 가능 상태라면?
	            {
	                loading = true; //실행 불가능 상태로 변경
	                //console.log(number);
	                loadingPage(); 
	            }
	        }
	    });  
   function loadingPage(){
	   $.ajax({
		   type:'post',
		   url:'/morip/matzip/getMatzipReview',
		   data:'title='+titleSend+'&pg='+$('#pg').val(),
		   dataType:'json',
		   success:function(data){
			   pg++;
				//count++;			
				var tempNumber= 0;
				if(data.list.length!='0'){   //데이터가 존재할 때
				$.each(data.list, function(index, items){
					//처음 시작을 여는 div
					/* if(tempNumber%2==0){
						height+=380;
						//$('.content').css('height',height+'px');
						list += '<div class="middleDiv" data-aos="fade-up" data-aos-duration="3000" style="width:100%; height:380px;display:flex;padding:10px;">';
					} */
					list+='<div id="reviewInDiv" class="hvr-grow" style="width:100%;height:200px;display:flex;position:relative;">';
					list+='<div style="width:17%;height:130px;margin:35px;background-size:100% 130px;'+'background-image:url(../storage/'+items.mainimage+');"></div>';
					list+='<div style="width:55%;height:40px;margin:25px;position:relative;left:5px;top:0px;font-weight:bold;font-size:20pt;overflow:hidden;">'+items.subject+'</div>';
					list+='<div style="width:65%;height:60px;position:absolute;left:235px;top:75px;margin-left:5%;overflow:hidden;">'+items.content+'</div>';
					list+='<div style="border-right:1px solid gray;height:20px;position:absolute;padding:10px;left:220px;top:150px;margin-left:5%;">'+items.nickname+'</div>';
					list+='<div style="height:20px;position:absolute;padding:10px;left:328px;top:150px;margin-left:5%;">'+items.logtime+'</div>';
   					list+='</div>';
   					//닫아주는 div
					/* if(tempNumber%4==3){
						list+='</div>';
					} */
					tempNumber++;
				});
				$('#reviewOutDiv').append(list);
				$('#pg').val(pg);
				list='';
				loading = false;
				}
		   },
		   error:function(err){
			   console.log(err);
		   }
	   });
   }
});
</script>
<script type="text/javascript" src="../js/matzip/slideImage.js"></script>



</html>