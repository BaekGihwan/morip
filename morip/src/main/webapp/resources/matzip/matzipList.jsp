<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" /> -->
		<link href="../css/hover.css" rel="stylesheet" />
		<link rel="stylesheet" href="../css/matzip/matzip.css" />
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
		<script src="https://kit.fontawesome.com/75c3f69c14.js" crossorigin="anonymous"></script>
		<!-- <noscript><link rel="stylesheet" href="../css/noscript.css" /></noscript> -->
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">
				<input type="hidden" id="pg" value="1">

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<div id="divYo"><span id="yo">요</span><span id="gi">기</span><span id="ee">이</span> <span id="oh">오</span><span id="ddon">똔</span><span id="de">데</span><span id="question">?</span></div>
								<!-- <p>Etiam quis viverra lorem, in semper lorem. Sed nisl arcu euismod sit amet nisi euismod sed cursus arcu elementum ipsum arcu vivamus quis venenatis orci lorem ipsum et magna feugiat veroeros aliquam. Lorem ipsum dolor sit amet nullam dolore.</p> --><br>
								<!-- <div><lottie-player src="https://assets2.lottiefiles.com/packages/lf20_o1WDlm.json"  background="transparent"  speed="0.6"  style="width: 400px; height: 400px;"  loop  autoplay></lottie-player></div> -->
								<div class="row gtr-uniform gtr-50">
									<div class="col-8 col-12-xsmall">
										<input type="text" id="matzipText" name="matzipText">
									</div>
									<div class="col-4 col-12-xsmall">
										<input class="fit primary" type="submit" value="검색" id="matzipSearchBtn">
									</div>
								</div>
							</header>
							<br><br>
							<section class="tiles" id="tiles">
								<article class="style1">
									<span class="image">
										<img src="../image/matzip/pic01.jpg" alt="">
									</span>
									<a id="allA">
										<h2>전 체</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<article class="style2">
									<span class="image">
										<img src="../image/matzip/paju.jpg" alt="" id="img2">
									</span>
									<a id="pajuA">
										<h2>paju</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<article class="style3">
									<span class="image">
										<img src="../image/matzip/chun.png" alt="">
									</span>
									<a id="chuncheonA">
										<h2>chuncheon</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<div id="allDiv2" style="width:100%;">
								<img id="infinity" src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="allDiv" style="width:100%;">
								</div>
								</div>
								<div id="pajuDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="pajuMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="pajuTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="pajuImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="pajuReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="pajuAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="pajuTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="pajuTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="pajuImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="pajuReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="pajuAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="pajuTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="pajuTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="pajuImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="pajuReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="pajuAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="pajuTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="pajuTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="pajuImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="pajuReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="pajuAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="pajuTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<div id="chuncheonDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="chuncheonMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="chuncheonTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="chuncheonImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="chuncheonReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="chuncheonAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="chuncheonTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="chuncheonTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="chuncheonImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="chuncheonReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="chuncheonAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="chuncheonTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="chuncheonTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="chuncheonImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="chuncheonReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="chuncheonAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="chuncheonTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="chuncheonTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="chuncheonImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="chuncheonReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="chuncheonAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="chuncheonTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<article class="style4">
									<span class="image">
										<img src="../image/matzip/in4.jpg" alt="" />
									</span>
									<a id="incheonA">
										<h2>incheon</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<article class="style5">
									<span class="image">
										<img src="../image/matzip/tower.jpg" alt="" />
									</span>
									<a id="seoulA">
										<h2>seoul</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<article class="style6">
									<span class="image">
										<img src="../image/matzip/gang.jpg" alt="" />
									</span>
									<a id="gangneungA">
										<h2>gangneung</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<div id="incheonDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="incheonMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="incheonTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="incheonImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="incheonReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="incheonAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="incheonTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="incheonTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="incheonImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="incheonReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="incheonAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="incheonTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="incheonTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="incheonImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="incheonReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="incheonAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="incheonTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="incheonTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="incheonImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="incheonReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="incheonAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="incheonTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<div id="seoulDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="seoulMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="seoulTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="seoulImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="seoulReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="seoulAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="seoulTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="seoulTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="seoulImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="seoulReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="seoulAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="seoulTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="seoulTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="seoulImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="seoulReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="seoulAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="seoulTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="seoulTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="seoulImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="seoulReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="seoulAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="seoulTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<div id="gangneungDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="gangneungMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="gangneungTitle0" style="font-size:11pt;font-weight:bold;margin-left:10px;margin-top:7px;margin-bottom:7px;"></div><div style="width:100%;height:160px;"><img id="gangneungImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="gangneungReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="gangneungAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="gangneungTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="gangneungTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="gangneungImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="gangneungReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="gangneungAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="gangneungTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="gangneungTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="gangneungImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="gangneungReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="gangneungAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="gangneungTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="gangneungTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="gangneungImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="gangneungReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="gangneungAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="gangneungTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<article class="style2">
									<span class="image">
										<img src="../image/matzip/suwon.png" alt="" />
									</span>
									<a id="suwonA">
										<h2>Suwon</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<article class="style3">
									<span class="image">
										<img src="../image/matzip/an.png" alt="" />
									</span>
									<a id="cheonanA">
										<h2>cheonan</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<article class="style1">
									<span class="image">
										<img src="../image/matzip/andong.jpg" alt="" />
									</span>
									<a id="andongA">
										<h2>andong</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<div id="suwonDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="suwonMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="suwonTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="suwonImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="suwonReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="suwonAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="suwonTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="suwonTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="suwonImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="suwonReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="suwonAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="suwonTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="suwonTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="suwonImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="suwonReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="suwonAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="suwonTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="suwonTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="suwonImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="suwonReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="suwonAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="suwonTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<div id="cheonanDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="cheonanMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="cheonanTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="cheonanImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="cheonanReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="cheonanAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="cheonanTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="cheonanTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="cheonanImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="cheonanReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="cheonanAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="cheonanTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="cheonanTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="cheonanImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="cheonanReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="cheonanAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="cheonanTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="cheonanTitle3" style="font-size:13pt;font-weight:bold;margin-left:10px;margin-top:3px;margin-bottom:3px;"></div><div style="width:100%;height:160px;"><img id="cheonanImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="cheonanReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="cheonanAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="cheonanTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<div id="andongDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="andongMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="andongTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="andongImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="andongReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="andongAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="andongTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="andongTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="andongImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="andongReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="andongAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="andongTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="andongTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="andongImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="andongReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="andongAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="andongTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="andongTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="andongImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="andongReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="andongAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="andongTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<article class="style5">
									<span class="image">
										<img src="../image/matzip/jun1.png" alt="" />
									</span>
									<a id="jeonjuA">
										<h2>jeonju</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<article class="style6">
									<span class="image">
										<img src="../image/matzip/chungju.jpg" alt="" />
									</span>
									<a id="chungjuA">
										<h2>chungju</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<article class="style4">
									<span class="image">
										<img src="../image/matzip/aaa.jpg" alt="" />
									</span>
									<a id="gyeongjuA">
										<h2>Gyeongju</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<div id="jeonjuDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="jeonjuMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="jeonjuTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="jeonjuImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="jeonjuReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="jeonjuAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="jeonjuTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="jeonjuTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="jeonjuImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="jeonjuReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="jeonjuAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="jeonjuTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="jeonjuTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="jeonjuImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="jeonjuReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="jeonjuAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="jeonjuTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="jeonjuTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="jeonjuImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="jeonjuReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="jeonjuAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="jeonjuTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<div id="chungjuDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="chungjuMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="chungjuTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="chungjuImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="chungjuReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="chungjuAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="chungjuTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="chungjuTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="chungjuImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="chungjuReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="chungjuAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="chungjuTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="chungjuTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="chungjuImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="chungjuReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="chungjuAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="chungjuTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="chungjuTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="chungjuImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="chungjuReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="chungjuAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="chungjuTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<div id="gyeongjuDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="gyeongjuMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="gyeongjuTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="gyeongjuImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="gyeongjuReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="gyeongjuAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="gyeongjuTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="gyeongjuTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="gyeongjuImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="gyeongjuReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="gyeongjuAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="gyeongjuTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="gyeongjuTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="gyeongjuImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="gyeongjuReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="gyeongjuAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="gyeongjuTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="gyeongjuTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="gyeongjuImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="gyeongjuReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="gyeongjuAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="gyeongjuTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<article class="style1">
									<span class="image">
										<img src="../image/matzip/yeosu.jpg" alt="" />
									</span>
									<a id="yeosuA">
										<h2>yeosu</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<article class="style2">
									<span class="image">
										<img src="../image/matzip/jeju.png" alt="" id="img2"/>
									</span>
									<a id="jejuA">
										<h2>jeju</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<article class="style3">
									<span class="image">
										<img src="../image/matzip/busan.png" alt="" />
									</span>
									<a id="busanA">
										<h2>busan</h2>
										<div class="content">
											<!-- <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p> -->
										</div>
									</a>
								</article>
								<div id="yeosuDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="yeosuMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="yeosuTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="yeosuImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="yeosuReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="yeosuAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="yeosuTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="yeosuTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="yeosuImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="yeosuReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="yeosuAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="yeosuTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="yeosuTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="yeosuImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="yeosuReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="yeosuAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="yeosuTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="yeosuTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="yeosuImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="yeosuReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="yeosuAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="yeosuTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<div id="jejuDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="jejuMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="jejuTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="jejuImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="jejuReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="jejuAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="jejuTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="jejuTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="jejuImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="jejuReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="jejuAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="jejuTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="jejuTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="jejuImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="jejuReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="jejuAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="jejuTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="jejuTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="jejuImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="jejuReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="jejuAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="jejuTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
								<div id="busanDiv" style="width:100%;">
								<img src="../image/matzip/backTop.png" style="margin-top:10px;margin-left:10px;width:100%;">
								<div id="busanMiddleDiv" style="width:100%;/*  height:380px;display:flex;padding:10px; */">
									<!-- &emsp;<div class="hvr-grow" id="smallDiv"><div id="busanTitle0" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="busanImg0" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="busanReview0" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="busanAddr0" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="busanTel0" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="busanTitle1" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="busanImg1" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="busanReview1" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="busanAddr1" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="busanTel1" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="busanTitle2" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="busanImg2" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="busanReview2" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="busanAddr2" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="busanTel2" style="font-size:10pt;font-weight:bold;"></div></div></div>
            						&emsp;<div class="hvr-grow" id="smallDiv"><div id="busanTitle3" style="font-size:15pt;font-weight:bold;margin-left:10px;"></div><div style="width:100%;height:160px;"><img id="busanImg3" src="" width="100%" height="180px"></div><br><div style="display:flex;padding:5px;border-bottom:3px solid #4C4C4C;"><i class="fas fa-comment-dots" style="margin:5px;"></i>
            						<div id="busanReview3" class="food_post_like_count" style="width:100px;font-size:10pt;font-weight:bold;"></div></div>
            						<div style="display:flex;padding:5px;"><i class="fas fa-map-marker-alt" style="margin:5px;"></i><div id="busanAddr3" style="font-size:10pt;font-weight:bold;height:30px;"></div></div><div style="display:flex;margin:5px;"><i class="fas fa-phone-alt" style="margin:5px;"></i><div id="busanTel3" style="font-size:10pt;font-weight:bold;"></div></div></div> -->
								</div>
								<img src="../image/matzip/backBottom.png" style="margin-top:10px;margin-left:10px;width:100%;">
								</div>
							</section>
							<div id="showSearch" style="display:flex;margin-left:5%;">
                        <div id="map" style="width:70%;height:500px;"></div>
                        <div id="showMatzipListDiv" style="width:300px;height:500px;position:relative;left:10px;">
                           <table id="showMatzipList">
                           </table>
                        </div>
                     </div>
                     
                  </div>
               </div>
            <input type="hidden" id="matzipAddress0" value="">
            <input type="hidden" id="matzipAddress1" value="">
            <input type="hidden" id="matzipAddress2" value="">
            <input type="hidden" id="matzipAddress3" value="">
            <input type="hidden" id="matzipAddress4" value="">

			</div>

		<!-- Scripts -->
			<script src="../js/jquery.min.js"></script>
			<script src="../js/matzip/browser.min.js"></script>
			<script src="../js/matzip/breakpoints.min.js"></script>
			<script src="../js/matzip/util.js"></script>
			<script src="../js/matzip/matzip.js"></script>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=352d90d2c3a60113b4d24ad68f0b720d&libraries=services"></script>
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
		    <script type="text/javascript">
		    var test;
		    let address = null;
		    let result1;
		    $('#matzipSearchBtn').click(function(){
		       if($('#matzipText').val()==''){
		          //alert('검색어를 입력해주세요!');
		          Swal.fire({
				  icon: 'warning',
				  title: '검색어를<br>입력해주세요!'
				  //text: 'Something went wrong!',
				  //footer: '<a href>Why do I have this issue?</a>'
				})
		       }else {
		          $.ajax({
		             type: 'post',
		             url : '../matzip/matzipSearch',
		             data: {'matzipText': $('#matzipText').val()+' 맛집'},
		             dataType:'json',
		             success : function(data){
		                $('#showMatzipList').empty();
		                $('#tiles').hide();
		                   $('#showSearch').show();
		                $.each(data.list,function(index,items){
		                   
		                   $('#matzipAddress'+index).val(data.list[index].address);
		                   $('<tr/>').append($('<td/>',{
		                	   id:'giveCenter',
		                      //text:items.title
		                      class:'hvr-forward',
		                      width:'100%'
		                   }).append($('<a/>',{
		                      html:items.title,
		                      id:'ex1',
		                      class:items.address,
		                      name:items.title
		                   })).append($('<div/>',{
		                	   text:items.category,
		                	   id:'givefont'
		                   }))
		                   
		                   ).appendTo($('#showMatzipList'));
		                   //test=items.title;
		                });
		                
		                //alert($('#matzipAddress0').val());
		                alert('맛집서치버튼클릭!');
		                alert($('#matzipText').val());
		                result1='success';
		                //alert(result1);
		                
		                
		                if(result1=='success'){
		                   		//$('#ex1').css('font-family',"'Noto Sans KR', sans-serif");
		                         var matzipAddress=document.getElementById('matzipAddress0').value;
		                         var firstTitle = $('#ex1').attr('name');
		                         $('#ex1').parent().css('background-color','#cea461');
		                         //alert("2")
		                         //alert(matzipAddress);
		                         
		                         // 주소-좌표 변환 객체를 생성합니다
		                         var geocoder = new kakao.maps.services.Geocoder();
		                         
		                         // 주소로 좌표를 검색합니다
		                         geocoder.addressSearch(matzipAddress, function(result, status) {
		                            //alert("3");
		                            //alert(matzipAddress);
		                            //alert(result);
		                            //alert(matzipAddress);
		                         
		                             // 정상적으로 검색이 완료됐으면 
		                              if (status === kakao.maps.services.Status.OK) {
		                               console.log(result);
		                                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		                         
		                                 // 결과값으로 받은 위치를 마커로 표시합니다
		                               var marker = new kakao.maps.Marker({
		                                     map: map,
		                                     position: coords
		                                 });
		                                 // 인포윈도우로 장소에 대한 설명을 표시합니다
		                          		kakao.maps.event.addListener(marker, 'click', function() {
										      //마커 위에 인포윈도우를 표시합니다
										      //alert($(this).prop('html'));
										      //alert(test);
										      //alert(title);
										      location.href='../matzip/matzipView?title='+firstTitle;
										});
		                         
		                                 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		                                 map.setCenter(coords);
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
		             error : function(e){
		                console.log(e);
		             }
		          });
		       }
		       });
		       
		       $('#showSearch').on('click','#ex1',function(){
		          var matzipAddress= $(this).attr('class');
		          var title = $(this).attr('name');
		          //var matzipAddress= '맛집';
		          $(this).parent().css('background-color','#cea461');              
		          $('.hvr-forward').not($(this).parent()).css('background-color','#d2bd9f');
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
		             // 인포윈도우로 장소에 대한 설명을 표시합니다
		             
		             kakao.maps.event.addListener(marker, 'click', function() {
					      // 마커 위에 인포윈도우를 표시합니다
					      //alert($(this).prop('html'));
					      //alert(test);
					      //alert(title);
					      alert(title);
					      title = title.replace('<b>','');
					      title = title.replace('</b>','');
					      location.href='../matzip/matzipView?title='+title;
					});
		                          
		                         
		             // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		             map.setCenter(coords);
		          }
		          
		                             
		             
		          
		                         
		       });
		                         
		          var mapContainer = document.getElementById('map'),
		             mapOption = {
		                         center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		                          level: 3 // 지도의 확대 레벨
		                        };
		                          
		          // 지도를 생성합니다    
		          var map = new kakao.maps.Map(mapContainer, mapOption);
		          
		          //alert(matzipAddress);
		    });
		    </script>
			

	</body>
</html>