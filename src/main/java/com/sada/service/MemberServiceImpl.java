package com.sada.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.sada.mapper.MemberMapper;
import com.sada.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService { // MemberServceImpl.java 클래스는 MemberService.java 인터페이스르 상속받도록 설정해줍니다.

	@Autowired
	MemberMapper membermapper;
			
	@Override
	public void memberJoin(MemberVO member) throws Exception {
	
			
		membermapper.memberJoin(member);
		
	}
	
	@Override
	public int idCheck(String memberId) throws Exception {
		System.out.println(memberId);
		
		return membermapper.idCheck(memberId);
	}
	
    /* 로그인 */
    @Override
    public MemberVO memberLogin(MemberVO member) throws Exception {
        
        return membermapper.memberLogin(member);
    }
}