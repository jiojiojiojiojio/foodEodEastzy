package kr.co.eodeatzy.mypageU;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.sun.tools.sjavac.Log;

import kr.co.eodeatzy.HomeController;

@Controller
public class mypageUController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	mypageUService service;
	
	//===마이페이지 장바구니=======================================================================
	@RequestMapping(value = "mypageU/cart", method = RequestMethod.GET)
	public String cart(Model model) {
		model.addAttribute("msg","테스트페이지로슝");
		
		return "cart";
	}	
	
	//===마이페이지 메인=======================================================================
	@RequestMapping(value = "mypageU/mypage", method = RequestMethod.GET)
	public String mypage(Model model) {
		model.addAttribute("msg","테스트페이지로슝");
		
		return "mypage";
	}	
	
	//===회원정보조회=======================================================================
	@RequestMapping(value = "mypageU/userInfo", method = RequestMethod.GET)
	public ModelAndView userInfo(HttpSession session) throws Exception {
		logger.info("mypageU/userInfo");
		
		ModelAndView mav = new ModelAndView();
		
		String u_p_id = (String)session.getAttribute("id");
		
		//로그인 했다고 치고 u_p_id
		u_p_id = "king";
 		
		userInfoDTO userInfo = service.userInfo(u_p_id);
		logger.info("userInfo: " + userInfo);
		
		mav.addObject("userInfo", userInfo);
		mav.setViewName("userInfo");
		
		return mav;
	}	
	
	@RequestMapping(value = "mypageU/update_u_info", method = RequestMethod.POST)
	public String update_u_info(userInfoDTO userInfo) throws Exception {
		logger.info("mypageU/update_u_info post");
		logger.info("update_u_info userInfo param : " + userInfo);
		
		
		if (userInfo.getU_p_id() == null) {
			logger.info("로그인 확인 안됨 Error: " + userInfo);
			return "userInfo";
		}
		
 		//update하고
		int r = service.update_u_info(userInfo);
		logger.info("update return : " + r);
		logger.info("userInfo.getU_p_id() : " + userInfo.getU_p_id());
		
		if (r>0) {
			return "redirect:userInfo?u_p_id=" + userInfo.getU_p_id();
		} else {
			return "userInfo";
		}
	}		
	
	//===회원탈퇴=======================================================================
	@RequestMapping(value = "mypageU/u_unregister", method = RequestMethod.GET)
	public String u_unregister(Model model) {
		logger.info("mypageU/u_unregister");
		
		return "u_unregister";
	}	
	
	@RequestMapping(value = "mypageU/u_unregister", method = RequestMethod.POST)
	public String u_unregister(HttpSession session, Model model) throws Exception {
		logger.info("mypageU/u_unregister post");
		String u_p_id = (String)session.getAttribute("id");
		
		//로그인 했다고 치고 u_p_id
		u_p_id = "king";
		
		int r = service.u_unregister(u_p_id);
		
		if (r>0) {
			logger.info("회원탈퇴 완료");
			model.addAttribute("msg","회원탈퇴 완료");
			model.addAttribute("url","/");
			return "alert";
		} else {
			logger.info("회원탈퇴 실패");
			model.addAttribute("msg","회원탈퇴 실패");
			model.addAttribute("url","/mypageU/u_unregister");
			return "alert";
		}
	}	
	@RequestMapping(value = "mypageU/u_Addr_List", method = RequestMethod.GET)
	public String u_Addr_List(Model model) {
		model.addAttribute("msg","테스트페이지로슝");
		
		return "u_Addr_List";
	}	
	
	@RequestMapping(value = "mypageU/eatitem", method = RequestMethod.GET)
	public String eatitem(Model model) {
		model.addAttribute("msg","테스트페이지로슝");
		
		return "eatitem";
	}		
	@RequestMapping(value = "alert", method = RequestMethod.GET)
	public String alert(Model model) {
		logger.info("Controller- alert");
		
		return "alert";
	}		
	

}
