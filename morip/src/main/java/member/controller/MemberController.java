package member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	BCryptPasswordEncoder passEncoder;
	@Autowired 
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/member/loginForm", method=RequestMethod.GET)
	public String login(HttpSession session) {
		session.invalidate();
		return "../member/loginForm";
	}
	
	//--------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/member/write")
	public String write(HttpSession session) {
		session.invalidate();
		return "../member/write";
	}
	
	
	@RequestMapping(value = "/member/emailWriteForm")
	public String emailWriteForm(HttpSession session) {
		session.invalidate();
		return "../member/emailWriteForm";
	}
	
	@RequestMapping(value="/member/kakaoWrite", method=RequestMethod.POST)
	@ResponseBody
	public String kakaoWrite(@RequestParam String email, HttpSession session) {
		session.setAttribute("kakaoEmail", email);
		return "../member/writeForm.jsp";
	}
	
	@RequestMapping(value="/member/googleWrite", method=RequestMethod.POST)
	@ResponseBody
	public String googleWrite(@RequestParam String email, HttpSession session) {
		session.setAttribute("googleEmail", email);
		return "../member/writeForm.jsp";
	}
	
	@RequestMapping(value="/member/moripWrite", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView moripWrite(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
		String inputPass = memberDTO.getPwd();
		String pass = passEncoder.encode(inputPass);
		memberDTO.setPwd(pass);
		memberService.moripWrite(memberDTO);
		
		memberDTO = memberService.getMember(memberDTO.getEmail());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("jsonView");
		
		session.invalidate();
		return mav;
	}
	
	@RequestMapping(value = "/member/checkNickname", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView checkNickname(@RequestParam String nickname) {
		MemberDTO memberDTO = memberService.checkNickname(nickname);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping( value = "/member/sendMail" , method=RequestMethod.POST )
    @ResponseBody
    public String sendMail(@RequestParam String email){
		System.out.println(email);
        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 비밀번호
    
        String setfrom = "moriptest@gmail.com";
        String tomail = email; // 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content =
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시고 확인버튼을 눌러주세요."; // 내용
        
        try {
        	MimeMessage message = mailSender.createMimeMessage();
        	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return dice+"";
    }
	
	@RequestMapping(value = "/member/writeForm", method = RequestMethod.POST)
	@ResponseBody
	public String writeForm(@RequestParam String email, String pwd, HttpSession session) {
		session.setAttribute("email", email);
		session.setAttribute("pwd", pwd);
		return "../member/writeForm.jsp";
	}
	
	//--------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/member/snsLogin", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView snsLogin(@RequestParam String email, HttpSession session) {
		String pwd = "null";
		MemberDTO memberDTO = memberService.snsLogin(email, pwd);
		
		if(memberDTO != null) {
			session.setAttribute("memEmail", memberDTO.getEmail());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "/member/emailLogin", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView emailLogin(@RequestParam String email, @RequestParam String pwd, HttpSession session) {
		boolean passMatch = false;
		ModelAndView mav = new ModelAndView();
		
		MemberDTO memberDTO = memberService.getMember(email);
		if(memberDTO != null) {
			passMatch = passEncoder.matches(pwd, memberDTO.getPwd());
		}
		
		if (memberDTO != null && passMatch == true) {
			session.setAttribute("memEmail", memberDTO.getEmail());
			mav.addObject("memberDTO", memberDTO);
		}
		mav.addObject("passMatch", passMatch);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.POST)
	@ResponseBody
	public String logout(@RequestParam String memEmail, HttpSession session){
		session.invalidate();
		return "../main/index";
	}
	
	//--------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/member/idFindForm")
	public String idFindForm() {
		return "../member/idFindForm";
	}
	
	@RequestMapping(value = "/member/pwdFindForm")
	public String pwdFindForm() {
		return "../member/pwdFindForm";
	}
	
	@RequestMapping(value = "/member/checkId")
	public ModelAndView checkId(@RequestParam String email) {
		MemberDTO memberDTO = memberService.getMember(email);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "/member/findId", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView findId(@RequestParam String name, String idCard1, String idCard2) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("idCard1", idCard1);
		map.put("idCard2", idCard2);

		MemberDTO memberDTO = memberService.checkUser(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
    @RequestMapping( value = "/member/pwdFindMail" , method=RequestMethod.POST )
    @ResponseBody
    public String pwdFindMail(@RequestParam String email){
        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
    
        String setfrom = "moriptest@gmail.com";
        String tomail = email; // 받는 사람 이메일
        String title = "몰입홈페이지 비밀번호 찾기 이메일 입니다."; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 비밀번호인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        
        try {
        	MimeMessage message = mailSender.createMimeMessage();
        	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return dice+"";
    }
    
	@RequestMapping(value = "/member/changePwd", method = RequestMethod.POST)
	@ResponseBody
	public String changePwd(@RequestParam String email, String pwd) {
		String pass = passEncoder.encode(pwd);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pwd", pass);
		
		memberService.changePwd(map);
		
		return "../member/loginForm.jsp";
	}
	 
}