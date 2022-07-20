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
<link rel='stylesheet' href='../resources/static/css/style.css'
	type='text/css' media='all' />
<link rel='stylesheet' href='../resources/static/css/goodsDetail.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='../resources/static/css/woocommerce-layout.css' type='text/css'
	media='all' />
<link rel='stylesheet'
	href='../resources/static/css/woocommerce-smallscreen.css'
	type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet' href='../resources/static/css/woocommerce.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='../resources/static/css/font-awesome.min.css' type='text/css'
	media='all' />
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='../resources/static/css/easy-responsive-shortcodes.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='../resources/static/fonts/fontawesome-webfont.woff2'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='../resources/static/fonts/fontawesome-webfont.woff'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='../resources/static/css/fonts/genericons-regular-webfont.woff'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='../resources/static/css/fonts/genericons-regular-webfont.ttf'
	type='text/css' media='all' />
</head>
<body class="single single-product woocommerce woocommerce-page">
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
							<li><a href="/goodsDetail/main">Shop</a></li>
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
					<div id="container">
						<div id="content" role="main">
							<nav class="woocommerce-breadcrumb" itemprop="breadcrumb">
								<a href="#">Home</a> / <a href="#">Clothing</a> / Beige Jacket
							</nav>
							<div itemscope itemtype="http://schema.org/Product"
								class="product">
								<div class="images">
									<div class="ct_left_area">
										<div class="image_wrap"
											data-productid="${goodsInfo.imageList[0].productId}"
											data-path="${goodsInfo.imageList[0].uploadPath}"
											data-uuid="${goodsInfo.imageList[0].uuid}"
											data-filename="${goodsInfo.imageList[0].fileName}">
											<img>
										</div>
									</div>
								</div>
								<div class="summary entry-summary">
									<h1 itemprop="name" class="product_title entry-title"></h1>
									<div class="woocommerce-product-rating"
										itemprop="aggregateRating" itemscope
										itemtype="http://schema.org/AggregateRating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <a href="#reviews"
											class="woocommerce-review-link" rel="nofollow">(<span
											itemprop="reviewCount" class="count">2</span> customer
											reviews)
										</a>
									</div>
									<div class="title_information">
										<div class="product_name">${goodsInfo.productName}</div>
										<div class="product_price">KRW ${goodsInfo.productPrice}</div>
									</div>

									<form class="cart" method="post" enctype='multipart/form-data'>
										<div class="quantity">
											<input type="number" step="1" min="1" max="" name="quantity"
												value="1" title="Qty" class="input-text qty text" size="4" />
										</div>
										<button type="submit"
											class="single_add_to_cart_button button alt">Add to
											cart</button>
									</form>
									<div class="product_meta">
										<span class="posted_in">Categories: <a href="#"
											rel="tag">Clothing</a>, <a href="#" rel="tag">Hoodies</a>
										</span>
									</div>
								</div>
								<!-- .summary -->
								<div class="woocommerce-tabs wc-tabs-wrapper">
									<div class="panel entry-content wc-tab" id="tab-description">
										<h1>Product Intro</h1>
										<p class="product_intro" ${goodsInfo.productIntro}></p>
									</div>
									<div class="panel entry-content wc-tab" id="tab-reviews">
										<div id="reviews">
											<div id="comments">
												<h2>2 Reviews for Beige Jacket</h2>
												<ol class="commentlist">
													<li itemprop="review" itemscope
														itemtype="http://schema.org/Review" class="comment">
														<div id="comment-3" class="comment_container">
															<div class="comment-text">
																<p class="meta">
																	<strong itemprop="author">Steve</strong> &ndash;
																	<time itemprop="datePublished"
																		datetime="2013-06-07T15:54:25+00:00">June 7,
																		2013</time>
																	:
																</p>
																<div itemprop="description" class="description">
																	<p>I like the logo but not the color.</p>
																</div>
															</div>
														</div>
													</li>
													<!-- #comment-## -->
													<li itemprop="review" itemscope
														itemtype="http://schema.org/Review" class="comment">
														<div id="comment-4" class="comment_container">
															<div class="comment-text">
																<p class="meta">
																	<strong itemprop="author">Maria</strong> &ndash;
																	<time itemprop="datePublished"
																		datetime="2013-06-07T15:54:25+00:00">June 7,
																		2013</time>
																	:
																</p>
																<div itemprop="description" class="description">
																	<p>Three letters, one word: WOO!</p>
																</div>
															</div>
														</div>
													</li>
													<!-- #comment-## -->
												</ol>
											</div>

											<div class="reply_not_div"></div>
											<ul class="reply_content_ul">
												<!-- 					<li>
															<div class="comment_wrap">
																<div class="reply_top">
																	<span class="id_span">sjinjin7</span> <span
																		class="date_span">2021-10-11</span> <span
																		class="rating_span">평점 : <span
																		class="rating_value_span">4</span>점
																	</span> <a class="update_reply_btn">수정</a><a
																		class="delete_reply_btn">삭제</a>
																</div>
																<div class="reply_bottom">
																	<div class="reply_bottom_txt">사실 기대를 많이하고 읽기시작했는데
																		읽으면서 가가 쓴것이 맞는지 의심들게합니다 문체도그렇고 간결하지 않네요 제가 기대가 크던
																		작았던간에 책장이 사실 안넘겨집니다.</div>
																</div>
															</div>
														</li> -->
											</ul>
											<div class="repy_pageInfo_div">
												<ul class="pageMaker">
													<!-- 														<li class="pageMaker_btn prev"><a>이전</a></li>
														<li class="pageMaker_btn"><a>1</a></li>
														<li class="pageMaker_btn"><a>2</a></li>
														<li class="pageMaker_btn active"><a>3</a></li>
														<li class="pageMaker_btn next"><a>다음</a></li> -->
												</ul>

											</div>
											<c:if test="${member != null}">
												<div class="reply_button_wrap">
													<button>리뷰 쓰기</button>
												</div>
											</c:if>



										</div>
										<!-- #respond -->
									</div>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- #main -->
	</div>
	<!-- #primary -->

	<!-- #content -->
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
		class="genericon genericon-collapse"></span></a>
	</div>
	<!-- #page -->
	<script src='../resources/static/js/jquery.js'></script>
	<script src='../resources/static/js/plugins.js'></script>
	<script src='../resources/static/js/scripts.js'></script>
	<script src='../resources/static/js/masonry.pkgd.min.js'></script>

	<script>
		$(document).ready(
				function() {

					/* 이미지 삽입 */
					const bobj = $(".image_wrap");

					if (bobj.data("productid")) {
						const uploadPath = bobj.data("path");
						const uuid = bobj.data("uuid");
						const fileName = bobj.data("filename");

						const fileCallPath = encodeURIComponent(uploadPath
								+ "/s_" + uuid + "_" + fileName);

						bobj.find("img").attr('src',
								'/display?fileName=' + fileCallPath);
					} else {
						bobj.find("img").attr('src',
								'../resources/static/img/noimg.png');
					}
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

		/* 리뷰쓰기 */
		$(".reply_button_wrap")
				.on(
						"click",
						function(e) {

							e.preventDefault();

							const memberId = '${member.memberId}';
							const productId = '${goodsInfo.productId}';

							$
									.ajax({
										data : {
											productId : productId,
											memberId : memberId
										},
										url : '/reply/check',
										type : 'POST',
										success : function(result) {

											if (result === '1') {
												alert("이미 등록된 리뷰가 존재 합니다.")
											} else if (result === '0') {
												let popUrl = "/replyEnroll/"
														+ memberId
														+ "?productId="
														+ productId;
												console.log(popUrl);
												let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";

												window.open(popUrl, "리뷰 쓰기",
														popOption);
											}

										}
									});

						});

		/* 댓글 페이지 정보 */
		const cri = {
			productId : '${goodsInfo.productId}',
			pageNum : 1,
			amount : 10
		}

		/* 댓글 페이지 이동 버튼 동작 */
		$(document).on('click', '.pageMaker_btn a', function(e) {

			e.preventDefault();

			let page = $(this).attr("href");
			cri.pageNum = page;

			replyListInit();

		});

		/* 댓글 데이터 서버 요청 및 댓글 동적 생성 메서드 */
		let replyListInit = function() {
			$.getJSON("/reply/list", cri, function(obj) {

				makeReplyContent(obj);

			});
		}
		
		/* 리뷰 수정 버튼 */
		 $(document).on('click', '.update_reply_btn', function(e){
				
				e.preventDefault();
				let replyId = $(this).attr("href");		 
				let popUrl = "/replyUpdate?replyId=" + replyId + "&productId=" + '${goodsInfo.productId}' + "&memberId=" + '${member.memberId}';	
				let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"	
				
				window.open(popUrl,"리뷰 수정",popOption);			
			 
		 });
		

		/* 댓글(리뷰) 동적 생성 메서드 */
		function makeReplyContent(obj) {
			if (obj.list.length === 0) {
				$(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
				$(".reply_content_ul").html('');
				$(".pageMaker").html('');
			} else {

				$(".reply_not_div").html('');

				const list = obj.list;
				const pf = obj.pageInfo;
				const userId = '${member.memberId}';

				/* list */

				let reply_list = '';

				$(list)
						.each(
								function(i, obj) {

									reply_list += '<li>';
									reply_list += '<div class="comment_wrap">';
									reply_list += '<div class="reply_top">';
									/* 아이디 */
									reply_list += '<span class="id_span">'
											+ obj.memberId + '</span>';
									/* 날짜 */
									reply_list += '<span class="date_span">'
											+ obj.regDate + '</span>';
									/* 평점 */
									reply_list += '<span class="rating_span">평점 : <span class="rating_value_span">'
											+ obj.rating + '</span>점</span>';
									if (obj.memberId === userId) {
										reply_list += '<a class="update_reply_btn" href="'+ obj.replyId +'">수정</a><a class="delete_reply_btn" href="'+ obj.replyId +'">삭제</a>';
									}
									reply_list += '</div>'; //<div class="reply_top">
									reply_list += '<div class="reply_bottom">';
									reply_list += '<div class="reply_bottom_txt">'
											+ obj.content + '</div>';
									reply_list += '</div>';//<div class="reply_bottom">
									reply_list += '</div>';//<div class="comment_wrap">
									reply_list += '</li>';

								});

				$(".reply_content_ul").html(reply_list);

				/* 페이지 버튼 */

				let reply_pageMaker = '';

				/* prev */
				if (pf.prev) {
					let prev_num = pf.pageStart - 1;
					reply_pageMaker += '<li class="pageMaker_btn prev">';
					reply_pageMaker += '<a href="'+ prev_num +'">이전</a>';
					reply_pageMaker += '</li>';
				}
				/* numbre btn */
				for (let i = pf.pageStart; i < pf.pageEnd + 1; i++) {
					reply_pageMaker += '<li class="pageMaker_btn ';
					if (pf.cri.pageNum === i) {
						reply_pageMaker += 'active';
					}
					reply_pageMaker += '">';
					reply_pageMaker += '<a href="'+i+'">' + i + '</a>';
					reply_pageMaker += '</li>';
				}
				/* next */
				if (pf.next) {
					let next_num = pf.pageEnd + 1;
					reply_pageMaker += '<li class="pageMaker_btn next">';
					reply_pageMaker += '<a href="'+ next_num +'">다음</a>';
					reply_pageMaker += '</li>';
				}

				$(".pageMaker").html(reply_pageMaker);
			}

		}
	</script>
</body>
</html>