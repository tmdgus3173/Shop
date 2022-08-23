<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Employee"%>
<%@page import="repository.EmployeeDao"%>
<%@page import="service.EmployeeService"%>

<%
	// 권한이 Y인 관리자만 들어올 수 있게..
	
	if (!(session.getAttribute("user").equals("Employee")&&session.getAttribute("login"+session.getAttribute("user")) != null)) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	
	int rowPerPage = 5; 
	int currentPage = 1;
	int lastPage = 0;
	
	if(request.getParameter("currentPage") != null){ 
		//currentPage가 null이 아니면
		//currentPage값을 넣어준다.
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	
	EmployeeService employeeService = new EmployeeService();
	ArrayList<Employee> list = new ArrayList<Employee>();
	list = employeeService.getEmployeeList(rowPerPage, currentPage);	// list
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin-bottom:40px">
	<br>	 <a href="<%=request.getContextPath()%>/index.jsp">홈으로</a>
			 <a href="<%=request.getContextPath()%>/EmployeeList.jsp">사원관리</a>
   			 <a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a>
			 <a href="<%=request.getContextPath()%>/orders/adminOrderList.jsp">상품관리</a> 
			 <a href="<%=request.getContextPath()%>/customer/adminCustomerList.jsp">고객관리</a>
		 	 <a href="<%=request.getContextPath()%>/notice/adminNoticeList.jsp">공지관리</a>
	</div>

	<div>

		<table border = "1">
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>수정날짜</th>
					<th>생성날짜</th>
					<th>권한</th>
					<th>권한변경</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Employee e : list) {
				%>
				<tr>
					<td><%=e.getEmployeeId()%></td>
					<td><%=e.getEmployeeName()%></td>
					<td><%=e.getUpdateDate()%></td>
					<td><%=e.getCreateDate()%></td>
					<td><%=e.getActive()%></td>
					<td>
						<form action="<%=request.getContextPath()%>/updateEmployeeAction.jsp" method="post">
							<input type="hidden" name="employeeId" value="<%=e.getEmployeeId()%>">
							<select name="active">
								<%
								if (e.getActive().equals("N")) { //active값이 N이면
								%>
								<option>Y</option>
								<option selected="selected">N</option>	<!-- 디폴트값은 N로 설정되어있게 -->
								<%
								} else { //active값이 Y이면
								%>
								<option selected="selected">Y</option> <!-- 디폴트값은 Y로 설정되어있게 -->
								<option>N</option>
								<%
								}
								%>
							</select>
						<button type="submit">권한변경</button>
					</form>
					</td>
					</tr>
					<%
					}
					%>
				
			</tbody>
		</table>

		<!-- 페이징 -->
		<%
		lastPage = employeeService.getlastPage(rowPerPage);					// 페이징
		System.out.println("employeeList.jsp lastPage : "+lastPage);
		System.out.println("employeeList.jsp currentPage : "+currentPage);
		System.out.println("!!!!2.EmployeeList!!!!");
		
		if (currentPage > 1) { //현재페이지가 1보다 클때
			System.out.println("이전페이지로");
		%>
		<a
			href="<%=request.getContextPath()%>/EmployeeList.jsp?currentPage=<%=currentPage-1%>">이전</a>
		<%
		}

		if (currentPage < lastPage) { //현재페이지가 마지막 페이지보다 작을때
			System.out.println("다음페이지로");
		%>
		<a
			href="<%=request.getContextPath()%>/EmployeeList.jsp?currentPage=<%=currentPage+1%>">다음</a>

		<%
		}
		%>

	</div>
</body>
</html>