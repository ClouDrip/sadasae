package com.sada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sada.mapper.AdminMapper;
import com.sada.mapper.AttachMapper;
import com.sada.mapper.ProductMapper;
import com.sada.model.AttachImageVO;
import com.sada.model.Criteria;
import com.sada.model.ProductVO;
import com.sada.model.SelectDTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private AdminMapper adminMapper;
	
	/* 상품 검색 */
	@Override
	public List<ProductVO> getGoodsList(Criteria cri) {
		
		log.info("getGoodsList().......");	
		
		return productMapper.getGoodsList(cri);
	}

	/* 사품 총 갯수 */
	@Override
	public int goodsGetTotal(Criteria cri) {
		
		log.info("goodsGetTotal().......");
		
		return productMapper.goodsGetTotal(cri);
		
	}
	
	
	/* 상품 정보 */
	@Override
	public ProductVO getGoodsInfo(int productId) {
		
		ProductVO goodsInfo = productMapper.getGoodsInfo(productId);
		goodsInfo.setImageList(adminMapper.getAttachInfo(productId));
		
		
		return goodsInfo;
	}		
	
	
	@Override
	public ProductVO getProductIdName(int productId) {
		
		return productMapper.getProductIdName(productId);
	}

	@Override
	public List<SelectDTO> likeSelect() {
		
		List<SelectDTO> list = productMapper.likeSelect();
		
		list.forEach(dto -> {
			
			int productId = dto.getProductId();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(productId);
			
			dto.setImageList(imageList);
			
		});				
		
		
		return list;
		
	}
}
