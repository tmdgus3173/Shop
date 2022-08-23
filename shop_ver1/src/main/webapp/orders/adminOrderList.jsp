<%@page import="java.util.HashMap"%>
<%@page import="vo.Orders"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("login"+session.getAttribute("user")) == null){
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}

	int rowPerPage = 2; //페이지당 보여줄 행의 수  
	int currentPage = 1; //처음 시작할 현재 페이지
	
	if(request.getParameter("currentPage") != null){ 
		//currentPage가 null이 아니면
		//currentPage값을 넣어준다.
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int lastPage = 0;
	OrdersService ordersService = new OrdersService();
	lastPage = ordersService.getLastPage(rowPerPage);
	List<Map<String, Object>> list = new ArrayList<>();
	list = ordersService.getOrdersList(rowPerPage, currentPage);
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
		<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a><!-- 상품목록/등록/수정/삭제(주문이 없는경우) -->
		<a href="<%=request.getContextPath()%>/orders/adminOrderList.jsp">주문관리</a><!-- 주문목록/수정 -->
		<a href="<%=request.getContextPath()%>/customer/adminCustomerList.jsp">고객관리</a><!-- 고객목록/강제탈퇴/비밀번호수정(전달구현x) -->
		<a href="<%=request.getContextPath()%>/notice/adminNoticeList.jsp">공지관리</a>
	</div>
	<div>
		
		<table border="1">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>상품번호</th>
					<th>주문자아이디</th>
					<th>주문갯수</th>
					<th>주문가격</th>
					<th>배송주소</th>
					<th>주문진행상태</th>
					<th>수정날짜</th>
					<th>주문한날짜</th>
					<th>상품번호</th>
					<th>상품이름</th>
					<th>상품가격</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(Map<String, Object> map : list){
				%>
				<tr>
					<td><%=map.get("orderNo")%></td>
					<td><%=map.get("goodsNo")%></td>
					<td><a href="<%=request.getContextPath()%>/orders/adminOrderOne.jsp?customerId=<%=map.get("customerId")%>"><%=map.get("customerId")%></a></td>
					<td><%=map.get("orderQuantity")%></td>
					<td><%=map.get("orderPrice")%></td>
					<td><%=map.get("orderAddress")%></td>
					<td>
						<form action="<%=request.getContextPath()%>/action/updateOrderStateAction.jsp" method="post">
							<input type="hidden" name="orderNo" value="<%=map.get("orderNo")%>">
							<select name="state">
								<%
									if(map.get("orderState").equals("배송전")){
								%>
									<option selected="selected">배송전</option>	<!-- 디폴트값은 배송전로 설정되어있게 -->
									<option>배송중</option>
									<option>배송완료</option>
								<%
									} else if (map.get("orderState").equals("배송중")) { //active값이 배송전이면
								%>
									<option>배송전</option>
									<option selected="selected">배송중</option>	<!-- 디폴트값은 배송중로 설정되어있게 -->
									<option>배송완료</option>
								<%
									}else{
								%>
									<option>배송전</option>
									<option>배송중</option>
									<option selected="selected">배송완료</option>	<!-- 디폴트값은 배송완료로 설정되어있게 -->
								<%
									}
								%>
							</select>
							<button type="submit">변경</button>
						</form>
					</td>
					
					<td><%=map.get("updateDateO")%></td>
					<td><%=map.get("createDateO")%></td>
					<td><%=map.get("goodsNo")%></td>
					<td><%=map.get("goodsName")%></td>
					<td><%=map.get("goodsPrice")%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<!-- 페이지 이전 다음 -->

		<%
			if(currentPage > 1){ //현재페이지가 1보다 클 경우(1페이지가 아닐경우)
		%>
			<a href="<%=request.getContextPath()%>/admin/adminOrderList.jsp?currentPage=<%=currentPage-1%>">이전</a>
		<%
			}
			
			if(currentPage < lastPage){ //현재페이지가 마지막페이지보다 전일 경우
		%>
			<a href="<%=request.getContextPath()%>/admin/adminOrderList.jsp?currentPage=<%=currentPage+1%>">다음</a>
		<%
			}
		%>
		</form>
	</div>
</body>
</html>