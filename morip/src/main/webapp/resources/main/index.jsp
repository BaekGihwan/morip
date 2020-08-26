<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>morip</title>
  <link rel="stylesheet" href="../css/main/main.css">
</head>
<body>
  <table id="mainTable">
    <!-- header부분 -->
    <tr>
      <td id="header" style="height: 86px; width: 1120px;">   
        <jsp:include page="../template/top.jsp" />   
      </td>
    </tr>
    <!-- bdoy부분 -->
    <tr>  
      <td id="body">
        <div>
	  	  <jsp:include page="${display }" />
        </div>
      </td>
    </tr>
    <!-- footer부분 -->
    <tr>
      <td id="footer">
        <jsp:include page="../template/footer.jsp"/>
      </td>
    </tr>
  </table>
</body>
<!-- JQuery  -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- Chatbot -->
<script id="embeddedChatbot" data-botId="B170q4" src="https://www.closer.ai/js/webchat.min.js"> </script>
</html>