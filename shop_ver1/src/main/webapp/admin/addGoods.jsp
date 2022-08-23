<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	if (!(session.getAttribute("user").equals("Employee")&&session.getAttribute("login"+session.getAttribute("user")) != null)) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp"><h1>GoodsList</h1></a>
	</div>
	<div>
	<h1> 판매상품 등록 </h1>
	<form action="<%=request.getContextPath()%>/admin/addGoodsAction.jsp"
				 method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>상품명</td>
				<td>
					<input type="text" name="goodsName" id="goodsName">
				</td>
			</tr>	
			<tr>
				<td>상품가격</td>
				<td>
					<input type="text" name="goodsPrice" id="goodsPrice">
				</td>
			</tr>
			<tr>
				<td>상품사진파일</td>
				<td>
					<input type="file" name="goodsImg">
				</td>
			</tr>

		</table>
        <button type="submit" class="btn btn-success">상품판매등록</button>
		<button type="reset" class="btn btn-danger">초기화</button>
	</form>
	</div>
</body>
</html>