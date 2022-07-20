package com.sada.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sada.model.MemberVO;
import com.sada.service.MemberService;


@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	private MemberService memberservice; // 회원가입 메서드를 추가하기 앞서 @Autowired를 통해서 MemberService.java가 MemberController.java에
											// 자동 주입되도록 코드를 추가해줍니다.

	@Autowired
	private JavaMailSender mailSender;
	
    @Autowired
    private BCryptPasswordEncoder pwEncoder;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 회원가입 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void loginGET() {

		logger.info("회원가입 페이지 진입");

	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void joinGET() {

		logger.info("로그인 페이지 진입");

	}

	// 회원가입 - 회원가입 메서드를 추가해줍니다.
	// - 반환형식을 String으로 하여 return에 main페이지로 이동하도록 작성하였습니다.
//	@RequestMapping(value = "/join", method = RequestMethod.POST)
//	public String joinPOST(MemberVO member) throws Exception {
//
//		logger.info("join 진입");
//
//		// 회원가입 서비스 실행
//		memberservice.memberJoin(member);
//
//		logger.info("join Service 성공");
//
//		return "redirect:/main";
//
//	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {


        String rawPw = "";            // 인코딩 전 비밀번호
        String encodePw = "";        // 인코딩 후 비밀번호
        
        rawPw = member.getMemberPw();            // 비밀번호 데이터 얻음
        encodePw = pwEncoder.encode(rawPw);        // 비밀번호 인코딩
        member.setMemberPw(encodePw);            // 인코딩된 비밀번호 member객체에 다시 저장
        System.out.println(member.toString());
        /* 회원가입 쿼리 실행 */
        memberservice.memberJoin(member);

		return "redirect:/main";

	}

	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {

		int result = memberservice.idCheck(memberId); // 결과를 int형 변수 result에 저장합니다. (존재한다면 '1', 존재하지 않는다면 '0'을 반환하게 됩니다.

		logger.info("결과값 = " + result); // - result의 결과가 0이 아니면 "fail"을 반환하고, result의 결과가 1이 아니면 "success"을 반환합니다

		if (result != 0) {

			return "fail"; // 중복 아이디가 존재

		} else {

			return "success"; // 중복 아이디 x

		}
	} // memberIdChkPOST() 종료

	/* 이메일 인증 */
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증번호 : " + email);
		

		 
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호 " + checkNum);
        

        
        /* 이메일 보내기 */
        String setFrom = "dlwlsrn13@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        

        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
	}
	
    /* 로그인 */
    @RequestMapping(value="login.do", method=RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
        
    	
        HttpSession session = request.getSession();
        String rawPw = "";
        String encodePw = "";
    
        MemberVO lvo = memberservice.memberLogin(member);    // 제출한아이디와 일치하는 아이디 있는지 
        
        if(lvo != null) {            // 일치하는 아이디 존재시
            
            rawPw = member.getMemberPw();        // 사용자가 제출한 비밀번호
            encodePw = lvo.getMemberPw();        // 데이터베이스에 저장한 인코딩된 비밀번호
            
            if(true == pwEncoder.matches(rawPw, encodePw)) {        // 비밀번호 일치여부 판단
                
                lvo.setMemberPw("");                    // 인코딩된 비밀번호 정보 지움
                session.setAttribute("member", lvo);     // session에 사용자의 정보 저장
                return "redirect:/main";        // 메인페이지 이동
                
                
            } else {
 
                rttr.addFlashAttribute("result", 0);            
                return "redirect:/member/login";    // 로그인 페이지로 이동
                
            }
            
        } else {                    // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
            
            rttr.addFlashAttribute("result", 0);            
            return "redirect:/member/login";    // 로그인 페이지로 이동
            
        }


    }
    /* 메인페이지 로그아웃 */
    //메서드 방식은 GET방식 입니다. a태그의 요청은 GET방식이기 때문입니다.
    //url은 logout.do 입니다. 앞서 a태그 속성에서 작성한 url경로입니다. 
    //session에 대한 작업을 해야하기 때문에 HttpServletRequest 타입의 매개변수를 작성하였습니다.
    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
        logger.info("logoutMainGET메서드 진입");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/main";  
        
        // 우리는 사용자의 정보를 "member"라고 네이밍 한 sessino을 삭제해야 합니다. 
        //HttpSession api 문서를 보면 우리 목적에 맞는 session을 제거할 수 있는 메서드가 
        //2개("invalidate()", "removeAttribute()") 있습니다. "invalidate()" 메서드의 경우 
        //세션 전체를 무효화하는 메서드입니다. "removeAttribute()"의 경우 특정 이름으로 
        //네이밍 한 session 객체를 타기팅하여 삭제하는 메서드입니다.
    }
    
    /* 비동기방식 로그아웃 메서드 */
    @RequestMapping(value="logout.do", method=RequestMethod.POST)
    @ResponseBody
    public void logoutPOST(HttpServletRequest request) throws Exception{
        
        logger.info("비동기 로그아웃 메서드 진입");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
    }
}

