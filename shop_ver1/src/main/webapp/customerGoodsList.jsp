<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.CustomerService"%>
<%@page import="java.util.*"%>
<%
	//Controller : java class <-- Servet
	int rowPerPage = 20;
	if(request.getParameter("rowPerPage") != null){
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
	}
	
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	CustomerService customerService = new CustomerService();
	
	<!-->
	List<Map<String, Object>> list = customerService.getCustomerGoodsListByPage(rowPerPage, currentPage);
%>

<!-- 분리하면 servlet / 연결기술 forword(request, response)/ jsp -->

<!-- session에 넣지 말고 request.setAttribute에 모델명은 넣어서 사용(담길때는 Object타입으로 담김) -->

<!-- send redirect는 새로 가져오는것 -->

<!-- View : 태그 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- for/ if 대체기술 : 커스텀태그(JSRL & EL) JSP -->
	<div>
		<a href="">인기수</a>
		<a href="">주문수</a>
		<a href="">낮은가격수</a>
		<a href="">높은가격수</a>
		<a href="">최신수</a>
	</div>
	<table border="1">
		<tr>
			<%
				int i = 1;
				for(Map<String, Object> m : list){
			%>
				<td>
					<div>
						<a href=""><!-- 이미지 누르면 상세 페이지로가게 -->
							<img src="<%=request.getContextPath()%>/upload/<%=m.get("filename")%>" width="200" height="200">
						</a>
					</div>
					<div><%=m.get("goodsName")%></div>
					<div><%=m.get("goodsPrice")%></div>
					<!-- 리뷰 개수 -->
					
					1
				</td>
			<%
				if(i%4==0){
			%>
					</tr><tr>
			<%
					}
					i++;
				}
				int tdCnt = 4 - (list.size() % 4);
				if(tdCnt == 4 ){
					tdCnt = 0;
				}
				
				for(int j=0; j<tdCnt; j++){
			%>		
				<td>&nbsp;</td>
			<%
				}
			%>
		</tr>
	</table>
	<!-- 페이징 + 상품검색 -->
</body>
</html>