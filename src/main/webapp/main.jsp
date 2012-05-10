<%@page import="ie.cit.cloudapp.Todo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="repo" class="ie.cit.cloudapp.TodoRepository"
	scope="session"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Todo</title>
</head>
<body>

	<h1>TODO Application</h1>
	<h2>List of ToDos</h2>

	<c:if test="${ param._method.equals(\"put\") }">
		<%
			String idStr = request.getParameter("todoId");
				int index = Integer.parseInt(idStr);
				Todo t = repo.getTodos().get(index - 1);
				t.setDone(!t.isDone());
		%>
	</c:if>

	<c:if test="${ param._method.equals(\"delete\") }">
		<%
			String idStr = request.getParameter("todoId");
				int index = Integer.parseInt(idStr);
				repo.getTodos().remove(index - 1);
		%>
	</c:if>

	<c:if test="${! empty param.text }">
		<%
			Todo todo = new Todo();

				todo.setText(request.getParameter("text"));
				repo.addTodo(todo);
		%>
	</c:if>
	<c:forEach items="${repo.todos}" var="todo" varStatus="row">
		<c:choose>
			<c:when test="${todo.done}">
				<del>${todo.text}</del>
			</c:when>
			<c:otherwise>
 	   ${todo.text} 
 	 </c:otherwise>
		</c:choose>
		<form method="post">
			<input name="_method" type="hidden" value="put"> <input
				name="todoId" type="hidden" value="${row.count}"> <input
				type="submit" value="Update">
		</form>
		<form method="post">
			<input name="_method" type="hidden" value="delete"> <input
				name="todoId" type="hidden" value="${row.count}"> <input
				type="submit" value="Delete">
		</form>
		<br />
	</c:forEach>
	<h2>Create new TODO</h2>
	<form method="post">
		Text: <input name="text"><input type="submit">
	</form>
</body>
</html>