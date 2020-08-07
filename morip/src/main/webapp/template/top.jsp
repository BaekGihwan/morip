<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${memId eq null && loginFail ne 'loginFail'}">
  <jsp:include page="header.jsp"/>
</c:if>      

<c:if test="${memId ne null }">
  <jsp:include page="header2.jsp"/>   
</c:if>      
