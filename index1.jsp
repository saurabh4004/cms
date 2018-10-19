<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Medication 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20121118

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet" type="text/css" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->

<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" media="all" />

</head>
<body>


<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>

<div id="page" class="container">
${Title}
${Message}
${PersonList}
<form action="${ActionName}" method="post">
<input type="hidden" name="id" value="${PersonId}">
<div class="row">
	<div class="col-md-3">
	Enter Name
	</div>
    <div class="col-md-4">
    <input type="text" name="name"  class="form-control" value="${NameValue}"/>
    <div style="color: red">${NameError}</div><br>
	</div>
</div>
<br>
<div class="row">
	<div class="col-md-3">
	Enter Age
	</div>
    <div class="col-md-4">
    <input type="text" name="age" class="form-control" value="${AgeValue}"/>
    <div style="color: red">${AgeError}</div><br>
	</div>
</div>
<br>
<div class="row">
	<div class="col-md-3">
	Enter Phone
	</div>
    <div class="col-md-4">
    <input type="text"  class="form-control" name="phone" value="${PhoneValue}"/>
    <div style="color: red">${PhoneError}</div><br><br>
    
	</div>
</div>
<br>
<div class="row">
	<div class="col-md-3">
	
	</div>
    <div class="col-md-5">
    <input type="submit"  class="btn btn-secondary"  value="SUBMIT"/>
    <input type="button"  class="btn btn-secondary" value="RESET"/>
	</div>
</div>


<div class="row">
	<div class="col-md-6">
		<table class="table table-stripped">
		<c:if test="${not empty PersonList}">
			<c:forEach var="person" items="${PersonList}">
			
			<tr>
				<td>${person.name}</td>
				<td>${person.age}</td>
				<td>${person.phone}</td>
				<td><a href="GetRecord?id=${person.id}">UPDATE</a> ||<a href="GetRecordDelete?id=${person.id}"> DELETE</a></td>
			</tr>
			
			</c:forEach>
		</c:if>
		
		</table>
	</div><!-- col -->
</div><!-- row -->

</form>




</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
