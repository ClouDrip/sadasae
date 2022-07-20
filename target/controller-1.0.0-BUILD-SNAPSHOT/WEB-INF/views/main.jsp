<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<title>Moschino | Minimalist Free HTML Portfolio by
	WowThemes.net</title>
<link rel='stylesheet'
	href='resources/static/css/woocommerce-layout.css' type='text/css'
	media='all'>
<link rel='stylesheet'
	href='resources/static/css/woocommerce-smallscreen.css' type='text/css'
	media='only screen and (max-width: 768px)'>
<link rel='stylesheet' href='resources/static/css/woocommerce.css'
	type='text/css' media='all'>
<link rel='stylesheet' href='resources/static/css/font-awesome.min.css'
	type='text/css' media='all'>
<link rel='stylesheet' href='resources/static/css/style.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all'>
<link rel='stylesheet'
	href='resources/static/css/easy-responsive-shortcodes.css'
	type='text/css' media='all'>
</head>
<body
	class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
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
								<div>
									<span>회원 : ${member.memberName} 회원님 안녕하세요.</span>
								</div>
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
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</div>
				</nav>
			</header>
			<!-- #masthead -->
			<div id="content" class="site-content">
				<div id="primary" class="content-area column full">
					<main id="main" class="site-main">
						<div class="grid portfoliogrid">

							<article class="hentry">
								<header class="entry-header">
									<div class="entry-thumbnail">
										<c:forEach items="${ls}" var="ls">
											<a href="/goodsDetail/${ls.productId}"
												class="entry-thumbnail-a">
												<div class="image_wrap"
													data-productid="${ls.imageList[0].productId}"
													data-path="${ls.imageList[0].uploadPath}"
													data-uuid="${ls.imageList[0].uuid}"
													data-filename="${ls.imageList[0].fileName}">
													<img>
												</div>
												<div class="ls_category">${ls.cateName}</div>
												<div class="ls_price">${ls.productPrice}</div>
												<div class="ls_productName">${ls.productName}</div>
											</a>
										</c:forEach>
									</div>
								</header>
							</article>
						</div>

						<nav class="pagination">
							<span class="page-numbers current">1</span> <a
								class="page-numbers" href="#">2</a> <a class="next page-numbers"
								href="#">Next »</a>
						</nav>
						<br />

					</main>
					<!-- #main -->
				</div>
				<!-- #primary -->
			</div>
			<!-- #content -->
		</div>
		<!-- .container -->
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
			class="genericon genericon-collapse"></span></a> <a href="#top"
			class="smoothup" title="Back to top"><span
			class="genericon genericon-collapse"></span></a>
	</div>
	<!-- #page -->
	<script src='resources/static/js/jquery.js'></script>
	<script src='resources/static/js/plugins.js'></script>
	<script src='resources/static/js/scripts.js'></script>
	<script src='resources/static/js/masonry.pkgd.min.js'></script>

	<script>
		$(document)
				.ready(
						function() {

							/* 이미지 삽입 */
							$(".image_wrap")
									.each(
											function(i, obj) {

												const bobj = $(obj);

												if (bobj.data("productid")) {
													const uploadPath = bobj
															.data("path");
													const uuid = bobj
															.data("uuid");
													const fileName = bobj
															.data("filename");

													const fileCallPath = encodeURIComponent(uploadPath
															+ "/s_"
															+ uuid
															+ "_" + fileName);

													$(this)
															.find("img")
															.attr(
																	'src',
																	'/display?fileName='
																			+ fileCallPath);
												} else {
													$(this)
															.find("img")
															.attr('src',
																	'../resources/static/img/noimg.png');
												}

											});

						});

		/* gnb_area 로그아웃 버튼 작동 */
		$("#gnb_logout_button").click(function() {
			//alert("버튼 작동");
			$.ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					alert("로그아웃 성공");
					document.location.reload();
				}
			}); // ajax 
		});
	</script>
</body>
</html>