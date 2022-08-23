<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.*"%>
<%@ page import = "com.oreilly.servlet.multipart.*"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="repository.*"%>
<%@ page import = "service.GoodsService"%>
<%@ page import = "vo.*"%>
<%@page import="java.io.File"%>
<%
	//Goods
	GoodsService goodsService = new GoodsService();
	Goods goods = new Goods();
	
	//GoodsImg
	GoodsImgDao goodsImgDao = new GoodsImgDao();
	GoodsImg goodsImg = new GoodsImg();
	
	request.setCharacterEncoding("utf-8"); //인코딩
	
	String dir = request.getServletContext().getRealPath("/upload"); //업로드 할 폴더 위치지정
	System.out.println(dir);
	
	int max = 10 * 1024 * 1024; 
	
	MultipartRequest mRequest = new MultipartRequest(request, dir, max ,"utf-8", new DefaultFileRenamePolicy());
	
	String goodsName = mRequest.getParameter("goodsName"); //값 가져와서 변수에 넣어주기
	int goodsPrice = Integer.parseInt(mRequest.getParameter("goodsPrice"));
	
	String contentType = mRequest.getContentType("goodsImg"); 
	String originFilename = mRequest.getOriginalFileName("goodsImg"); 
	String filename = mRequest.getFilesystemName("goodsImg"); 
	
	if(!(contentType.equals("image/gif")||contentType.equals("image/png")||contentType.equals("image/jpeg"))){
		//이미 업로드된 파일을 삭제
		File f = new File(dir + "\\" + filename);
		if(f.exists()){//파일까지 삭제하고 새로 업로드 해야되기때문에, 수정란에도 필요
			f.delete();
		}
		
		String errorMsg = URLEncoder.encode("이미지파일만 가능합니다.","utf-8");
		response.sendRedirect(request.getContextPath()+"/admin/addGoods.jsp?errorMsg="+errorMsg);
		return;
	}
	
	System.out.println(contentType + " <-- contentType");
	System.out.println(originFilename + " <-- originFilename");
	System.out.println(filename + " <-- filename");
	
	//goods테이블에 추가할 데이터 셋팅
	goods.setGoodsName(goodsName);
	goods.setGoodsPrice(goodsPrice);
	
	//goodsImg테이블에 추가할 데이터 셋팅
	goodsImg.setFilename(filename);
	goodsImg.setOriginalFilename(originFilename);
	goodsImg.setContentType(contentType);
	
	//goods
	goodsService.addGoods(goods, goodsImg);
	
	response.sendRedirect("./adminGoodsList.jsp");
%>