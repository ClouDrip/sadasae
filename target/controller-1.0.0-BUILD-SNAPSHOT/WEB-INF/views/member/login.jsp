<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/static/css/style.css">
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
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all'>
<link rel='stylesheet'
	href='../resources/static/css/easy-responsive-shortcodes.css'
	type='text/css' media='all'>
<link rel='stylesheet' href='../resources/static/css/member/login.css'
	type='text/css' media='all' />
</head>
<body
	class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
	<div id="page">
		<div class="container">
			<header id="masthead" class="site-header">
				<div class="top_gnb_area">
					<ul class="list">
						<c:if test="${member == null}">
							<li><a href="/member/login">로그인</a></li>
							<li><a href="/member/join">회원가입</a></li>
							<li>고객센터</li>
						</c:if>
						<c:if test="${member != null }">
							<c:if test="${member.adminCk == 1 }">
								<li><a href="/admin/main">관리자 페이지</a></li>
							</c:if>
							<li><a id="gnb_logout_button">로그아웃</a></li>
							<li>마이룸</li>
							<li>장바구니</li>
						</c:if>
					</ul>
				</div>
				<div class="site-branding">
					<h1 class="site-title">
						<a href="index.html" rel="home">사다새</a>
					</h1>
					<h2 class="site-description">많이 담아가면</h2>
				</div>
				<nav id="site-navigation" class="main-navigation">
					<button class="menu-toggle">Menu</button>
					<a class="skip-link screen-reader-text" href="#content">Skip to
						content</a>
					<div class="menu-menu-1-container">
						<ul id="menu-menu-1" class="menu">
							<li><a href="index.html">Home</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="shop.html">Shop</a></li>
							<ul class="sub-menu">
								<li><a href="portfolio-item.html">Portfolio Item</a></li>
								<li><a href="blog-single.html">Blog Article</a></li>
								<li><a href="shop-single.html">Shop Item</a></li>
								<li><a href="portfolio-category.html">Portfolio
										Category</a></li>
							</ul>
							</li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</div>
				</nav>
			</header>
			<div class="wrapper">
				<div class="wrap">
					<form id="login_form" method="post">
						<div class="logo_wrap">
							<span>Book Mall</span>
						</div>
						<div class="login_wrap">
							<div class="id_wrap">
								<div class="id_input_box">
									<input class="id_input" name="memberId">
								</div>
							</div>
							<div class="pw_wrap">
								<div class="pw_input_box">
									<input class="pw_iput" name="memberPw">
								</div>
							</div>

							<c:if test="${result == 0 }">
								<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
							</c:if>

							<div class="login_button_wrap">
								<input type="button" class="login_button" value="로그인">
							</div>
						</div>

					</form>


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
		<a href="#top" class="smoothup" title="Back to top"><span
			class="genericon genericon-collapse"></span></a>
	</div>

	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {

			//alert("로그인 버튼 작동");

			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "/member/login.do");
			$("#login_form").submit();

		});
	</script>
</body>
</html>