<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="inc/header.jsp"/>

<c:if test="${not empty errorMessage}">
	<div class="errorMessage">
		<ul>
			<c:forEach items="${errorMessage}" var="message">
				<li><c:out value="{message}"/></li>
			</c:forEach>
		</ul>
	</div>
	<c:remove var="errorMessages" scope="session"/>
</c:if>
<form action="signup" method="post"><br />
	<label for="name">名前</label>
	<input name="name" id="name"/>(名前はあなたの公開プロフィールに表示されます)<br />
	<label for="account">アカウント名</label>
	<input name="account" id="account"/>(名前はあなたの公開プロフィール: http://localhost:8080/?account=アカウント名)<br />
	<label for="password">パスワード</label>
	<input name="password" type="password" id="password"/><br />
	<label for="email">メールアドレス</label>
	<input name="email" id="email"/><br />
	<label for="description">説明</label>
	<textarea name="description" cols="35" rows="5" id="description"></textarea><br />
	<input type="submit" value="登録" /><br />
	<a href="../">トップに戻る</a>
</form>

<jsp:include page="inc/footer.jsp"/>
