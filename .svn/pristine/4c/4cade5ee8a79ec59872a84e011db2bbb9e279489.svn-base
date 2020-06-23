<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 추천 기능 -->
		<div>
			<div class="w3-border w3-center w3-padding">
				<c:if test="${ id == null }">
					추천 기능은 <button type="button" id="newLogin"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.<br />
					<i class="fa fa-heart" style="font-size:16px;color:red"></i>
					<span class="rec_count"></span>					
				</c:if>
				<c:if test="${ id != null }">
					<button class="w3-button w3-black w3-round" id="rec_update">
						<i class="fa fa-heart" style="font-size:16px;color:red"></i>
						&nbsp;<span class="rec_count"></span>
					</button> 
				</c:if>
			</div>
		</div>
		
		
$(function(){
		// 추천버튼 클릭시(추천 추가 또는 추천 제거)
		$("#rec_update").click(function(){
			$.ajax({
				url: "/expro/RecUpdate.do",
                type: "POST",
                data: {
                    no: ${content.board_no},
                    id: '${id}'
                },
                success: function () {
			        recCount();
                },
			})
		})
		
		// 게시글 추천수
	    function recCount() {
			$.ajax({
				url: "/expro/RecCount.do",
                type: "POST",
                data: {
                    no: ${content.board_no}
                },
                success: function (count) {
                	$(".rec_count").html(count);
                },
			})
	    };
	    recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
[출처] [JSP/JAVA] 홈페이지 만들기 7 - 좋아요(추천) 기능  구현 방법|작성자 JOKER