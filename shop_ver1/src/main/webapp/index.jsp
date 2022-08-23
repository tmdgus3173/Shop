<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="vo.*"%>
<%
	if(session.getAttribute("login"+session.getAttribute("user")) == null){
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}
	Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	Employee loginEmployee = (Employee)session.getAttribute("loginEmployee");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
</head>
<body>
<div>
	<fieldset>
   <table border="1">
   <tr>
   		<td>id</td>
   		<td>
   			<input type="hidden" name="<%=session.getAttribute("user")%>Id" id="<%=session.getAttribute("user")%>Id" value="<%=session.getAttribute("id")%>">
   			<%=session.getAttribute("id")%>
   		</td>
   </tr>
   <tr>
   		<td>name</td>
   		<td><%=session.getAttribute("name")%>
   		</td>
   </tr>
   
   </table>
   </fieldset>
   <div style="margin-top:20px">
  	 <a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
  	 <a href="<%=request.getContextPath()%>/<%=session.getAttribute("user")%>Detail.jsp">상세정보보기</a>
   </div>
   <%
  	 if(session.getAttribute("user").equals("Employee") && session.getAttribute("active").equals("Y")){//user값이 Employee일때 실행
   %>
   <div>
   		<a href="<%=request.getContextPath()%>/EmployeeList.jsp">사원관리</a>
   		<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a>
   		<a href="<%=request.getContextPath()%>/orders/adminOrderList.jsp">주문관리</a>
   		<a href="<%=request.getContextPath()%>/customer/adminCustomerList.jsp">고객관리</a>
   		<a href="<%=request.getContextPath()%>/notice/adminNoticeList.jsp">공지관리</a>
   </div>
   <%
   	}
   %>
</div>
</body>
</html>