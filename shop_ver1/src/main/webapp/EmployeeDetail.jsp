<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "repository.*"%>
<%@ page import = "vo.*"%>
<%
	Employee loginEmployee = (Employee)session.getAttribute("loginEmployee");
	EmployeeDao employeeDao  = new EmployeeDao();
	Employee employee = employeeDao.selectEmployeeOne(loginEmployee.getEmployeeId());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<div>
		<a href="./index.jsp">로그인페이지로</a>
	</div>
		<table border="1">
			<tr>
				<td>ID</td>
				<td>
					<input type="hidden" value="Employee" name="user" id="user">
					<%=employee.getEmployeeId()%>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=employee.getEmployeeName()%></td>
			</tr>

			<tr>
				<td>가입날짜</td>
				<td><%=employee.getCreateDate()%></td>
			</tr>
		</table>
		<a href="./">비밀번호 변경</a>
		<a href="./">계정정보 수정</a>
		<a href="<%=request.getContextPath()%>/Employeedelete.jsp?EmployeeId=<%=employee.getEmployeeId()%>">계정정보 삭제</a>
	</div>
</body>
</html>