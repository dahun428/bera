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
				String position = "menu";
			%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<%
			String cat = request.getParameter("category");
			ProductDao productDao = new ProductDao();
			List<Product> products = productDao.getProductsByCategory(cat);
			List<Product> rankedProducts = productDao.getProductForRank(cat);
		%>
		<div class="body">
			<div class="list-banner">
				<!-- 카테고리에 따라서 배너 이미지 바꾸기 -->
				<img
					src="../image/<%="ICECREAM".equals(cat) ? "list-banner-img-cream.jpg" : "list-banner-img-cake.jpg"%>"
					alt="" />
				<!-- banner end -->
			</div>
			<div class="container">

				<div class="row">
					<%
						if ("ICECREAM".equals(cat)) {
					%>
					<!-- monthly best item -->
					<div class="col-12">
						<!-- 카테고리가 ice cream 일경우에만 best item 뜨게 만들기 -->
						<h4 class="display-4 text-center">BEST ITEM</h4>
						<hr />
						<div class="row">
							<%
								Product product;
									for (int i = 1; i <= rankedProducts.size(); i++) {
										product = rankedProducts.get(i-1);
							%>

							<div class="col-2 text-center">
								<span class="badge badge-pill badge-info"><%=i%>위</span>
								<!-- product-detail-page-move -->
								<a href="detail.jsp?productNo=<%=product.getNo()%>"> <!-- product-detail-page-move --> <img
									class="img-thumbnail"
									src="../image/<%=cat %>/<%=product.getImagePath()%>" alt="" />
								</a>
								<div class="title text-center">
									<p>
										<!-- product-detail-page-move -->
										<a href="detail.jsp?productNo=<%=product.getNo()%>"><%=product.getName()%></a>
										<!-- product-detail-page-move -->
									</p>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>
					<%
						}
					%>
					<!-- monthly best item -->
					<div class="col-12 br-event-container">
						<!-- category name -->
						<h4 class="display-4 text-center"><%="ICECREAM".equals(cat) ? "ICE CREAM" : " ICE CREAM CAKE"%></h4>
						<!-- category name end -->
						<hr />
						<!-- product list -->
						<div class="row custom-content-box">
							<!-- product -->
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
												<%if (tags.size() > 2) {
															for (int i = 0; i < 2; i++) {%>
												<li style="display: inline;"><a
													href="search.jsp?tag=<%=tags.get(i).substring(1)%>"><%=tags.get(i)%>
												</a></li>
												<%}%>
												<li style="display: inline;"><a href="javascript:;"
													onclick="tagList(<%=product.getNo()%>)">...</a></li>
												<%} else {
															for (String tag : tags) {%>
												<li style="display: inline;"><a
													href="search.jsp?tag=<%=tag.substring(1)%>"><%=tag%> </a></li>
												<%}}%>
											</ul>
										</div>
										<div class="card-text text-center">
											<a href="detail.jsp?productNo=<%=product.getNo()%>"
												class="btn btn-primary btn-sm">구매</a>
										</div>
										<img class="card-img-top"
											src="../image/<%="ICECREAM".equals(cat) ? "ICECREAM" : "CAKE"%>/<%=product.getImagePath()%>"
											alt="" />
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
							%>
							<!-- product -->
						</div>
						<!-- product list -->
					</div>
				</div>
				<%
					if ("0".equals(session.getAttribute("LOGINED_ADMIN"))) {
				%>
				<div class="row">
					<div class="col-1-sm">
						<a href="productform.jsp?category=<%=cat%>"
							class="btn btn-primary">상품 등록</a>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
	<script type="text/javascript">
        function tagList(productNo, event) {
            var itemDiv = document.querySelector("#product-list-" + productNo)
            var tagDiv = document.querySelector("#product-tag-" + productNo)
            itemDiv.style.display = "none"
            tagDiv.style.display = "block"
            event.preventDefault()
        }

        function dispItem(productNo) {
            var itemDiv = document.querySelector("#product-list-" + productNo)
            var tagDiv = document.querySelector("#product-tag-" + productNo)
            itemDiv.style.display = "block"
            tagDiv.style.display = "none"
        }

    </script>
</body>

</html>
