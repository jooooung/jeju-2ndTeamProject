package com.lec.jeju.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
import com.lec.jeju.util.Paging;
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
	public String join(@ModelAttribute("bDto") Business business, Model model, HttpSession httpSession,
			MultipartHttpServletRequest mRequest) {
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

	// 정보수정 뷰
	@RequestMapping(params = "method=modify", method = RequestMethod.GET)
	public String modify() {
		return "business/modify";
	}

	// 정보수정 처리
	@RequestMapping(params = "method=modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("bDto") Business business, HttpSession httpSession, Model model,
			MultipartHttpServletRequest mRequest) {
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
	public String registerHotel(@ModelAttribute("hotel") Hotel hotel, HttpSession session,
			MultipartHttpServletRequest mRequest, Model model) {
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


	// 호텔 등록 요청 목록
	@RequestMapping(value = "/myHotelPosts", method = RequestMethod.GET)
	public String myHotelPosts(Model model, HttpSession session, @RequestParam(defaultValue = "1") int pageNum) {
		String bid = (String) session.getAttribute("bid");
		int hotelTotalCount = businessService.hotelTotalCount(bid); // 등록 요청 건수 조회
		Paging paging = new Paging(hotelTotalCount, String.valueOf(pageNum), 5, 5); // 페이징 객체 생성
		List<Hotel> hotelList = businessService.myHotelPosts(bid, paging.getStartRow(), paging.getEndRow()); // 범위 내 등록
																												// 요청 목록
																												// 조회
		model.addAttribute("hotelList", hotelList);
		model.addAttribute("paging", paging); // 페이징 정보 전달
		return "business/myHotelPosts";
	}
	

	// 식당 등록
	@RequestMapping(value = "/registerRestaurant", method = RequestMethod.GET)
	public String registerRestaurant() {
		return "business/registerRestaurant";
	}

	@RequestMapping(value = "/registerRestaurant", method = RequestMethod.POST)
	public String registerRestaurant(@ModelAttribute("restaurant") Restaurant restaurant, HttpSession session,
			MultipartHttpServletRequest mRequest, Model model) {
		String bid = (String) session.getAttribute("bid");
		restaurant.setBid(bid);
		restaurant.setRequeststatus("P");

		boolean registerRestaurant = businessService.registerRestaurant(restaurant, mRequest);
		if (registerRestaurant) {
			return "redirect:/business/myRestaurantPosts.do";
		} else {
			model.addAttribute("errorMessage", "식당 등록에 실패하였습니다.");
			return "error";
		}
	}

	// 레스토랑 등록 요청 목록
	@RequestMapping(value = "/myRestaurantPosts", method = RequestMethod.GET)
	public String myRestaurantPosts(Model model, HttpSession session, @RequestParam(defaultValue = "1") int pageNum) {
		String bid = (String) session.getAttribute("bid");
		int restaurantTotalCount = businessService.restaurantTotalCount(bid); // 등록 요청 건수 조회
		Paging paging = new Paging(restaurantTotalCount, String.valueOf(pageNum), 5, 5); // 페이징 객체 생성
		List<Restaurant> restaurantList = businessService.myRestaurantPosts(bid, paging.getStartRow(),
				paging.getEndRow()); // 범위 내 등록 요청 목록 조회
		model.addAttribute("restaurantList", restaurantList);
		model.addAttribute("paging", paging); // 페이징 정보 전달
		return "business/myRestaurantPosts";
	}

	// 승인 및 거절 요청 상세 내용 보기
	@RequestMapping(value = "/hotelDetail", method = RequestMethod.GET)
	public String hotelDetail(String hname, Model model) {
		Hotel hotel = businessService.getHotelByName(hname);
		model.addAttribute("hotel", hotel);
		return "business/hotelDetail";
	}

	@RequestMapping(value = "/restaurantDetail", method = RequestMethod.GET)
	public String restaurantDetail(String rname, Model model) {
		Restaurant restaurant = businessService.getRestaurantByName(rname);
		model.addAttribute("restaurant", restaurant);
		return "business/restaurantDetail";
	}
	
}
