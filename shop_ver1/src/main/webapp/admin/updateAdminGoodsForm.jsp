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

	int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
	System.out.println("updateAdminGoodsForm.jsp goodsNo : " + goodsNo);
	
	GoodsService goodsService = new GoodsService();// 생성
	
	Map<String, Object> map = goodsService.getGoodsAndImgOne(goodsNo);
	
	System.out.println("updateAdminGoodsForm.jsp map : " + map.toString());
	
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
	<form action="<%=request.getContextPath()%>/admin/updateAdminGoodsAndImgAction.jsp"
				method="post" enctype="multipart/form-data">
   <table border="1">
      <tr>
         <td>상품이미지</td>
         <td><img src="<%=request.getContextPath()%>/upload/<%=map.get("fileName")%>"></td>
      </tr>
      <tr>
         <td>번호</td>
         <td>
         	<input type="text" name="goodsNo" 
        	 value="<%=map.get("goodsNo")%>"readonly="readonly">
         </td>
      </tr>
      <tr>
         <td>상품이름</td>
         <td>
         	<input type="text" name="goodsName" value="<%=map.get("goodsName")%>">
         </td>
      </tr>
      <tr>
         <td>상품가격</td>
         <td>
         	<input type="text" name="goodsPrice" value="<%=map.get("goodsPrice")%>">
         </td>
      </tr>
      <tr>
         <td>상품매진여부</td>
         <td>
         	<select name = "soldOut">
         		<%
         			if(map.get("soldOut").equals("N")){
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
         </td>
      </tr>
      <tr>
         <td>이미지사진파일</td>
         <td>
         <input type="hidden" name="f" value="<%=map.get("fileName")%>">
         <input type="file" name="file" <%=map.get("originalFilename")%>>
         </td>
      </tr>      
   </table>
   <button type="submit">입력</button>
   <button type="reset">초기화</button>
</form>
</div>
</body>
</html>