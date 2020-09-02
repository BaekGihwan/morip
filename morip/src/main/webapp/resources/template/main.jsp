<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<!--===============================================================================================-->
  <link rel="stylesheet" href="../css/main/main.css">
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@1,400&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:ital@1&display=swap" rel="stylesheet">  
  <script src="https://kit.fontawesome.com/75c3f69c14.js" crossorigin="anonymous"></script>
<!--===============================================================================================-->
</head>

  <!-- morip banner -->
  <div class="morip_banner">
	<img alt="" src="../image/main/mainbanner5.png" style="width: 100%; height: 450px;">
  </div>
  <br><br>  
<body class="morip_main">
  <input type="hidden" id="email" value="${memEmail }">
  <br><br>  

  <!-- morip slider -->
 <!--  <i class="fas fa-chevron-left prev"></i>
  <i class="fas fa-chevron-right next"></i> -->
  
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
  <br>  
  <!-- morip bestBlog -->
  <div class="morip_bestBlog">
  	<h2>이런 여행은 어떠세요?</h2>
    <h3><span>BEST</span> 여행작가</h3>
    <br>
    <div class="morip_bestBlogWriter">    
      <div class="writer_info">  
      	<div class="profile_bg">
      	  <img class="profile_image" alt="" src="">
      	</div>
      	<div class="profile_detail">
      	  <p class="profile_name"></p>
      	  <p class="description"></p>
      	  <div>
      	  </div>
      	  <div class="link_wrapper">
      	    <button class="blog_link">더 많은 여행기 보기 ></button>
      	  </div>
      	</div>    	
      </div>      
      <div class="writer_post">
      	<!-- 1번! -->
      	<div class="post">
      	  <input type="hidden" id="post_seq1">
      	  <div class="post_image" id="post_image1" style="">
      	    <div class="post_image_like">
      	      <span class="post_image_like_text" id="post_image_like_text1"></span>
      	    </div>
      	  </div>
      	  <div class="post_text"> 
	        <div class="post_title">
	          <p class="post_title_p" id="post_title_p1"></p>
	        </div>	          
	      	<div class="post_content">
			  <p class="post_content_p" id="post_content_p1"></p>
	      	</div>
      	  </div>
        </div>        
        <!-- 2번! -->
        <div class="post">
          <input type="hidden" id="post_seq2">
      	  <div class="post_image" id="post_image2" style="">
      	    <div class="post_image_like">
      	      <span class="post_image_like_text" id="post_image_like_text2"></span>
      	    </div>
      	  </div>
      	  <div class="post_text"> 
	        <div class="post_title">
	          <p class="post_title_p" id="post_title_p2"></p>
	        </div>	          
	      	<div class="post_content">
			  <p class="post_content_p" id="post_content_p2"></p>
	      	</div>
      	  </div>
        </div>
        <!-- 3번! -->
        <div class="post">
          <input type="hidden" id="post_seq3">
      	  <div class="post_image" id="post_image3" style="">
      	    <div class="post_image_like">
      	      <span class="post_image_like_text" id="post_image_like_text3"></span>
      	    </div>
      	  </div>
      	  <div class="post_text"> 
	        <div class="post_title">
	          <p class="post_title_p" id="post_title_p3"></p>
	        </div>	          
	      	<div class="post_content">
			  <p class="post_content_p" id="post_content_p3"></p>
	      	</div>
      	  </div>
        </div> <!-- 3번끝! --> 		          
      </div>
    </div>
  </div> 
   <br><br>
  
  <div class="text1">
     <h2>배고프신가요?? 이런 음식은 어떠세요?</h2>
    <h3><span>Top3</span> 맛집!</h3>
    <br>
  </div> 
  <!-- 맛집 -->
  <div class="bestFood_post">
     <div class="food_post_bg_image">
      <div class="food_post">
        <div class="food_post_name" id="food_post_name1"></div>
        <div class="food_post_image" id="food_post_image1"></div>
        <div class="food_post_contents">
          <div class="content1">
            <i class="fas fa-comment-dots"></i>
            <p class="food_post_like_count" id="food_post_like_count1"></p>
            <a id="food_link1"><i class="fas fa-link"></i></a>
          </div>
          <div class="content2">
            <i class="fas fa-map-marker-alt"></i>
            <!-- <p class="content2_name">위치</p> -->
            <div class="content2_address" id="content2_address1"></div>
          </div>
          <div class="content3">
            <i class="fas fa-phone-alt"></i>
            <!-- <p class="content3_name">연락처</p> -->
            <div class="content3_pone" id="content3_pone1"></div>
          </div>          
          <div class="content4">
            <i class="far fa-clock"></i>
            <div class="content4_time" id="content4_time1"></div>
          </div>
        </div>
      </div>
      <div class="food_post">
         <div class="food_post_name" id="food_post_name2"></div>
        <div class="food_post_image" id="food_post_image2"></div>
        <div class="food_post_contents">
          <div class="content1">
            <i class="fas fa-comment-dots"></i>
            <p class="food_post_like_count" id="food_post_like_count2"></p>
            <a id="food_link2"><i class="fas fa-link"></i></a>
          </div>
          <div class="content2">
            <i class="fas fa-map-marker-alt"></i>
            <!-- <p class="content2_name">위치</p> -->
            <div class="content2_address" id="content2_address2"></div>
          </div>
          <div class="content3">
            <i class="fas fa-phone-alt"></i>
            <!-- <p class="content3_name">연락처</p> -->
            <div class="content3_pone" id="content3_pone2"></div>
          </div>          
          <div class="content4">
            <i class="far fa-clock"></i>
            <div class="content4_time" id="content4_time2"></div>
          </div>
        </div>
      </div>
      <div class="food_post">
         <div class="food_post_name" id="food_post_name3"></div>
        <div class="food_post_image" id="food_post_image3"></div>
        <div class="food_post_contents">
          <div class="content1">
            <i class="fas fa-comment-dots"></i>
            <p class="food_post_like_count" id="food_post_like_count3"></p>
            <a id="food_link3"><i class="fas fa-link"></i></a>
          </div>
          <div class="content2">
            <i class="fas fa-map-marker-alt"></i>
            <!-- <p class="content2_name">위치</p> -->
            <div class="content2_address" id="content2_address3"></div>
          </div>
          <div class="content3">
            <i class="fas fa-phone-alt"></i>
            <!-- <p class="content3_name">연락처</p> -->
            <div class="content3_pone" id="content3_pone3"></div>
          </div>          
          <div class="content4">
            <i class="far fa-clock"></i>
            <div class="content4_time" id="content4_time3"></div>
          </div>
        </div>
      </div>
     </div>
  </div>  
  <br><br>
  <br><br>
  <!-- contentFilter -->
  <div id="contentFilter" style="display: none;"></div>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>		
<script type="text/javascript" src="../js/main/main.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>