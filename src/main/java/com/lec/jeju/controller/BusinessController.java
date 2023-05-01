package com.lec.jeju.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lec.jeju.service.BusinessService;
import com.lec.jeju.vo.Business;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.HotelComment;
import com.lec.jeju.vo.Restaurant;

@Controller
@RequestMapping(value = "business")
public class BusinessController {
	@Autowired
	private BusinessService businessService;
	
	// 아이디 중복체크
	@RequestMapping(params = "method=idConfirm", method = RequestMethod.GET)
	public String idConfirm(String bid, Model model) {
		model.addAttribute("idConfirmResult", businessService.idConfirm(bid));
		return "business/idConfirm";
	}

	@RequestMapping(params = "method=bemailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String bemail, Model model) {
		model.addAttribute("bemailConfirmResult", businessService.emailConfirm(bemail));
		return "business/bemailConfirm";
	}
  
	// 회원가입 약관
	@RequestMapping(value = "/joinAgreePage.do", method = RequestMethod.GET)
	public String joinAgreePage() {
	    return "business/joinAgreePage";
	}

	// 회원가입 View
	@RequestMapping(params = "method=join", method = RequestMethod.GET)
	public String join() {
		return "business/join";
	}

	// 회원가입 처리
	@RequestMapping(params = "method=join", method = RequestMethod.POST)
	public String join(@ModelAttribute("bDto") Business business, Model model, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		model.addAttribute("joinResult", businessService.joinBusiness(business, httpSession, mRequest));
		return "business/login";
	}

	// 로그인 뷰
	@RequestMapping(params = "method=login", method = RequestMethod.GET)
	public String login() {
		return "business/login";
	}

	// 로그인 처리
	@RequestMapping(params = "method=login", method = RequestMethod.POST)
	public String login(String bid, String bpw, String after, HttpSession httpSession, Model model) {
		String loginResult = businessService.loginCheck(bid, bpw, httpSession);
		if (loginResult.equals("로그인 성공")) {
			httpSession.setAttribute("bid", bid);
			return "redirect:" + after;
		} else {
			model.addAttribute("loginResult", loginResult); // redirect 사용불가
			model.addAttribute("bid", bid);
			model.addAttribute("bpw", bpw);
			return "business/login";
		}
	}

	// 로그아웃
	@RequestMapping(params = "method=logout", method = RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:main.do";
	}

	// 로그인 후 정보수정으로 갈때
	@RequestMapping(value = "method=modify", method = RequestMethod.GET)
	public String modify1() {
		return "business/modify";
	}

	// 정보수정 뷰
	@RequestMapping(params = "method=modify", method = RequestMethod.GET)
	public String modify() {
		return "business/modify";
	}
	
	// 정보수정 처리
	@RequestMapping(params = "method=modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("bDto") Business business, HttpSession httpSession, Model model,MultipartHttpServletRequest mRequest) {
		model.addAttribute("modifyResult", businessService.modifyBusiness(business, httpSession, mRequest));
		return "forward:main.do";
	}

	// 회원탈퇴
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete() {
		return "business/delete";
	}

	// 회원탈퇴 처리
	@RequestMapping(params = "method=delete", method = RequestMethod.POST)
	public String deletebusiness(HttpSession session, String bpw, Model model, RedirectAttributes redirectAttributes) {
		Business business = (Business) session.getAttribute("business");
		String msg = null;
	if (business.getBpw().equals(bpw)) {
		int result = businessService.deleteBusiness(business.getBid());
	if (result > 0) {
		session.invalidate();
		redirectAttributes.addFlashAttribute("msg", "회원탈퇴가 완료되었습니다.");
		return "redirect:main.do";
	} else {
		msg = "회원탈퇴 처리가 실패 했습니다.";
	}
	} else {
		msg = "비밀번호가 일치하지 않습니다";
	}
		model.addAttribute("msg", msg);
		return "business/delete";
	}
	
	// 호텔 등록
	@RequestMapping(value = "/registerHotel", method = RequestMethod.GET)
	public String registerHotel() {
	    return "business/registerHotel";
	}

