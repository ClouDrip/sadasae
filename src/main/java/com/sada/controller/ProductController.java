package com.sada.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sada.mapper.AttachMapper;
import com.sada.model.AttachImageVO;
import com.sada.model.Criteria;
import com.sada.model.PageDTO;
import com.sada.model.ProductVO;
import com.sada.model.ReplyDTO;
import com.sada.service.ProductService;
import com.sada.service.ReplyService;





@Controller
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReplyService replyService;
	
	//메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET(Model model) {
		
		logger.info("메인 페이지 진입");
		
		model.addAttribute("ls", productService.likeSelect());
		
	}
	
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){ //이미지 파일을 주고받기 위한 데이터 타입은 byte 배열(byte [])
		
		
		logger.info("getImage()........" + fileName);
		
		File file = new File("/home/ubuntu/Users/jingoo/upload/" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 이미지 정보 반환 */
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int productId){
		
		logger.info("getAttachList.........." + productId);
		
		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachList(productId), HttpStatus.OK);
		
	}
	
	/* 상품 검색 */
	@GetMapping("search")
	public String searchGoodsGET(Criteria cri, Model model) {
		
		logger.info("cri : " + cri);
		
		List<ProductVO> list = productService.getGoodsList(cri);
		logger.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
			
			return "search";
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, productService.goodsGetTotal(cri)));
		
		
		return "search";
		
	}
	
	/* 상품 상세 */
	@GetMapping("/goodsDetail/{productId}")
	public String goodsDetailGET(@PathVariable("productId")int productId, Model model) {
		
		logger.info("goodsDetailGET()..........");
		
		model.addAttribute("goodsInfo", productService.getGoodsInfo(productId));
		
		model.addAttribute("replys",replyService.getReplyFindAll());
		
		return "/goodsDetail";
	}
	
	/* 리뷰 쓰기 */
	@GetMapping("/replyEnroll/{memberId}")
	public String replyEnrollWindowGET(@PathVariable("memberId")String memberId, int productId, Model model) {
		ProductVO product = productService.getProductIdName(productId);
		model.addAttribute("productInfo", product);
		model.addAttribute("memberId", memberId);
		
		return "/replyEnroll";
	}
	
	/* 리뷰 수정 팝업창 */
	@GetMapping("/replyUpdate")
	public String replyUpdateWindowGET(ReplyDTO dto, Model model) {
		ProductVO product = productService.getProductIdName(dto.getProductId());
		model.addAttribute("productInfo", product);
		model.addAttribute("replyInfo", replyService.getUpdateReply(dto.getReplyId()));
		model.addAttribute("memberId", dto.getMemberId());
		
		return "/replyUpdate";
	}
	
}

