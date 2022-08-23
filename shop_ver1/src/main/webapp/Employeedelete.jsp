<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "repository.*"%>
<%@ page import = "vo.*"%>
<%
	if(session.getAttribute("loginEmployee") == null){
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}

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
	<form action="./deleteEmployeeAction.jsp" method="post">
		<input type="hidden" name="EmployeeId" value="<%=employee.getEmployeeId()%>">
		비밀번호를입력해주세요 :
		<input type="password" name="EmployeePw">
		<button type="submit">DELETE</button>
	</form>
</body>
</html>