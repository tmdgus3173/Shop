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
	<div>
		<a href="./index.jsp">로그인페이지로</a>
	</div>
		<table border="1">
			<tr>
				<td>ID</td>
				<td>
					<input type="hidden" value="Customer" name="CustomerId" id="CustomerId">
					<%=customer.getCustomerId()%>
				</td>
			</tr>
			<tr>
				<td>NAME</td>
				<td><%=customer.getCustomerName()%></td>
			</tr>
			<tr>
				<td>ADDRESS</td>
				<td><%=customer.getCustomerAddress()%></td>
			</tr>
			<tr>
				<td>TELEPHONE</td>
				<td><%=customer.getCustomerTelephone()%></td>
			</tr>
			<tr>
				<td>CREATEDATE</td>
				<td><%=customer.getCreateDate()%></td>
			</tr>
		</table>
		<a href="<%=request.getContextPath()%>/pw/UpdateCustomerPwForm.jsp?CustomerId=<%=customer.getCustomerId()%>">비밀번호 변경</a>
		<a href="./">계정정보 수정</a>
		<a href="<%=request.getContextPath()%>/Customerdelete.jsp?CustomerId=<%=customer.getCustomerId()%>">계정정보 삭제</a>
	</div>
</body>
</html>