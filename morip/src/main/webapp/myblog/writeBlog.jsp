<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <!--AOS 라이브러리-->
     <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
     <!--hover.css-->
     <link href="css/hover.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/writeFormCss.css" rel="stylesheet" />
    <!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">


<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <title></title>
  </head>
  <body>
    <header>
      <div class="header">
        <nav class="navBar">
            네비게이션 바
        </nav>
      </div>
    </header>
    <article class="contentWrapper">
      <div class="content">
        <div class="writeEditor">

        </div>
        <div class="writeOption">
          <div class="saveOptionWrapper">
            <button type="button" class="btn btn-outline-secondary" style="font-size:13px; border-radius:20px; margin:5px; width:200px; height:40px;" >미리보기</button><br>
            <button type="button" class="btn btn-outline-secondary" style="font-size:13px; border-radius:20px; margin:5px; width:200px; height:40px;">저장하기</button>
            <!--switch-->
            <div class="saveOption">
              <div class="switch">
                  <p>공개 설정</p>
                  <div class="primary-switch">
                    <input type="checkbox" id="primary-switch" checked>
                    <label for="primary-switch"></label>
                  </div>
                  <div class="switch_infomation">
                    <p>
                    공개 여부를 설정합니다.<br>
                    활성화 시 다른 사용자에게 공개되며,<br>
                    비활성화시 다른유저에게 보이지 않습니다.</p>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </article>


  </body>
  <!-- Bootstrap core JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
  <!-- Third party plugin JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
  <!--AOS 라이브러리-->
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <!-- Core theme JS-->
  <script src="../js/writeFormJs.js"></script>
</html>
