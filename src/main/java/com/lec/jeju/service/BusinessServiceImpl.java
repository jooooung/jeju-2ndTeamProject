package com.lec.jeju.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.jeju.dao.BusinessDao;
import com.lec.jeju.vo.Business;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.HotelComment;
import com.lec.jeju.vo.Restaurant;

@Service
public class BusinessServiceImpl implements BusinessService {
	
	@Autowired
	private BusinessDao businessDao;

	@Autowired
	private JavaMailSender mailSender;

	String backupPath = "C:/webPro1/source/las/jeju-2ndTeamProject/src/main/webapp/businessPhoto/";

	@Override
	public int idConfirm(String bid) {
		return businessDao.idConfirm(bid);
	}

	@Override
	public int emailConfirm(String bemail) {
		return businessDao.emailConfirm(bemail);
	}

	@Override
	public int joinBusiness(final Business business, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("businessPhoto/");
		Iterator<String> params = mRequest.getFileNames();
		String bphoto = "";
		String param = params.next();
		MultipartFile bFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		bphoto = bFile.getOriginalFilename();
		if (bphoto != null && !bphoto.equals("")) { // 첨부함
			if (new File(uploadPath + bphoto).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				bphoto = System.currentTimeMillis() + "_" + bphoto;
			} // if
			try {
				bFile.transferTo(new File(uploadPath + bphoto)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + bphoto);
				System.out.println("백업파일 : " + backupPath + bphoto);
				boolean result = fileCopy(uploadPath + bphoto, backupPath + bphoto);
				System.out.println(result ? "백업성공" : "백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		} else {
			bphoto = "NOIMG.JPG";
		} // if
			// 메일전송
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<div style=\"width:500px; margin: 0 auto\">\n" + " <h1>" + business.getBname()
					+ "님의 회원가입 감사합니다</h1>\n" + " 7일 이내 업체 등록 신청해주셔야 하며, 미등록시 탈퇴처리 됩니다.<br>\n"
					+ " </div>";

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// 받을 메일
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(business.getBemail()));
				// 보낼 메일
				mimeMessage.setFrom(new InternetAddress("***@gmail.com"));
				// 메일 제목
				mimeMessage.setSubject("[HTML 가입인사]" + business.getBname() + "님 가입 감사합니다");
				// 메일 본문
				mimeMessage.setText(content, "utf-8", "html");
			}
		}; // message 객체 생성
		mailSender.send(message); // 메일 전송
		httpSession.setAttribute("bid", business.getBid());
		business.setBphoto(bphoto);
		return businessDao.joinBusiness(business);
	}

	@Override
	public String loginCheck(String bid, String bpw, HttpSession httpSession) {
		String result = "로그인 성공";
		Business business = businessDao.getDetailBusiness(bid);
		if (business == null) {
			result = "유효하지 않은 아이디 입니다.";
		} else if (!business.getBpw().equals(bpw)) {
			result = "비밀번호가 맞지 않습니다";
		} else {
			httpSession.setAttribute("business", business);
		}
		return result;
	}

	@Override
	public Business getDetailBusiness(String bid) {
		return businessDao.getDetailBusiness(bid);
	}

	@Override
	public int modifyBusiness(Business business, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("businessPhoto/");
		Iterator<String> params = mRequest.getFileNames();
		String bphoto = "";
		// 기존 멤버 정보를 세션에서 가져옴
		Business sessionBusiness = (Business) httpSession.getAttribute("business");
		// 새 비밀번호를 가져옴
		String newPassword = business.getBpw();
		// 새 비밀번호가 null 이거나 빈 문자열일 경우, 기존 비밀번호로 설정
		if (newPassword == null || newPassword.isEmpty()) {
			business.setBpw(sessionBusiness.getBpw());
		}
		while (params.hasNext()) {
			String paramName = params.next();
			MultipartFile bfile = mRequest.getFile(paramName);
			String originalFileName = bfile.getOriginalFilename();
			String saveFileName = System.currentTimeMillis() + originalFileName;
			try {
				bfile.transferTo(new File(uploadPath + saveFileName));
				System.out.println("서버파일 : " + uploadPath + saveFileName);
				System.out.println("백업파일 : " + backupPath + saveFileName);
				boolean result = fileCopy(uploadPath + saveFileName, backupPath + saveFileName);
				System.out.println(result ? "백업성공" : "백업실패");
			} catch (IOException e) {
				e.printStackTrace();
			}
			bphoto = "businessPhoto/" + saveFileName;
		}
		// 새로운 프로필 사진 경로를 business 객체에 저장
		business.setBphoto(bphoto);
		// 세션에 새 멤버 정보 저장
		httpSession.setAttribute("business", business);
		// 데이터베이스에 업데이트 요청
		return businessDao.modifyBusiness(business);
	}

	@Override
	public int deleteBusiness(String bid) {
		int result = businessDao.deleteBusiness(bid);
		return result;
	}

	@Override
	public void logout(HttpSession httpSession) {
		httpSession.invalidate();

	}

	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null;
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while (true) {
				int nReadByte = is.read(buff);
				if (nReadByte == -1)
					break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (os != null)
					os.close();
				if (is != null)
					is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
	
	@Override
	public void registerHotel(Hotel hotel, HttpServletRequest request) {
		businessDao.registerHotel(hotel, request);
	}

	@Override
	public void modifyHotel(Hotel hotel) {
		businessDao.modifyHotel(hotel);
	}

	@Override
	public List<Hotel> myHotelPosts(String bid) {
	    return businessDao.myHotelPosts(bid);
	}

	@Override
	public String hotelApprovalStatus(String hname) {
	    return businessDao.hotelApprovalStatus(hname);
	}

	@Override
	public void registerRestaurant(Restaurant restaurant) {
		businessDao.registerRestaurant(restaurant);
	}

	@Override
	public void modifyRestaurant(Restaurant restaurant) {
		businessDao.modifyRestaurant(restaurant);
	}

	@Override
	public List<Restaurant> myRestaurantPosts(String bid) {
	    return businessDao.myRestaurantPosts(bid);
	}

	@Override
	public String restaurantApprovalStatus(String rname) {
	    return businessDao.restaurantApprovalStatus(rname);
	}

	@Override
	public List<HotelComment> myHotelComments(String bid) {
	    return businessDao.myHotelComments(bid);
	}
	
	//@Override
	//public List<RestaurntComment> selectMyRestaurntComments(String bid) {
	//    return businessDao.selectMyRestaurntComments(bid);
	//}

}
