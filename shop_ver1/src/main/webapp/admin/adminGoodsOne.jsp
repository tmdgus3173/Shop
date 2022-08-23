<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="service.GoodsService"%>
<%@page import="repository.GoodsDao"%>
<%@page import="vo.Goods"%>
<%@page import="java.util.Map"%>

<%
	if(session.getAttribute("login"+session.getAttribute("user")) == null){
			response.sendRedirect(request.getContextPath() + "/loginForm.jsp?errorMsg = login first");
			return;
	}

	int goodsNo = Integer.parseInt(request.getParameter("goods_no"));
	System.out.println("adminGoodsOne.jsp goodsNo : " + goodsNo);
	
	GoodsService goodsService = new GoodsService();// 생성
	
	Map<String, Object> map = goodsService.getGoodsAndImgOne(goodsNo);
	
	System.out.println("adminGoodsOne.jsp map : " + map.toString());
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="padding: 50px 100px 50px;">
<div><a href="./adminGoodsList.jsp">홈으로</a></div>
   <table border="1">
      <tr>
         <td>상품이미지</td>
         <td><img src="<%=request.getContextPath()%>/upload/<%=map.get("fileName")%>"></td>
      </tr>
      <tr>
         <td>번호</td>
         <td><%=map.get("goodsNo")%></td>
      </tr>
      <tr>
         <td>상품이름</td>
         <td><%=map.get("goodsName")%></td>
      </tr>
      <tr>
         <td>상품가격</td>
         <td><%=map.get("goodsPrice")%></td>
      </tr>
      <tr>
         <td>마지막수정날짜</td>
         <td><%=map.get("updateDate")%></td>
      </tr>
      <tr>
         <td>작성날짜</td>
         <td><%=map.get("createDate")%></td>
      </tr>
      <tr>
         <td>상품매진여부</td>
         <td><%=map.get("soldOut")%></td>
      </tr>
      <tr>
         <td>이미지제목</td>
         <td><%=map.get("fileName")%></td>
      </tr>
      <tr>
         <td>이미지원본제목</td>
         <td><%=map.get("originalFilename")%></td>
      </tr>      
      <tr>
         <td>이미지타입</td>
         <td><%=map.get("contentType")%></td>
      </tr>
      <tr>
         <td>
            <a href="./updateAdminGoodsForm.jsp?goodsNo=<%=map.get("goodsNo")%>">수정</a>
         </td>
         <td>
            <a href="./deleteAdminGoodsForm.jsp?goodsNo=<%=map.get("goodsNo")%>">삭제</a>
         </td>
      </tr>
   </table>
</div>
</body>
</html>