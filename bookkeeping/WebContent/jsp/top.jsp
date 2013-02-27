<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="inc/header.jsp"/>

<div class="header">
	<c:if test="${empty loginUser}">
	<a href="login">ログイン</a>
	<a href="signup">登録する</a>
	</c:if>
	<c:if test="${not empty loginUser}">
	<a href="./">ホーム</a>
	<a href="settings">設定</a>
	<a href="logout">ログアウト</a>
	</c:if>
</div>
<c:if test="${not empty loginUser}">
	<div class="profile">
		<div class="profile-image">
			<img src="./icon?user_id=${loginUser.id}" width="100" height="100"/>
		</div>
		<div class="name"><h2><c:out value="${loginUser.name}"/></h2></div>
		<div class="account">
			@<c:out value="${loginUser.account}"/>
		</div>
		<div class="account">
			@<c:out value="${loginUser.description}"/>
		</div>
	</div>
</c:if>

<jsp:include page="inc/footer.jsp"/>
