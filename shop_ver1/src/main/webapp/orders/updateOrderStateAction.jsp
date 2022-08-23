<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.Orders"%>
<%@ page import="service.OrdersService"%>
<%
	request.setCharacterEncoding("utf-8"); //인코딩	
	
	int row = 0; //성공실패 확인하기 위한 row변수 선언
	int orderNo = Integer.parseInt(request.getParameter("orderNo")); //orderNo가져와주기
	String state = request.getParameter("state");
	
	//디버깅
	System.out.println(orderNo + " <-- updateOrderNo");
	System.out.println(orderNo + " <-- updateOrderNo");
	
	Orders orders = new Orders(); //생성자 생성
	
	orders.setOrderNo(orderNo);
	orders.setOrderState(state);
	
	OrdersService ordersService = new OrdersService();
	
	row = ordersService.modifyOrdersState(orders); //ordersService.modifyOrdersState(orders)
	
	if(row == 1){		// row값이 1이면 수정 성공
		System.out.println("관리자 권한 수정 성공!");
		response.sendRedirect(request.getContextPath() + "/orders/adminOrderList.jsp");
	} else {			// row값이 0이면 수정 실패
		System.out.println("관리자 권한 수정 실패!");
		response.sendRedirect(request.getContextPath() + "/orders/adminOrderList.jsp");
	}
	
%>