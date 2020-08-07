<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>morip</title>
  <link rel="stylesheet" href="../css/main.css">
</head>
<body>
  <table id="mainTable">
    <!-- header부분 -->
    <tr>
      <td id="header">   
        <%-- <jsp:include page="../template/header2.jsp" />  --%>
        <jsp:include page="../template/top.jsp" />   
      </td>
    </tr>
  
  <tr>  
    <td id="body">
      <div>
		<jsp:include page="${display }" />
      </div>
    </td>
  </tr>
  
  <tr>
   <td id="footer">
     <jsp:include page="../template/footer.jsp"/>
   </td>
  </tr>
 </table>
</body>
<!-- JQuery  -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
/* $(window).on("scroll",function(){
	  if($(window).scrollTop()){
	    $('#header').addClass('black');
	  } else {
	    $('#header').removeClass('black');
	  }
}); */
</script>
</html>