package member.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	public String login(HttpSession session, Model model) {
		session.invalidate();		
		model.addAttribute("display", "/resources/member/loginForm.jsp");
		return "/resources/main/index";
	}
	
	//--------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/member/write")
	public String write(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("display", "/resources/member/write.jsp");
		return "/resources/main/index";
	}	
	
	@RequestMapping(value = "/member/emailWriteForm")
	public String emailWriteForm(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("display", "/resources/member/emailWriteForm.jsp");
		return "/resources/main/index";
	}
	
	@RequestMapping(value="/member/kakaoWrite", method=RequestMethod.POST)
	@ResponseBody
	public String kakaoWrite(@RequestParam String email, HttpSession session, Model model) {
		session.setAttribute("kakaoEmail", email);
		return "/member/writeForm2";
	}
	
	@RequestMapping(value="/member/googleWrite", method=RequestMethod.POST)
	@ResponseBody
	public String googleWrite(@RequestParam String email, HttpSession session, Model model) {
		session.setAttribute("googleEmail", email);
		return "/member/writeForm2";
	}
	
	@RequestMapping(value="/member/moripWrite", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView moripWrite(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
		String inputPass = memberDTO.getPwd();
		String pass = passEncoder.encode(inputPass);
		memberDTO.setPwd(pass);
		if(session.getAttribute("kakaoImage") != null) {
			memberDTO.setImage((String) session.getAttribute("kakaoImage"));
		} else {
			memberDTO.setImage("noimage.png");
		}
		
		memberService.moripWrite(memberDTO);
		
		memberDTO = memberService.getMember(memberDTO.getEmail(), memberDTO.getCheckid());
		
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
		
		return "/member/writeForm2";
	}
	
	@RequestMapping(value = "/member/writeForm2", method = RequestMethod.GET)
	public String writeForm2(Model model) {
		model.addAttribute("display", "/resources/member/writeForm.jsp");
		
		return "/resources/main/index";
	}
	
	//--------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/member/snsLogin", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView snsLogin(@RequestParam String email, String checkid, HttpSession session) {
		boolean passMatch = false;
		MemberDTO memberDTO = memberService.snsLogin(email, checkid);
		
		if(memberDTO != null) {
			session.setAttribute("memEmail", memberDTO.getEmail());
			session.setAttribute("nickname", memberDTO.getNickname());
			session.setAttribute("checkid", memberDTO.getCheckid());
			session.setAttribute("nickname", memberDTO.getNickname());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "/member/emailLogin", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView emailLogin(@RequestParam String email, @RequestParam String pwd, String checkid, HttpSession session) {
		boolean passMatch = false;
		ModelAndView mav = new ModelAndView();
		
		MemberDTO memberDTO = memberService.getMember(email, checkid);
		if(memberDTO != null) {
			passMatch = passEncoder.matches(pwd, memberDTO.getPwd());
		}
		
		if (memberDTO != null && passMatch == true) {
			session.setAttribute("memEmail", memberDTO.getEmail());
			session.setAttribute("nickname", memberDTO.getNickname());
			session.setAttribute("image", memberDTO.getImage());
			session.setAttribute("checkid", memberDTO.getCheckid());
			mav.addObject("memberDTO", memberDTO);
		}
		mav.addObject("passMatch", passMatch);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:/main/index");
	} // logout
	
	@RequestMapping(value="/member/dropMorip", method=RequestMethod.POST)
	@ResponseBody
	public void dropMorip(HttpSession session) {
		String email = (String)session.getAttribute("memEmail");
		String checkid = (String)session.getAttribute("checkid");
		memberService.dropMorip(email, checkid);
		session.invalidate();
	}
	
	//--------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/member/idFindForm")
	public String idFindForm(Model model) {
		model.addAttribute("display", "/resources/member/idFindForm.jsp");
		return "/resources/main/index";
	}
	
	@RequestMapping(value = "/member/pwdFindForm")
	public String pwdFindForm(Model model) {
		model.addAttribute("display", "/resources/member/pwdFindForm.jsp");
		return "/resources/main/index";
	}	
	
	@RequestMapping(value = "/member/checkId")
	public ModelAndView checkId(@RequestParam String email, String checkid, HttpSession session) {
		System.out.println("이메일뭐오냐" + email);	
		MemberDTO memberDTO = memberService.getMember(email, checkid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "/member/findId", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView findId(@RequestParam String name, String idCard1, String idCard2, String checkid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("idCard1", idCard1);
		map.put("idCard2", idCard2);
		map.put("checkid", checkid);

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
	public String changePwd(@RequestParam String email, String pwd, Model model) {
		String pass = passEncoder.encode(pwd);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pwd", pass);
		
		memberService.changePwd(map);
		model.addAttribute("display", "/resources/member/loginForm.jsp");
		return "/resources/main/index";
	}
	
	// 회원정보 수정 창
	@RequestMapping(value = "/member/memberModifyForm", method = RequestMethod.GET)
	public String memberModifyForm(HttpSession session, Model model) {
		//model.addAllAttributes("memEmail", session.getAttribute("memEmail"));
		String email = (String) session.getAttribute("memEmail");
		String checkid = (String) session.getAttribute("checkid");
		MemberDTO memberDTO = memberService.getMember(email, checkid);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("display", "/resources/member/memberModifyForm.jsp");
		return "/resources/main/index";
	}
		
	// 회원정보 수정
	@RequestMapping(value="/member/memberModify", method=RequestMethod.POST)
	@ResponseBody
	public void memberModify(@ModelAttribute MemberDTO memberDTO, 
							 @RequestParam MultipartFile img, HttpSession session) {
		String image =  (String)session.getAttribute("image");
		String checkid = (String) session.getAttribute("checkid");
		
		if(img.getOriginalFilename() == "") {
			memberDTO.setImage(image);
		}else {
			String filePath = "E:\\spring\\gihwan\\morip\\morip\\src\\main\\webapp\\storage\\";
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}		
			memberDTO.setImage(fileName);		
			session.setAttribute("nickname", memberDTO.getNickname());
			session.setAttribute("image", memberDTO.getImage());
		}					
		String inputPass = memberDTO.getPwd();
		String pass = passEncoder.encode(inputPass);
		memberDTO.setPwd(pass);
		memberDTO.setCheckid(checkid);
		memberService.memberModify(memberDTO);
	}	
	
	public void aaaa(HttpSession session) {
		String name = (String) session.getAttribute("nickname");
	}
	
	
	
	
}