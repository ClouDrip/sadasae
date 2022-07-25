package com.sada.service;

import java.util.List;

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

	@Override
	public List<ReplyDTO> getReplyFindAll() {

		return replyMapper.getReplyFindAll();

	}

	@Override
	public void updateFilterOn(int replyFlt, int replyId) {
		replyMapper.updateFilterOn(replyFlt, replyId);
	}

	@Override
	public List<ReplyDTO> findByReviewOneMinute() {
		return replyMapper.findByReviewOneMinute();
	}

	@Override
	public void updateFilterOff() {
		List<ReplyDTO> reviewList = replyMapper.getReplyFindAll();
		for (ReplyDTO replyDTO : reviewList) {
			replyMapper.updateFilterOff(replyDTO.getReplyId());
		}
	}

	@Override
	public int deleteReply(ReplyDTO dto) {

		int result = replyMapper.deleteReply(dto.getReplyId());

		return result;
	}

}
