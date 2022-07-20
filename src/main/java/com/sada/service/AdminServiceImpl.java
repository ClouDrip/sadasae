package com.sada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sada.mapper.AdminMapper;
import com.sada.model.AttachImageVO;
import com.sada.model.CateVO;
import com.sada.model.Criteria;
import com.sada.model.ProductVO;

import lombok.extern.log4j.Log4j;



@Service
@Log4j
public class AdminServiceImpl implements AdminService {

	
	@Autowired
	private AdminMapper adminMapper;	
	
	/* 상품 등록 */
	@Transactional
	@Override
	public void productEnroll(ProductVO product) {
		
		log.info("(srevice)productEnroll........");
		
		adminMapper.productEnroll(product);
		
		if(product.getImageList() == null || product.getImageList().size() <= 0) {
			return;
		}

		
        //람다식 활용한 for문
		product.getImageList().forEach(attach ->{
			
			attach.setProductId(product.getProductId());
			adminMapper.imageEnroll(attach);
			
		});
	}
	
	/* 카테고리 리스트 */
	@Override
	public List<CateVO> cateList() {
		
		log.info("(service)cateList........");
		
		return adminMapper.cateList();
	}
	
	/* 상품 리스트 */
	@Override
	public List<ProductVO> goodsGetList(Criteria cri) {
		log.info("goodsGetTotalList()..........");
		return adminMapper.goodsGetList(cri);
	}

	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri) {
		log.info("goodsGetTotal().........");
		return adminMapper.goodsGetTotal(cri);
	}
	
	/* 상품 조회 페이지 */
	@Override
	public ProductVO goodsGetDetail(int productId) {
		
		log.info("(service)productGetDetail......." + productId);
		
		return adminMapper.goodsGetDetail(productId);
	}
	
	/* 상품 정보 수정 */
	@Transactional
	@Override
	public int goodsModify(ProductVO vo) {
		
		int result = adminMapper.goodsModify(vo);
		
		if(result == 1 && vo.getImageList() != null && vo.getImageList().size() > 0) {
			
			adminMapper.deleteImageAll(vo.getProductId());
			
			vo.getImageList().forEach(attach -> {
				
				attach.setProductId(vo.getProductId());
				adminMapper.imageEnroll(attach);
				
			});
			
		}
		
		return result;
		
	}
	
	/* 상품 정보 삭제 */
	@Override
	@Transactional
	public int goodsDelete(int productId) {

		log.info("goodsDelete..........");
		
		adminMapper.deleteImageAll(productId);
		
		return adminMapper.goodsDelete(productId);
	}
	
	/* 지정 상품 이미지 정보 얻기 */
	@Override
	public List<AttachImageVO> getAttachInfo(int productId) {
		
		log.info("getAttachInfo........");
		
		return adminMapper.getAttachInfo(productId);
	}
}
