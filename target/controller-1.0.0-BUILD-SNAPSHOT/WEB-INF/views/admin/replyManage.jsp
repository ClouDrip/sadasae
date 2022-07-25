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
							<li><a class="admin_list_03" href="/admin/goodsManage">댓글
									필터링</a></li>
						</ul>
					</div>
					<div class="admin_content_wrap">
						<form action="replyFilter" method="POST">
							<input type="hidden" name="on_off" value="on" />
							<div class="mypage-comment-filter" id="mypage_comment_filter">
								<button class="mypage-span" type="submit">악플 댓글 필터링 ON</button>
							</div>
						</form>
						<div class="home-tab"></div>
						<form action="replyFilter" method="POST">
							<input type="hidden" name="on_off" value="off" />
							<div class="mypage-comment-filter" id="mypage_comment_filter">
								<button class="mypage-span" type="submit">악플 댓글 필터링 OFF</button>
							</div>
						</form>
						<div class="home-tab"></div>
						<form action="replyFilter" method="POST">
							<input type="hidden" name="on_off" value="scheduleOn" />
							<div class="mypage-comment-filter" id="mypage_comment_filter">
								<button class="mypage-span" type="submit">신규 악플 댓글 1분
									간격 필터링</button>
							</div>
						</form>
						<div class="home-tab"></div>
						<form action="replyFilter" method="POST">
							<input type="hidden" name="on_off" value="scheduleOff" />
							<div class="mypage-comment-filter" id="mypage_comment_filter">
								<button class="mypage-span" type="submit">신규 악플 댓글 1분
									간격 필터링 취소</button>
							</div>
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