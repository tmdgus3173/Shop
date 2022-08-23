<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
   <!-- id ck form -->
   <form action="<%=request.getContextPath()%>/idCheckAction.jsp" method="post">
      <div>
         ID 체크
         <input type="text" name="ckid">
         <input type="hidden" name="c" id="c" value="Customer">
         <!-- hidden을 사용해서 화면에 보이지 않지만 값이 넘어갈 수 있게 Customer이라는 문자를 c라는 id값에 넣어줌 -->
         <button type="submit">아이디중복검사</button>
      </div>
   </form>
   
   <!-- 고객가입 form -->
   <%
      String ckId = "";
      if(request.getParameter("ckId") != null) {ckId = request.getParameter("ckId");}
   %>
<div style="margin-top:20px">
   <form action="<%=request.getContextPath()%>/insertCustomerAction.jsp" method="post">
      <table border="1">
         <tr>
            <td>customerId</td>
            <td>
               <input type="text" name="customerId" id="customerId" 
                  readonly="readonly" value="<%=ckId%>"> <!-- ckId값이 중복되지 않으면 id값에 바로 넣어표시해주기 -->
                  
            </td>
         </tr>
         <tr>
         	<td>customerPass</td>
         	<td><input type="password" name="customerPass" id="customerPass"></td>
         </tr>
         <tr>
         	<td>customerName</td>
         	<td><input type="text" name="customerName" id="customerName"></td>
         </tr>
         <tr>
         	<td>customerAddress</td>
         	<td><input type="text" name="customerAddress" id="customerAddress"></td>
         </tr>
         <tr>
         	<td>customerTelephone</td>
         	<td><input type="text" name="customerTelephone" id="customerTelephone"></td>
         </tr>
      </table>
        <button type="submit" class="btn btn-success">추가</button>
		<button type="reset" class="btn btn-danger">초기화</button>
   </form>
</div>
</div>
</body>
</html>