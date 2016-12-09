<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/materialize.min.css"/>"
	type="text/css" rel="stylesheet" media="screen,projection">
  <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
  <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>	
<title>Catégories</title>
</head>
<body>
  <nav>
    <div class="nav-wrapper">
      <a href="#!" class="brand-logo">Todolist</a>
      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
      <ul class="right hide-on-med-and-down">
        <li><a href="<c:url value="/categories"/>">Categories</a></li>
        <li><a href="<c:url value="/tasks"/>">Tâches</a></li>
      </ul>
      <ul class="side-nav" id="mobile-demo">
        <li><a href="<c:url value="/categories"/>">Categories</a></li>
        <li><a href="<c:url value="/tasks"/>">Tâches</a></li>
      </ul>
    </div>
  </nav>
  <form action="endTasks" id="finir" name="finir" method="get">
	  <div class="row">
	  	<div class="col s2">
		  du :<input type="text" id="from" name="from" readonly value="${from}"> 
		</div>
		<div class="col s2">
		  au :<input type="text" id="to" name="to" readonly value="${to}" > 
		</div>
	  </div>
	   <input class="btn waves-effect waves-light" type="submit" id="submit" value="Terminer toutes les tâches" onclick="return window.confirm('Êtes-vous sur de vouloir terminer toutes ces tâches?')"/>          
  </form>
  <br/>
  <Strong>Toutes les tâches sélectionnées:</Strong>
		<ul class="collection">
			<c:forEach items="${tasks}" var="task">
				<li class="collection-item">
					${task.label} commençant le 
					<fmt:formatDate type="both" dateStyle="short" timeStyle="short" pattern="yyyy-MM-dd" value="${task.beginningDate}" />
					finissant le	
	 				<fmt:formatDate type="both" dateStyle="short" timeStyle="short"  pattern="yyyy-MM-dd" value="${task.endingDate}" />	
				</li>
			</c:forEach>
		</ul>
	
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/main.js"/>"></script>
</body>
</html>
    
    