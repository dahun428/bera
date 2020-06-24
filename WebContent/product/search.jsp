<%@page import="com.br.utils.StringUtil"%>
<%@page import="com.br.dao.SearchDao"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.br.vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.br.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<div class="wrapper">
		<div class="header">
			<%@ include file="/common/header.jsp"%>
		</div>
		<div class="navi">
			<%
			
			String category = request.getParameter("category");
			String searchValue = request.getParameter("search");
			System.out.println("search, searchValue : "+searchValue);
			String searchTag = request.getParameter("tag");
			String tagName = "#"+searchTag;
			
			String position = "search";

			SearchDao searchDao = new SearchDao();
			ProductDao productDao = new ProductDao();
			List<Product> products = null;
			
			if(!StringUtils.isEmpty(searchValue) && !StringUtils.isEmpty(category)){
				products = searchDao.getProductsByCategory(category, searchValue);
				System.out.println("get search and cate : " + products);
			} else if(!StringUtils.isEmpty(searchTag)){
				products = productDao.getProductsByTag(tagName);
				System.out.println("get tag : " + products);
			} else if(!StringUtils.isEmpty(searchValue)){
				products = searchDao.getAllProducts(searchValue);
				System.out.println("get allproducts : " + products);
			}
			%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<div class="container">
				<div class="row">
					<div class="col-12 br-event-container">
						<!-- category name -->
						<h4 class="display-4 text-center">Search</h4>
						<hr />
						<!-- category name end -->
						<div class="row">
						<%
							if(category != null || searchValue != null || searchTag != null){
								
						%>
							<div id="search-result" class="col-12 text-center" style="margin: 20px auto;">
								<h6>검색결과 총 <span class="color-pink"><strong><%=products == null? "0" : products.size() %></strong></span>건이 조회되었습니다.</h6>
							</div>
							<div class="col-12 text-center" style="margin: 10px auto;">
								<button type="button" id="search-btn-replay" class="btn btn-outline-primary btn-lg">다시검색</button>
							</div>
						<%
							}
						%>
							<!-- search form -->
							<div class="col-12 card" id="search-bar" style="display: <%=(category == null && searchValue == null && searchTag == null) ? "block" : "none" %>">
							<form action="searchregister.jsp" id="search-form" method="post">
							<div class="row">
								<table class="table table-borderless">
									<tbody>
										<tr>
											<td style="padding-top: 16px;"><span class="color-pink">카테고리명</span></td>
											<td>
												<select name="category" class="custom-select" id="search-category-selectbox">
													<option value="">전체</option>
													<option value="ICECREAM">아이스크림</option>
													<option value="CAKE">아이스크림 케이크</option>
												</select>
											</td>
											<td><input type="text" class="form-control" id="search-name-value" name="searchValue"/></td>
											<td style="padding-top: 16px;"><span class="color-pink">해시태그</span></td>
											<td>
												<input type="text" class="form-control" name="hashtag" id="search-hashtag-value"/>
											</td>
											<td>
												<button type="submit" id="search-btn" class="btn btn-primary">검색</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							</form>
						</div>
						<div class="col-12">
								<hr />
							</div>
						<!--  search form -->
						</div>
						<!-- product list -->
						<div class="row custom-content-box">
							<!-- product -->
						<%
						if(products != null){
						%>

							<%
								for (Product product : products) {
									List<String> tags = product.getTags();
							%>
							<div class="col-3 list-box">
								<div class="card" id="product-list-<%=product.getNo()%>"
									style="height: 340px; font-size: 8px;">
									<div class="card-body">
										<h6 class="card-title text-center"><%=product.getName()%></h6>
										<hr />
										<div class="card-text text-center">
											<ul style="list-style: none; text-align: left;">
												<%
													if (tags.size() > 2) {
															for (int i = 0; i < 2; i++) {
												%>
												<li style="display: inline;"><a
													href="search.jsp?tag=<%=tags.get(i).substring(1)%>"><%=tags.get(i)%>
												</a></li>
												<%
													}
												%>
												<li style="display: inline;"><a href="javascript:;"
													onclick="tagList(<%=product.getNo()%>)">...</a></li>
												<%
													} else {
															for (String tag : tags) {
												%>
												<li style="display: inline;"><a
													href="search.jsp?tag=<%=tag.substring(1)%>"><%=tag%> </a></li>
												<%
													}
														}
												%>
											</ul>
										</div>
										<div class="card-text text-center">
											<a href="detail.jsp?productNo=<%=product.getNo()%>"
												class="btn btn-primary btn-sm">구매</a>
										</div>
										<a href="detail.jsp?productNo=<%=product.getNo()%>"><img class="card-img-top"
											src="../image/<%="ICECREAM".equals(product.getCategory()) ? "ICECREAM/":"CAKE/"%><%=product.getImagePath()%>"
											alt="" />
										</a>
									</div>
								</div>
								<%
									if (tags.size() > 2) {
								%>
								<div class="card" id="product-tag-<%=product.getNo()%>"
									style="height: 340px; font-size: 8px; display: none;">
									<div class="card-body">
										<ul>
											<%
												for (String tag : tags) {
											%>
											<li><a href="search.jsp?tag=<%=tag.substring(1)%>"><%=tag%></a></li>
											<%
												}
											%>
										</ul>
										<button class="btn btn-secondary btn-sm"
											onclick="dispItem(<%=product.getNo()%>)">뒤로</button>
									</div>
								</div>
								<%
									}
								%>
							</div>
							<%
								}
						}
							%>
							
							<!-- product -->
						</div>
						<!-- product list -->
					</div>
				</div>
				<%if("0".equals(session.getAttribute("LOGINED_ADMIN"))){ %>
				<div class="row">
					<div class="col-1-sm">
						<a href="productform.jsp" class="btn btn-primary">상품 등록</a>
					</div>
				</div>
				<%} %>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
		<script type="text/javascript">
        function tagList(productNo,event) {
            var itemDiv = document.querySelector("#product-list-" + productNo)
            var tagDiv = document.querySelector("#product-tag-" + productNo)
            itemDiv.style.display = "none"
            tagDiv.style.display = "block"
 
        }

        function dispItem(productNo) {
            var itemDiv = document.querySelector("#product-list-" + productNo)
            var tagDiv = document.querySelector("#product-tag-" + productNo)
            itemDiv.style.display="block"
            tagDiv.style.display="none"
        }

    </script>
    <script src="../js/searchpagenation.js" type="text/javascript"></script>
	</div>
</body>
</html>