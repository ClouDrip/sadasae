package com.sada.service;

import java.util.List;

import com.sada.model.Criteria;
import com.sada.model.ProductVO;
import com.sada.model.SelectDTO;

public interface ProductService {

	/* 상품 검색 */
	public List<ProductVO> getGoodsList(Criteria cri);
	
	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);
	
	/* 상품 정보 */
	public ProductVO getGoodsInfo(int productId);	
	
	/* 상품 id 이름 */
	public ProductVO getProductIdName(int productId);
	
	/* 평줌순 상품 정보 */
	public List<SelectDTO> likeSelect();
}