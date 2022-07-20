package com.sada.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sada.mapper.ReplyMapper;
import com.sada.model.Criteria;
import com.sada.model.PageDTO;
import com.sada.model.ReplyDTO;
import com.sada.model.ReplyPageDTO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;
	
	/* 댓글등록 */
	@Override
	public int enrollReply(ReplyDTO dto) {
		
		int result = replyMapper.enrollReply(dto);
		
		return result;
	}

	@Override
	public String checkReply(ReplyDTO dto) {
		
		Integer result = replyMapper.checkReply(dto);
		
		if(result == null) {
			return "0";
		} else {
			return "1";
		}
	}
	
	@Override
	public ReplyPageDTO replyList(Criteria cri) {
		ReplyPageDTO dto = new ReplyPageDTO();
		
		dto.setList(replyMapper.getReplyList(cri));
		dto.setPageInfo(new PageDTO(cri, replyMapper.getReplyTotal(cri.getProductId())));
		
		return dto;
	}
	
	@Override
	public int updateReply(ReplyDTO dto) {
		
		int result = replyMapper.updateReply(dto); 
		
		return result;
	}
	
	@Override
	public ReplyDTO getUpdateReply(int replyId) {
		
		return replyMapper.getUpdateReply(replyId);
	}
	
	
}
