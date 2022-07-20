package com.sada.service;

import java.util.List;

import com.sada.model.AttachImageVO;
import com.sada.model.CateVO;
import com.sada.model.Criteria;
import com.sada.model.ProductVO;

public interface AdminService {

	/* 상품 등록 */
	public void productEnroll(ProductVO product);
	
	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	
	/* 상품 리스트 */
	public List<ProductVO> goodsGetList(Criteria cri);
	
	/* 상품 총 개수 */
	public int goodsGetTotal(Criteria cri);	
	
	/* 상품 조회 페이지 */
	public ProductVO goodsGetDetail(int productId);
	
	/* 상품 수정 */
	public int goodsModify(ProductVO vo);
	
	/* 상품 정보 삭제 */
	public int goodsDelete(int productId);
	
	/* 지정 상품 이미지 정보 얻기 */
	public List<AttachImageVO> getAttachInfo(int productId);
}
