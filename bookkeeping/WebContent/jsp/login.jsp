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
<form action="login" method="post"><br />
	<label for="accountOrEmail">アカウント名かメールアドレス</label>
	<input name="accountOrEmail" id="accountOrEmail"/><br />
	<label for="password">パスワード</label>
	<input name="password" type="password" id="password"/><br />
	<input type="submit" value="ログイン" /><br />
	<a href="戻る"></a>
</form>

<jsp:include page="inc/footer.jsp"/>
