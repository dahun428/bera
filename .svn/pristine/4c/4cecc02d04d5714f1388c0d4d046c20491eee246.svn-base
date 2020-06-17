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
				ProductDao productDao = new ProductDao();
				List<Product> icecreams = productDao.getProductsByCategory("ICECREAM");
				List<Product> cakes = productDao.getProductsByCategory("CAKE");
				
			%>
            <%@ include file="/common/navi.jsp"%>
        </div>
        <div class="body">
            <div class="list-banner">
                <img src="../image/list-banner-img-main.jpg" alt="" />
            </div>
            <div class="container">

                <div class="row">
                    <!-- monthly best item -->
                    <div class="col-12">
                        <h4 class="display-4 text-center">FLAVOR OF MONTH</h4>
                        <hr />
                        <img src="../image/flavorofmonth-img.jpg" alt="" />
                    </div>
                    <!-- monthly best item -->
                    <!-- product list ice cream-->
                    <div class="col-12 br-event-container">
                        <h4 class="display-4 text-center">ICE CREAM</h4>
                        <hr />
                        <div class="row custom-content-box">
                            <!-- product ice cream-->
                            <%
							if(icecreams.size() > 2){
							for(int j = 0; j < 3; j ++){
								Product product = icecreams.get(j);
							List<String> tags = product.getTags();
							%>
                            <div class="col-3 list-box">
                                <div class="card" id="product-list-<%=product.getNo() %>" style="height:340px; font-size:8px;">
                                    <div class="card-body">
                                        <h6 class="card-title text-center"><%=product.getName() %></h6>
                                        <hr />
                                        <div class="card-text text-center">
                                            <ul style="list-style:none; text-align: left;">
                                                <%if(tags.size() > 2) {
											for(int i = 0; i < 2; i++){%>
                                                <li style="display:inline;"><a href="search.jsp?tag=<%=tags.get(i).substring(1)%>"><%=tags.get(i) %> </a></li>
                                                <%} %>
                                                <li style="display:inline;"><a href="javascript:;" onclick="tagList(<%=product.getNo()%>)">...</a></li>
                                                <%}else{ 
													for(String tag : tags){%>
                                                <li style="display:inline;"><a href="search.jsp?tag=<%=tag.substring(1)%>"><%=tag %> </a></li>
                                                <%}} %>
                                            </ul>
                                        </div>
                                        <div class="card-text text-center">
                                            <a href="detail.jsp?productNo=<%=product.getNo() %>" class="btn btn-primary btn-sm">구매</a>
                                        </div>
                                        <img class="card-img-top" src="../image/<%="ICECREAM".equals(product.getCategory())?"ICECREAM":"CAKE"%>/<%=product.getImagePath()%>" alt="" />
                                    </div>
                                </div>
                                <%if(tags.size() > 2) {%>
                                <div class="card" id="product-tag-<%=product.getNo() %>" style="height:340px; font-size:8px; display: none;">
                                    <div class="card-body">
                                        <ul>
                                            <%for(String tag : tags) {%>
                                            <li><a href="search.jsp?tag=<%=tag.substring(1)%>"><%=tag%></a></li>
                                            <%} %>
                                        </ul>
                                        <button class="btn btn-secondary btn-sm" onclick="dispItem(<%=product.getNo()%>)">뒤로</button>
                                    </div>
                                </div>
                                <%} %>
                            </div>
                            <%}} %>

                            <!-- product ice cream end-->
                        </div>

                    </div>
                    <!-- product list  ice cream end-->
                    <div class="col-12 br-event-container">
                        <h4 class="display-4 text-center">ICE CREAM CAKE</h4>
                        <hr />
                        <div class="row custom-content-box">
                            <!-- product ice cream-->
                            <%
							if(cakes.size() > 2){
							for(int j = 0; j < 3; j ++){
								Product product = cakes.get(j);
							List<String> tags = product.getTags();
							%>
                            <div class="col-3 list-box">
                                <div class="card" id="product-list-<%=product.getNo() %>" style="height:340px; font-size:8px;">
                                    <div class="card-body">
                                        <h6 class="card-title text-center"><%=product.getName() %></h6>
                                        <hr />
                                        <div class="card-text text-center">
                                            <ul style="list-style:none; text-align: left;">
                                                <%if(tags.size() > 2) {
											for(int i = 0; i < 2; i++){%>
                                                <li style="display:inline;"><a href="search.jsp?tag=<%=tags.get(i).substring(1)%>"><%=tags.get(i) %> </a></li>
                                                <%} %>
                                                <li style="display:inline;"><a href="javascript:;" onclick="tagList(<%=product.getNo()%>,event)">...</a></li>
                                                <%}else{ 
													for(String tag : tags){%>
                                                <li style="display:inline;"><a href="search.jsp?tag=<%=tag.substring(1)%>"><%=tag %> </a></li>
                                                <%}} %>
                                            </ul>
                                        </div>
                                        <div class="card-text text-center">
                                            <a href="detail.jsp?productNo=<%=product.getNo() %>" class="btn btn-primary btn-sm">구매</a>
                                        </div>
                                        <img class="card-img-top" src="../image/<%="ICECREAM".equals(product.getCategory()) ? "ICECREAM":"CAKE"%>/<%=product.getImagePath() %>" alt="" />
                                    </div>
                                </div>
                                <%if(tags.size() > 2) {%>
                                <div class="card" id="product-tag-<%=product.getNo() %>" style="height:340px; font-size:8px;display: none;">
                                    <div class="card-body">
                                        <ul>
                                            <%for(String tag : tags) {%>
                                            <li><a href="search.jsp?tag=<%=tag.substring(1)%>"><%=tag%></a></li>
                                            <%} %>
                                        </ul>
                                        <button class="btn btn-secondary btn-sm" onclick="dispItem(<%=product.getNo()%>)">뒤로</button>
                                    </div>
                                </div>
                                <%} %>
                            </div>
                            <%}} %>

                            <!-- product ice cream end-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <%@ include file="/common/footer.jsp"%>
        </div>
    </div>
    <script type="text/javascript">
        function tagList(productNo,event) {
            var itemDiv = document.querySelector("#product-list-" + productNo)
            var tagDiv = document.querySelector("#product-tag-" + productNo)
            itemDiv.style.display = "none"
            tagDiv.style.display = "block"
            event.preventDefault()
        }

        function dispItem(productNo) {
            var itemDiv = document.querySelector("#product-list-" + productNo)
            var tagDiv = document.querySelector("#product-tag-" + productNo)
            itemDiv.style.display="block"
            tagDiv.style.display="none"
        }

    </script>
</body>

</html>
