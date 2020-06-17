<%@page import="com.br.dao.ProductDao"%>
<%@page import="com.br.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.UUID"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="com.br.utils.FileUtil"%>
<%@page import="java.util.Map"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.utils.BRStatics"%>
<%@page import="java.io.File"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Paths"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = "";
	if (request.getHeader("User-Agent").indexOf("Windows") > 0) {
		//윈도우인 경우
		path = BRStatics.ROOT_PATH;
	} else if (request.getHeader("User-Agent").indexOf("Mac") > 0) {
		path = BRStatics.ROOT_PATH_FOR_MAC;
		//맥인 경우
	}
	//다시만들어
	DiskFileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setHeaderEncoding("utf-8");

	List<FileItem> items = upload.parseRequest(request);
	Map<String, String> paramMap = new HashMap<String,String>();
	FileItem item = null;
	for(FileItem fi : items){
		if(fi.isFormField()){
		String fieldName = fi.getFieldName();
		String value = new String((fi.getString().getBytes("8859_1")),"utf-8");
		paramMap.put(fieldName, value);
		}else{
			item = fi;
		}
	}
	String filename = UUID.randomUUID().toString()+"-" + new File(item.getName()).getName();
	String name = paramMap.get("name");
	String category = paramMap.get("category");
	int price = NumberUtil.stringToInt(paramMap.get("price"));
	int point = NumberUtil.stringToInt(paramMap.get("amount"));
	int amount = NumberUtil.stringToInt(paramMap.get("point"));
	int discountPrice = NumberUtil.stringToInt(paramMap.get("discountPrice"));
	String tagVal = paramMap.get("tag");
	String explain = paramMap.get("explain");
	ArrayList<String> tags = new ArrayList<String>();
	for(String str : tagVal.split(",")){
		tags.add("#"+str);
	}
	Product product = new Product();
	product.setName(name);
	product.setPrice(price);
	product.setPoint(point);
	product.setDiscountPrice(discountPrice);
	product.setAmount(amount);
	product.setCategory(category);
	product.setTags(tags);
	product.setExplain(explain);
	product.setImagePath(filename);
	
	item.write(new File(path+("ICECREAM".equals(category)? "ICECREAM/":"CAKE/")+filename));
	System.out.println(path+("ICECREAM".equals(category)? "ICECREAM/":"CAKE/")+filename);

	ProductDao productDao = new ProductDao();
	productDao.insertProduct(product);

	response.sendRedirect("list.jsp?category="+category);

%>