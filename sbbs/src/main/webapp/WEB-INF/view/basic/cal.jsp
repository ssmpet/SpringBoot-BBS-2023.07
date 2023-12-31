<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>간단한 계산기</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body style="margin: 40px;">
	<h1>심플 계산기</h1>
	<hr>
	<form action="/sbbs/basic/cal" method="post">
		<table>
			<tr>
				<td><input type="text" name="num1" class="form-control" value="${num1}"></td>
				<td>
					<select name="op"  class="form-control">
						<option value="+" ${ (op eq "+") ? "selected": ""}>+</option>
						<option value="-" ${ (op eq "-") ? "selected": ""}>-</option>
						<option value="*" ${ (op eq "*") ? "selected": ""}>*</option>
						<option value="/" ${ (op eq "/") ? "selected": ""}>/</option>
					</select>
				</td>
				<td><input type="text" name="num2"  class="form-control"  value="${num2}"></td>
				<td><input type="submit" value="="  class="btn btn-primary"></td>
				<td><input type="text"  class="form-control" name="result"  value="${result}"></td>
			</tr>
		</table>
	</form>
</body>
</html>