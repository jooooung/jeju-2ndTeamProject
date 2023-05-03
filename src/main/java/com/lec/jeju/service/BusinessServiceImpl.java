package com.lec.jeju.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.jeju.dao.BusinessDao;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Business;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.HotelComment;
import com.lec.jeju.vo.Restaurant;
@Service
public class BusinessServiceImpl implements BusinessService {
	
	@Autowired
	private BusinessDao businessDao;
	String backupPath = "C:/webPro1/source/las/jeju-2ndTeamProject/src/main/webapp/businessPhoto/";
	
	String backupPath1 = "C:/webPro1/source/las/jeju-2ndTeamProject/src/main/webapp/hotelImgFileUpload/";
	
	@Autowired
	private JavaMailSender mailSender;
	
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
				int result = fileCopy(uploadPath + bphoto, backupPath + bphoto);
				System.out.println(result == 1? "백업성공" : "백업실패");
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
			String param = params.next();
			MultipartFile bfile = mRequest.getFile(param);
			String originalFileName = bfile.getOriginalFilename();
			String saveFileName = System.currentTimeMillis() + originalFileName;
			try {
				bfile.transferTo(new File(uploadPath + saveFileName));
				System.out.println("서버파일 : " + uploadPath + saveFileName);
				System.out.println("백업파일 : " + backupPath + saveFileName);
				int result = fileCopy(uploadPath + saveFileName, backupPath + saveFileName);
				System.out.println(result == 1? "백업 성공" : "백업 실패");
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
	
	private int fileCopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = 1;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

	private boolean filecopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
	
	@Override
	public boolean registerHotel(Hotel hotel, MultipartHttpServletRequest mRequest) {
	    boolean isSuccess = false;

	    String hname = mRequest.getParameter("hname");
	    hotel.setHname(hname);
	    String uploadPath = mRequest.getRealPath("hotelImgFileUpload/");
	    String backupPath1 = "C:/webPro1/source/las/jeju-2ndTeamProject/src/main/webapp/hotelImgFileUpload/";
	    String[] himg = new String[4];
	    int i = 0;

	    Iterator<String> params = mRequest.getFileNames();
	    while (params.hasNext()) {
	        String param = params.next();
	        MultipartFile mFile = mRequest.getFile(param);
	        String originalFileName = mFile.getOriginalFilename(); // 업로드한 파일이름
	        himg[i] = originalFileName;

	        if (himg[i] != null && !himg[i].equals("")) {
	            if (new File(uploadPath + himg[i]).exists()) {
	                himg[i] = System.currentTimeMillis() + himg[i];
	            }

	            try {
	                mFile.transferTo(new File(uploadPath + himg[i]));
	                System.out.println("서버에 저장된 파일 : " + uploadPath + himg[i]);
	                System.out.println("복사될 파일 : " + backupPath1 + himg[i]);
	                isSuccess = filecopy(uploadPath + himg[i], backupPath1 + himg[i]);
	            } catch (IOException e) {
	                System.out.println(e.getMessage());
	            }
	        } else {
	            System.out.println(i + "번째 첨부 안 함 : " + (himg[i].equals("") ? "빈스트링" : "빈스트링 아님"));
	        }
	        i++;
	    }
	    hotel.setHmainimg(himg[0]);
	    hotel.setHsubimg_1(himg[1]);
	    hotel.setHsubimg_2(himg[2]);
	    hotel.setHsubimg_3(himg[3]);
	    
	    boolean result = businessDao.registerHotel(hotel, mRequest);
	    if (result) {
	        isSuccess = true;
	    }
	    return isSuccess;
	}
	@Override
	public int registerHoteldummy(Hotel hotel) {
		return businessDao.registerHoteldummy(hotel);
	}
	
	@Override
	public void modifyHotel(Hotel hotel, MultipartHttpServletRequest mRequest) {
		businessDao.modifyHotel(hotel, mRequest);
	}

	@Override
	public List<Hotel> myHotelPosts(String bid, int startRow, int endRow) {
	    return businessDao.myHotelPosts(bid, startRow, endRow);
	}
	
	@Override
	public String hotelApprovalStatus(String hname) {
	    return businessDao.hotelApprovalStatus(hname);
	}

	@Override
	public boolean registerRestaurant(Restaurant restaurant, MultipartHttpServletRequest mRequest) {
	    boolean isSuccess = false;

	    String rname = mRequest.getParameter("rname");
	    restaurant.setRname(rname);
	    String uploadPath = mRequest.getRealPath("resImgFileUpload/");
	    String backupPath2 = "C:/webPro1/source/las/jeju-2ndTeamProject/src/main/webapp/resImgFileUpload/";
	    String[] rimg = new String[4];
	    int i = 0;

	    Iterator<String> params = mRequest.getFileNames();
	    while (params.hasNext()) {
	        String param = params.next();
	        MultipartFile mFile = mRequest.getFile(param);
	        String originalFileName = mFile.getOriginalFilename(); // 업로드한 파일이름
	        rimg[i] = originalFileName;

	        if (rimg[i] != null && !rimg[i].equals("")) {
	            if (new File(uploadPath + rimg[i]).exists()) {
	                rimg[i] = System.currentTimeMillis() + rimg[i];
	            }

	            try {
	                mFile.transferTo(new File(uploadPath + rimg[i]));
	                System.out.println("서버에 저장된 파일 : " + uploadPath + rimg[i]);
	                System.out.println("복사될 파일 : " + backupPath2 + rimg[i]);
	                isSuccess = filecopy(uploadPath + rimg[i], backupPath2 + rimg[i]);
	            } catch (IOException e) {
	                System.out.println(e.getMessage());
	            }
	        } else {
	            System.out.println(i + "번째 첨부 안 함 : " + (rimg[i].equals("") ? "빈스트링" : "빈스트링 아님"));
	        }
	        i++;
	    }
	    restaurant.setRmainimg(rimg[0]);
	    restaurant.setRsubimg_1(rimg[1]);
	    restaurant.setRsubimg_2(rimg[2]);
	    restaurant.setRsubimg_3(rimg[3]);
	    
	    boolean result = businessDao.registerRestaurant(restaurant, mRequest);
	    if (result) {
	        isSuccess = true;
	    }
	    return isSuccess;
	}

	@Override
	public void modifyRestaurant(Restaurant restaurant) {
		businessDao.modifyRestaurant(restaurant);
	}

	@Override
	public List<Restaurant> myRestaurantPosts(String bid, int startRow, int endRow) {
	    return businessDao.myRestaurantPosts(bid, startRow, endRow);
	}

	@Override
	public String restaurantApprovalStatus(String rname) {
	    return businessDao.restaurantApprovalStatus(rname);
	}

	@Override
	public List<HotelComment> hCommentList(HotelComment hotelComment, String pageNum) {
		Paging paging = new Paging(businessDao.totCntHcomment(hotelComment), pageNum, 5, 5);
		hotelComment.setStartrow(paging.getStartRow());
		hotelComment.setEndrow(paging.getEndRow());
		return businessDao.hCommentList(hotelComment);
	}// 숙소 댓글 목록

	@Override
	public int totCntHcomment(String hname, HotelComment hotelComment) {
		return businessDao.totCntHcomment(hotelComment);
	}// 숙소 댓글 개수

	@Override
	public int registerHcomment(HotelComment hotelComment) {
		return businessDao.registerHcomment(hotelComment);
	}// 숙소 댓글 쓰기

	@Override
	public int replyHotelComment(HotelComment hotelComment) {
		businessDao.preReplyHcomment(hotelComment);
		return businessDao.replyHotelComment(hotelComment);
	}// 숙소 답 댓글 쓰기

	@Override
	public int modifyHotelComment(HotelComment hotelComment) {
		return businessDao.modifyHotelComment(hotelComment);
	}// 숙소 댓글 수정

	@Override
	public int deleteHotelComment(int hcommentno) {
		return businessDao.deleteHotelComment(hcommentno);
	}// 숙소 댓글 삭제
	/**
	@Override
	public List<RestaurantComment> rCommentList(RestaurantComment restaurantComment, String pageNum) {
		Paging paging = new Paging(businessDao.totCntRcomment(restaurantComment), pageNum, 5, 5);
		restaurantComment.setStartrow(paging.getStartRow());
		restaurantComment.setEndrow(paging.getEndRow());
		return businessDao.rCommentList(restaurantComment);
	}// 식당 댓글 목록
	
	@Override
	public int totCntRcomment(String rname, RestaurantComment restaurantComment) {
		return businessDao.totCntRcomment(RestaurantComment);
	}// 식당 댓글 개수

	@Override
	public int registerRcomment(RestaurantComment restaurantComment) {
		return businessDao.registerRcomment(restaurantComment);
	}// 식당 댓글 쓰기

	@Override
	public int replyRestaurantComment(RestaurantComment restaurantComment) {
		businessDao.preReplyRcomment(restaurantComment);
		return businessDao.replyRestaurantComment(restaurantComment);
	}// 식당 답 댓글 쓰기

	@Override
	public int modifyRestaurantComment(RestaurantComment restaurantComment) {
		return businessDao.modifyRestaurantComment(restaurantComment);
	}// 식당 댓글 수정

	@Override
	public int deleteRestaurantComment(int rcommentno) {
		return businessDao.deleteRestaurantComment(rcommentno);
	}// 식당 댓글 삭제
	**/

	@Override
	public int hotelTotalCount(String bid) {
	    return businessDao.hotelTotalCount(bid);
	}
	
	@Override
	public int restaurantTotalCount(String bid) {
	    return businessDao.restaurantTotalCount(bid);
	}
}
