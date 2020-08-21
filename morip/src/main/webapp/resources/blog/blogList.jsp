<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
  <link rel="stylesheet" href="../css/blog/blogList.css">
  <script src="https://kit.fontawesome.com/75c3f69c14.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <!--hover.css-->
  <link href="../css/hover.css" rel="stylesheet" />
  <!--AOS 라이브러리-->
  <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
</head>
<body>
  <input type="hidden" id="pg" value="1">
  <br><br> 
 
  <div class="blogSearch">
    <input type="text" name="hashtagText" class="hashtagText" >
  	<input type="submit" class="hashtagSearchBtn" value="검 색" >  
  </div>
  <br><br>  
  <div class="morip_banner_slider">
  	<div class="img img0">
  	  <div class="content">전체</div>
      <div class="img-cover"></div>
  	</div>
  
	<div class="img img1">
  	  <div class="content">서울</div>
      <div class="img-cover"></div>
  	</div>
  
  	<div class="img img2">
  	  <div class="content">부산</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img3">
  	  <div class="content">대구</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img4">
  	  <div class="content">인천</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img5">
  	  <div class="content">광주</div>
      <div class="img-cover"></div>
  	</div>
  
  	<div class="img img6">
  	  <div class="content">대전</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img7">
  	  <div class="content">울산</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img8">
  	  <div class="content">강원도</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img9">
  	  <div class="content">경기도</div>
      <div class="img-cover"></div>
  	</div>
  
  	<div class="img img10">
  	  <div class="content">충북</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img11">
  	  <div class="content">충남</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img12">
  	  <div class="content">전북</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img13">
  	  <div class="content">전남</div>
      <div class="img-cover"></div>
  	</div>
  
  	<div class="img img14">
  	  <div class="content">경북</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img15">
  	  <div class="content">경남</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img16">
  	  <div class="content">제주도</div>
  	  <div class="img-cover"></div>
  	</div>
  </div>  
  <!-- 리스트 보여주기 -->
        <div class="writeBlog">
         <span class="write_text">여행기</span>
         <!-- <p class="write_blog">블로그 작성하기</p> -->
         <button type="button" class="btn btn-outline-secondary write_blog" id="writeOptionBtn" >블로그 작성하기</button>
       </div>
       

<!-- 

      리스트 보여주기 기환 버젼
	<div class="blogList_wrapper2">
	  리스트1
	  <div id="blogList_feed" class="hvr-grow-shadow">
	    <div class="blogList_img">
		  <img class="listImg"src="../image/main/testimg.png" alt="">
		</div>
		<div class="blogList_info">
		  <div class="blogList_subject">
			Lorem ipsum dolor sit amet, consectetur
		  </div>
		  <div class="blogList_content">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		  </div>
		  <div class="blogList_userFunction">
		    <div class="like">
              <i class="far fa-heart"></i>
              <span class="like_count"> 100</span>
            </div>
            <div class="reply">
              <i class="fas fa-comment-dots"></i>
              <span class="reply_count"> 301</span>
            </div>
            <span class="blogList_travleDay">
              20.06.03~20.06.08
            </span>
		  </div>
		</div>
	  </div>
	  
	  리스트1
	  <div id="blogList_feed" class="hvr-grow-shadow">
	    <div class="blogList_img">
		  <img class="listImg"src="../image/main/testimg.png" alt="">
		</div>
		<div class="blogList_info">
		  <div class="blogList_subject">
			Lorem ipsum dolor sit amet, consectetur
		  </div>
		  <div class="blogList_content">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		  </div>
		  <div class="blogList_userFunction">
		    <div class="like">
              <i class="far fa-heart"></i>
              <span class="like_count"> 100</span>
            </div>
            <div class="reply">
              <i class="fas fa-comment-dots"></i>
              <span class="reply_count"> 301</span>
            </div>
            <span class="blogList_travleDay">
              20.06.03~20.06.08
            </span>
		  </div>
		</div>
	  </div>
	  
	  리스트1
	  <div id="blogList_feed" class="hvr-grow-shadow">
	    <div class="blogList_img">
		  <img class="listImg"src="../image/main/testimg.png" alt="">
		</div>
		<div class="blogList_info">
		  <div class="blogList_subject">
			Lorem ipsum dolor sit amet, consectetur
		  </div>
		  <div class="blogList_content">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		  </div>
		  <div class="blogList_userFunction">
		    <div class="like">
              <i class="far fa-heart"></i>
              <span class="like_count"> 100</span>
            </div>
            <div class="reply">
              <i class="fas fa-comment-dots"></i>
              <span class="reply_count"> 301</span>
            </div>
            <span class="blogList_travleDay">
              20.06.03~20.06.08
            </span>
		  </div>
		</div>
	  </div>
	  
	  리스트1
	  <div id="blogList_feed" class="hvr-grow-shadow">
	    <div class="blogList_img">
		  <img class="listImg"src="../image/main/testimg.png" alt="">
		</div>
		<div class="blogList_info">
		  <div class="blogList_subject">
			Lorem ipsum dolor sit amet, consectetur
		  </div>
		  <div class="blogList_content">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		  </div>
		  <div class="blogList_userFunction">
		    <div class="like">
              <i class="far fa-heart"></i>
              <span class="like_count"> 100</span>
            </div>
            <div class="reply">
              <i class="fas fa-comment-dots"></i>
              <span class="reply_count"> 301</span>
            </div>
            <span class="blogList_travleDay">
              20.06.03~20.06.08
            </span>
		  </div>
		</div>
	  </div>
	  
	</div>  -->
	
	<!-- 인피니티! -->
	<div class="blogList_wrapper">
    
    </div>

<!-- 글작성 BTN -->
  <div class="modal fade" id="writeOptionModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
        	<button type="button" class="close" data-dismiss="modal">×</button>
        	<div class="bodyHeader">새로 만들기</div>
			<div class="writeOptionWrapper">
				<div class="travelsWriteWrapper">
					<div id="travelsWriteImg" class="hvr-grow-shadow"><i id="writeOptionImg" class="fas fa-suitcase" ></i></div>
					<div class="optionContentWrapper">
						<h5>여행기</h5>
						<div id="optionText">여행 기록을 코스별, 일정별로 깔끔하게 기록해보세요.</div>
					</div>
				</div>
				<div class="writeBlogWrapper">
					<div id="writeBlogImg" class="hvr-grow-shadow"><i id="writeOptionImg" class="far fa-edit"></i></div>
					<div class="optionContentWrapper">
						<h5>M에세이</h5>
						<div id="optionText">여행을 자유롭게 나만의 에세이로 기록해보세요.</div>
					</div>
				</div>
			</div>
        </div>
        <div id="count" value="1"></div>
      </div>
    </div>
  </div>
</body> 

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script type="text/javascript" src="../js/main/main.js" ></script>		
<script type="text/javascript" src="../js/blog/blogList.js" ></script>
<script type="text/javascript">
AOS.init({
    easing: 'ease-out-back',
    duration: 1000
});
</script>
