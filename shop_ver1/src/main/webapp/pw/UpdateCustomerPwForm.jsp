<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "repository.*"%>
<%@ page import = "vo.*"%>
<%
	Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	CustomerDao customerDao  = new CustomerDao();
	Customer customer = customerDao.selectCusetomerOne(loginCustomer.getCustomerId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div><a href="./CustomerDetail.jsp">상세페이지로</a></div>
	<form action="<%=request.getContextPath()%>/pw/UpdateCustomerPwAction.jsp" method="post">
		<table border="1">
			<tr>
				<td>ID</td>
				 <td><input type="text" name="id" value="<%=customer.getCustomerId()%>" readonly = "readonly"></td>
			</tr>
			<tr>
		         <td>PW</td>
		         <td><input type="password" name="pw"></td>
	      	</tr>
	     	<tr>
		         <td>NEWPW</td>
		         <td><input type="password" name="newPw"></td>
      		</tr>
		</table>
		<button type="submit">비밀번호 변경</button>
	</form>
</div>
</body>
</html>