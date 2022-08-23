<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Customer"%>
<%@page import="java.util.List"%>
<%@page import="service.CustomerService"%>
<%@page import="repository.CustomerDao"%>
<%
	//권한이 Y인 관리자만 들어올 수 있음
	
	if(session.getAttribute("login"+session.getAttribute("user")) == null){
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}

	if (!(session.getAttribute("user").equals("Employee")&&session.getAttribute("login"+session.getAttribute("user")) != null)) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}


	int rowPerPage = 5; //한페이지당 보여줄 행 수 
	int currentPage = 1; //처음 시작할 현재 페이지
	int lastPage = 0;
	
	if(request.getParameter("currentPage") != null){ 
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	
	
	CustomerService customerService = new CustomerService();
	List<Customer>list = new ArrayList<Customer>();
	list = customerService.getCustomerList(rowPerPage, currentPage); //list보여주기
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin-bottom : 40px">
		<a href="<%=request.getContextPath()%>/index.jsp">홈으로</a>
		<a href="<%=request.getContextPath()%>/EmployeeList.jsp">사원관리</a>
		<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a>
		<a href="<%=request.getContextPath()%>/orders/adminOrderList.jsp">주문관리</a>
		<a href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp">고객관리</a>
		<a href="<%=request.getContextPath()%>/notice/adminNoticeList.jsp">공지관리</a>
	</div>
	<div>
		<table border = "1">
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>수정날짜</th>
					<th>생성날짜</th>
					<th>계정삭제</th>
					<th>비밀번호초기화</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(Customer c : list){
				%>
				<tr>
					<td><%=c.getCustomerId()%></td>
					<td><%=c.getCustomerName()%></td>
					<td><%=c.getCustomerAddress()%></td>
					<td><%=c.getCustomerTelephone()%></td>
					<td><%=c.getUpdateDate()%></td>
					<td><%=c.getCreateDate()%></td>
					<td><a href="<%=request.getContextPath()%>/admin/adminCustomerDeleteAction.jsp?customerId=<%=c.getCustomerId()%>"><button>계정삭제</button></a></td>
					<td><a href="<%=request.getContextPath()%>/admin/adminCustomerPwUpdateAction.jsp?customerId=<%=c.getCustomerId()%>"><button>비밀번호초기화</button></a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		
		<!-- 페이징 -->
		<%
			lastPage = customerService.getlastPage(rowPerPage);
			System.out.println("adminCustomerList.jsp lastPage : "+lastPage);
			System.out.println("adminCustomerList.jsp currentPage : "+currentPage);

			
			if(currentPage > 1){ //현재페이지가 1보다 클때
				
		%>
		
			<a href = "<%=request.getContextPath()%>/customer/adminCustomerList.jsp?currentPage=<%=currentPage-1%>">이전</a>
		
		<%
			}
			
			if(currentPage < lastPage){
				
		%>
		
			<a href = "<%=request.getContextPath()%>/customer/adminCustomerList.jsp?currentPage=<%=currentPage+1%>">다음</a>
		
		<%
			}
		%>
	</div>
</body>
</html>