	@RequestMapping(value = "/registerHotel", method = RequestMethod.POST)
	public String registerHotel(@ModelAttribute("hotel") Hotel hotel, HttpSession session, MultipartHttpServletRequest mRequest, Model model) {
	    String bid = (String) session.getAttribute("bid");
	    hotel.setBid(bid);
	    hotel.setRequeststatus("P");
	    boolean registerHotel = businessService.registerHotel(hotel, mRequest);
	    if (registerHotel) {
	        return "redirect:/business/myHotelPosts.do";
	    } else {
	        model.addAttribute("errorMessage", "호텔 등록에 실패하였습니다.");
	        return "error";
	    }
	}
	
	// 호텔 수정
	@RequestMapping(value = "/modifyHotel", method = RequestMethod.PUT)
	public String modifyHotel(Hotel hotel, MultipartHttpServletRequest mRequest, Model model) {
		businessService.modifyHotel(hotel, mRequest);
		String bid = hotel.getBid();
		List<Hotel> hotels = businessService.myHotelPosts(bid);
		model.addAttribute("hotels", hotels);
		return "business/myHotelPosts";
	}
	
	// 호텔 등록 요청 목록
	@RequestMapping(value = "/myHotelPosts", method = RequestMethod.GET)
	public String myHotelPosts(Model model, HttpSession session) {
	    String bid = (String) session.getAttribute("bid");
	    List<Hotel> hotelList = businessService.myHotelPosts(bid);
	    model.addAttribute("hotelList", hotelList);
	    return "business/myHotelPosts";
	}
	
	// 호텔 등록 승인 여부 확인
	@RequestMapping(value = "/hotelApprovalStatus", method = RequestMethod.GET)
	public String selectHotelApprovalStatus(String hname, Model model) {
		String status = businessService.hotelApprovalStatus(hname);
		model.addAttribute("status", status);
		return "business/hotelApprovalStatus";
	}

	// 식당 등록
	@RequestMapping(value = "/registerRestaurant", method = RequestMethod.GET)
		public String showregisterRestaurant() {
		return "business/registerRestaurant";
	}

	@RequestMapping(value = "/registerRestaurant", method = RequestMethod.POST)
	public String registerRestaurant(Restaurant restaurant, Model model) {
		restaurant.setRequeststatus("P");
		businessService.registerRestaurant(restaurant);
		String bid = restaurant.getBid();
		List<Restaurant> restaurants = businessService.myRestaurantPosts(bid);
		model.addAttribute("restaurants", restaurants);
		return "business/myRestaurantPosts";
	}

	// 레스토랑 수정
	@RequestMapping(value = "/modifyRestaurant", method = RequestMethod.PUT)
	public String modifyRestaurant(Restaurant restaurant, Model model) {
		businessService.modifyRestaurant(restaurant);
		String bid = restaurant.getBid();
		List<Restaurant> restaurants = businessService.myRestaurantPosts(bid);
		model.addAttribute("restaurants", restaurants);
		return "business/myRestaurantPosts";
	}

	// 레스토랑 내 게시글 검색
	@RequestMapping(value = "/myRestaurantPosts", method = RequestMethod.GET)
	public String selectMyRestaurantPosts(String bid, Model model) {
		List<Restaurant> restaurants = businessService.myRestaurantPosts(bid);
		model.addAttribute("restaurants", restaurants);
		return "business/myRestaurantPosts";
	}

	// 레스토랑 등록 승인 여부 확인
	@RequestMapping(value = "/restaurantApprovalStatus", method = RequestMethod.GET)
	public String selectRestaurantApprovalStatus(String rname, Model model) {
		String status = businessService.restaurantApprovalStatus(rname);
		model.addAttribute("status", status);
		return "business/restaurantApprovalStatus";
	}
    
	// 호텔 댓글 조회
	@RequestMapping(value = "/myHotelComments", method = RequestMethod.GET)
	public String selectMyHotelComments(String bid, Model model) {
		List<HotelComment> comments = businessService.myHotelComments(bid);
		model.addAttribute("comments", comments);
		return "business/myHotelComments";
	}

   // @RequestMapping(value = "/myRestaurantComments", method = RequestMethod.GET)
   // public String selectMyRestaurantComments(String bid, Model model) {
   //     List<RestaurantComment> comments = businessService.myRestaurantComments(bid);
   //      model.addAttribute("comments", comments);
   //     return "business/myRestaurantComments";
   // }
}
	
	
