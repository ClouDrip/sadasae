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
	href="../resources/static/css/admin/goodsDetail.css">
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
<script
	src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>

<style type="text/css">
#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}
</style>
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
							<span>상품 상세</span>
						</div>

						<div class="admin_content_main">

							<div class="form_section">
								<div class="form_section_title">
									<label>상품 이름 </label>
								</div>
								<div class="form_section_content">
									<input name="productName"
										value="<c:out value="${goodsInfo.productName}"/>" disabled>
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>등록 날짜</label>
								</div>
								<div class="form_section_content">
									<input
										value="<fmt:formatDate value='${goodsInfo.regDate}' pattern='yyyy-MM-dd'/>"
										disabled>
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>최근 수정 날짜</label>
								</div>
								<div class="form_section_content">
									<input
										value="<fmt:formatDate value='${goodsInfo.updateDate}' pattern='yyyy-MM-dd'/>"
										disabled>
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>색상</label>
								</div>
								<div class="form_section_content">
									<input name="color" value="<c:out value="${goodsInfo.color}"/>"
										disabled>

								</div>
							</div>

							<div class="form_section">
								<div class="form_section_title">
									<label>상 카테고리</label>
								</div>
								<div class="form_section_content">
									<div class="cate_wrap">
										<span>대분류</span> <select class="cate1" disabled>
											<option value="none">선택</option>
										</select>
									</div>
									<div class="cate_wrap">
										<span>중분류</span> <select class="cate2" disabled>
											<option value="none">선택</option>
										</select>
									</div>
 									<div class="cate_wrap">
										<span>소분류</span> <select class="cate3" name="cateCode"
											disabled>
											<option value="none">선택</option>
										</select>
									</div>  
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>상품 가격</label>
								</div>
								<div class="form_section_content">
									<input name="productPrice"
										value="<c:out value="${goodsInfo.productPrice}"/>" disabled>
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>상품 재고</label>
								</div>
								<div class="form_section_content">
									<input name="productStock"
										value="<c:out value="${goodsInfo.productStock}"/>" disabled>
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>상품 할인율</label>
								</div>
								<div class="form_section_content">
									<input id="discount_interface" maxlength="2" disabled>
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>상품 소개</label>
								</div>
								<div class="form_section_content bit">
									<textarea name="productIntro" id="productIntro_textarea"
										disabled>${goodsInfo.productIntro}</textarea>
								</div>
							</div>


							<div class="form_section">
								<div class="form_section_title">
									<label>상품 이미지</label>
								</div>
								<div class="form_section_content">

									<div id="uploadReslut"></div>
								</div>
							</div>

							<div class="btn_section">
								<button id="cancelBtn" class="btn">상품 목록</button>
								<button id="modifyBtn" class="btn enroll_btn">수정</button>
							</div>
						</div>


						<form id="moveForm" action="/admin/goodsManage" method="get">
							<input type="hidden" name="pageNum" value="${cri.pageNum}">
							<input type="hidden" name="amount" value="${cri.amount}">
							<input type="hidden" name="keyword" value="${cri.keyword}">
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
		$(document)
				.ready(
						function() {

							/* 할인율 값 삽입 */
							let productDiscount = '<c:out value="${goodsInfo.productDiscount}"/>' * 100;
							$("#discount_interface").attr("value",
									productDiscount);

						
		
		/* 책 소개 */
		ClassicEditor
			.create(document.querySelector('#productIntro_textarea'))
			.then(editor => {
				console.log(editor);
				editor.isReadOnly = true;
			})
			.catch(error=>{
				console.error(error);
			});
				
				/* 카테고리 */
				let cateList = JSON.parse('${cateList}');

				let cate1Array = new Array();
				let cate2Array = new Array();
				let cate3Array = new Array();
				let cate1Obj = new Object();
				let cate2Obj = new Object();
				let cate3Obj = new Object();
				
				let cateSelect1 = $(".cate1");		
				let cateSelect2 = $(".cate2");
				let cateSelect3 = $(".cate3");
v
				
				/* 카테고리 배열 초기화 메서드 */
				function makeCateArray(obj,array,cateList, tier){
					for(let i = 0; i < cateList.length; i++){
						if(cateList[i].tier === tier){
							obj = new Object();
							
							obj.cateName = cateList[i].cateName;
							obj.cateCode = cateList[i].cateCode;
							obj.cateParent = cateList[i].cateParent;
							
							array.push(obj);				
							
						}
					}
				}	
				
				/* 배열 초기화 */
				makeCateArray(cate1Obj,cate1Array,cateList,1);
				makeCateArray(cate2Obj,cate2Array,cateList,2);
				makeCateArray(cate3Obj,cate3Array,cateList,3);
				
				let targetCate2 = '';	
				let targetCate3 = '${goodsInfo.cateCode}';	
				
				
		        /* 소분류 카테고리 */
				for(let i = 0; i < cate3Array.length; i++){
					if(targetCate3 === cate3Array[i].cateCode){
						targetCate3 = cate3Array[i];
					}
				}// for	
				
				/*  cate3Array 에 담긴 소분류 데이터를 모두 비교하여 targetCate3의 cateParent와 동일한 
				값을 가지는 데이터들 소분류 <select> 항목에 추가하는 코드를  작성합니다. */
				for(let i = 0; i < cate3Array.length; i++){
					if(targetCate3.cateParent === cate3Array[i].cateParent){
						cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");
					}
				}
				
				/* DB에 저장된 값에 해당하는 카테고리 <option> 태그에 selected 속성이 추가되도록 코드를 작성합니다.*/
				$(".cate3 option").each(function(i,obj){
					if(targetCate3.cateCode === obj.value){
						$(obj).attr("selected", "selected");
					}
				});    
				
				//중분류 카테고리//
				
				/* 소분류와 마찬가지로 targetCate2 변수에 선택되어야 할 항목 객체로 초기화 합니다. 
				( cate2Array 요소의 cateCode 중 targetCate3의 cateParent 값과 동일한 cate2Array 
				요소를 찾는 작업입니다. 쉽게 말해 선택되어져야할 중분류를 찾는 작업입니다.)*/
				for(let i = 0; i < cate2Array.length; i++){
					if(targetCate3.cateParent === cate2Array[i].cateCode){
						targetCate2 = cate2Array[i];	
					}
				}// for	
				
				/* 아래의 코드를 통해 중분류의 <select> 태그에 <option> 데이터들을 추가해준 후 
				선택되어야 할 <option> 태그에 selected 속성을 부여합니다.*/
				for(let i = 0; i < cate2Array.length; i++){
					if(targetCate2.cateParent === cate2Array[i].cateParent){
						cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");
					}
				}		
				
				$(".cate2 option").each(function(i,obj){
					if(targetCate2.cateCode === obj.value){
						$(obj).attr("selected", "selected");
					}
				});
				
				
				/*대분류 카테고리*/
				/*변수를 선언하여 진행하지 않았습니다. 왜냐하면 대분류에 있는 모든 항목들을 <option> 태그로 추가해주면 되고, 
				선택(selected)되어야 할 값은 targetCate2.cateParent 을 사용하면 되기 때문입니다.*/
				for(let i = 0; i < cate1Array.length; i++){
					cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
				}
				
				
				/* targetCate2.cateParent 값을 활용하여 대분류 중 선택되어야 할 <option>태그에 'selected' 속성을 추가해줍니다.*/
				$(".cate1 option").each(function(i,obj){
					if(targetCate2.cateParent === obj.value){
						$(obj).attr("selected", "selected");
					}
				});	
				
				
				/* 이미지 정보 호출 */
				let productId = '<c:out value="${goodsInfo.productId}"/>';
				let uploadReslut = $("#uploadReslut");			
				
				$.getJSON("/getAttachList", {productId : productId}, function(arr){	
						
					
					if(arr.length === 0){
						let str = "";
						str += "<div id='result_card'>";
						str += "<img src='../resources/static/img/noimg.png'>";
						str += "</div>";
						
						uploadReslut.html(str);	
						
						return;
					}	
					
					let str = "";
					let obj = arr[0];
					
					let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					str += "<div id='result_card'";
					str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
					str += ">";
					str += "<img src='/display?fileName=" + fileCallPath +"'>";
					str += "</div>";		
					
					uploadReslut.html(str);						
					
				});
				
			});

				/* 목록 이동 버튼 */
				$("#cancelBtn").on("click", function(e){
					e.preventDefault();
					$("#moveForm").submit();	
				});	
				
				/* 수정 페이지 이동 */
				$("#modifyBtn").on("click", function(e){
					e.preventDefault();
					let addInput = '<input type="hidden" name="productId" value="${goodsInfo.productId}">';
					$("#moveForm").append(addInput);
					$("#moveForm").attr("action", "/admin/goodsModify");
					$("#moveForm").submit();
				});
			
		
	</script>

</body>
</html>