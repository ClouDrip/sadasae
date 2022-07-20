package com.sada.mapper;

import java.util.List;

import com.sada.model.Criteria;
import com.sada.model.ProductVO;
import com.sada.model.SelectDTO;

public interface ProductMapper {

	/* 상품 검색 */
	public List<ProductVO> getGoodsList(Criteria cri);
	
	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);
	
	/* 평줌순 상품 정보 */
	public List<SelectDTO> likeSelect();
	
	/* 상품 id 이름 */
	public ProductVO getProductIdName(int productId);	
	
	/* 상품 정보 */
	public ProductVO getGoodsInfo(int productId);	
	
}
