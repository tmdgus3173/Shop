<%@page import="java.util.ArrayList"%>
<%@page import="vo.Goods"%>
<%@page import="java.util.List"%>
<%@page import="service.GoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("login"+session.getAttribute("user")) == null){
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}

	int rowPerPage = 5; //한페이지당 보여줄 행 수 
	int currentPage = 1; //처음 시작할 현재 페이지
	
	
	if(request.getParameter("currentPage") != null){ 
		//currentPage가 null이 아니면
		//currentPage값을 넣어준다.
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int lastPage = 0;
	
	GoodsService goodsService = new GoodsService();
	lastPage = goodsService.getLastPage(rowPerPage);
	
	List<Goods> list = new ArrayList<Goods>();
	list = goodsService.getGoodsListByPage(rowPerPage, currentPage); //list보여주기
	
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
		<form action="<%=request.getContextPath()%>/admin/addGoods.jsp">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>가격</th>
					<th>수정날짜</th>
					<th>생성날짜</th>
					<th>재고유무</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(Goods g : list){
				%>
				<tr>
					<td><%=g.getGoodsNo()%></td>
					<td>
					<a href="<%=request.getContextPath()%>/admin/adminGoodsOne.jsp?goods_no=<%=g.getGoodsNo()%>"><%=g.getGoodsName()%>
					</a>
					</td>
					<td><%=g.getGoodsPrice()%></td>
					<td><%=g.getUpdateDate()%></td>
					<td><%=g.getCreateDate()%></td>
					<td><%=g.getSoldOut()%></td>
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
			<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp?currentPage=<%=currentPage-1%>">이전</a>
		<%
			}
			
			if(currentPage < lastPage){ //현재페이지가 마지막페이지보다 전일 경우
		%>
			<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp?currentPage=<%=currentPage+1%>">다음</a>
		<%
			}
		%>
			<button type="submit">상품추가</button>
		</form>
	</div>
</body>
</html>