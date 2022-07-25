<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../resources/static/css/admin/goodsManage.css">
<link rel='stylesheet'
	href='../resources/static/css/woocommerce-layout.css' type='text/css'
	media='all'>
<link rel='stylesheet'
	href='../resources/static/css/woocommerce-smallscreen.css'
	type='text/css' media='only screen and (max-width: 768px)'>
<link rel='stylesheet' href='../resources/static/css/woocommerce.css'
	type='text/css' media='all'>
<link rel='stylesheet'
	href='../resources/static/css/font-awesome.min.css' type='text/css'
	media='all'>
<link rel='stylesheet' href='../resources/static/css/style.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all'>
<link rel='stylesheet'
	href='../resources/static/css/easy-responsive-shortcodes.css'
	type='text/css' media='all'>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="page">
		<div class="wrapper">
			<div class="wrap">
				<!-- gnv_area -->
				<div class="top_gnb_area">
					<ul class="list">
						<li><a href="/main">메인 페이지</a></li>
						<li><a href="/member/logout.do">로그아웃</a></li>
						<li>고객센터</li>
					</ul>
				</div>
				<!-- top_subject_area -->
				<div class="admin_top_wrap">
					<span>관리자 페이지</span>

				</div>
				<!-- contents-area -->
				<div class="admin_wrap">
					<!-- 네비영역 -->
					<div class="admin_navi_wrap">
						<ul>
							<li><a class="admin_list_01" href="/admin/goodsEnroll">상품
									등록</a></li>
							<li><a class="admin_list_02" href="/admin/goodsManage">상품
									관리</a></li>
							<li><a class="admin_list_03" href="/admin/replyManage">댓글
									필터링</a></li>
						</ul>
					</div>
					<div class="admin_content_wrap">
						<div class="admin_content_subject">
							<span>상품 관리</span>
						</div>
						<div class="goods_table_wrap">
							<!-- 상품 리스트 O -->
							<c:if test="${listcheck != 'empty'}">
								<table class="goods_table">
									<thead>
										<tr>
											<td class="th_column_1">상품 번호</td>
											<td class="th_column_2">상품 이름</td>
											<td class="th_column_3">색상</td>
											<td class="th_column_4">재고</td>
											<td class="th_column_5">등록날짜</td>
										</tr>
									</thead>
									<c:forEach items="${list}" var="list">
										<tr>
											<td><c:out value="${list.productId}"></c:out></td>
											<td><a class="move"
												href='<c:out value="${list.productId}"/>'> <c:out
														value="${list.productName}"></c:out>
											</a></td>
											<td><c:out value="${list.color}"></c:out></td>
											<td><c:out value="${list.productStock}"></c:out></td>
											<td><fmt:formatDate value="${list.regDate}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</table>
							</c:if>
							<!-- 상품 리스트 X -->
							<c:if test="${listCheck == 'empty'}">
								<div class="table_empty">등록된 작가가 없습니다.</div>
							</c:if>
						</div>

						<!-- 검색 영역 -->
						<div class="search_wrap">
							<form id="searchForm" action="/admin/goodsManage" method="get">
								<div class="search_input">
									<input type="text" name="keyword"
										value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
									<input type="hidden" name="pageNum"
										value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
									<input type="hidden" name="amount"
										value='${pageMaker.cri.amount}'> <input type="hidden"
										name="type" value="G">
									<button class='btn search_btn'>검 색</button>
								</div>
							</form>
						</div>

						<!-- 페이지 이름 인터페이스 영역 -->
						<div class="pageMaker_wrap">
							<ul class="pageMaker">

								<!-- 이전 버튼 -->
								<c:if test="${pageMaker.prev }">
									<li class="pageMaker_btn prev"><a
										href="${pageMaker.pageStart -1}">이전</a></li>
								</c:if>

								<!-- 페이지 번호 -->
								<c:forEach begin="${pageMaker.pageStart }"
									end="${pageMaker.pageEnd }" var="num">
									<li
										class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
										<a href="${num}">${num}</a>
									</li>
								</c:forEach>

								<!-- 다음 버튼 -->
								<c:if test="${pageMaker.next}">
									<li class="pageMaker_btn next"><a
										href="${pageMaker.pageEnd + 1 }">다음</a></li>
								</c:if>
							</ul>
						</div>

						<form id="moveForm" action="/admin/goodsManage" method="get">
							<input type="hidden" name="pageNum"
								value="${pageMaker.cri.pageNum}"> <input type="hidden"
								name="amount" value="${pageMaker.cri.amount}"> <input
								type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<footer id="colophon" class="site-footer">
			<div class="container">
				<div class="site-info">
					<h1
						style="font-family: 'Herr Von Muellerhoff'; color: #ccc; font-weight: 300; text-align: center; margin-bottom: 0; margin-top: 0; line-height: 1.4; font-size: 46px;">Moschino</h1>
					<a target="blank" href="https://www.wowthemes.net/">&copy;
						Moschino - Free HTML Template by WowThemes.net</a>
				</div>
			</div>
		</footer>
	</div>

	<script>
		$(document).ready(function() {

			// 등록 성공 이벤트 
			let eResult = '<c:out value="${enroll_result}"/>';

			checkResult(eResult);

			function checkResult(result) {

				if (result === '') {
					return;
				}

				alert("상품'" + eResult + "'을 등록하였습니다.");

			}

			/* 수정 성공 이벤트 */
			let modify_result = '${modify_result}';

			if (modify_result == 1) {
				alert("수정 완료");
			}

			/* 삭제 결과 경고창 */
			let delete_result = '${delete_result}';

			if (delete_result == 1) {
				alert("삭제 완료");
			}

		});

		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');

		/* 작거 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e) {

			e.preventDefault();

			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();

		});

		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();

		});

		/* 상품조회 페이지 */
		$(".move")
				.on(
						"click",
						function(e) {

							e.preventDefault();

							moveForm
									.append("<input type='hidden' name='productId' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "/admin/goodsDetail");
							moveForm.submit();

						});
	</script>



</body>
</html>