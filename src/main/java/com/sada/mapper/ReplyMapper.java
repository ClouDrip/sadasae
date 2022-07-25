package com.sada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sada.model.Criteria;
import com.sada.model.ReplyDTO;

public interface ReplyMapper {

	/* 댓글 등록 */
	public int enrollReply(ReplyDTO dto);

	/* 댓글 페이징 */
	public List<ReplyDTO> getReplyList(Criteria cri);

	/* 댓글 총 갯수(페이징) */
	public int getReplyTotal(int productId);

	/* 댓글 수정 */
	public int updateReply(ReplyDTO dto);

	/* 댓글 한개 정보(수정페이지) */
	public ReplyDTO getUpdateReply(int replyId);

	/* 댓글 삭제 */
	public int deleteReply(int replyId);

	public List<ReplyDTO> getReplyFindAll();

	public void updateFilterOn(@Param("replyFlt")int replyFlt,@Param("replyId") int replyId);

	public List<ReplyDTO> findByReviewOneMinute();

	public void updateFilterOff(int replyId);

}
