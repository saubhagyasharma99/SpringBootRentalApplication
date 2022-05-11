<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<head>
  <style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Meie+Script|Shadows+Into+Light|Arvo|Monda');

.row {
  font-size: 22pt;
  font-weight: 600;
}

.font_meie_script {
  font-family: 'Meie Script', cursive;
}

</style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Room_Finder</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/landing-page.min.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="col-md-3 font_meie_script" href="#"><h3>Room Finder</h3></a>
      <security:authorize access="!isAuthenticated()">
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/login">Sign In</a>
</security:authorize>
      
  <security:authorize access="isAuthenticated()">
  	<security:authentication property="principal.username" /> 
    <security:authentication property="principal.authorities" /> 
      <a class="btn btn-primary" href="${pageContext.request.contextPath}/logout"> Logout </a>
</security:authorize>
    </div>
  </nav>

