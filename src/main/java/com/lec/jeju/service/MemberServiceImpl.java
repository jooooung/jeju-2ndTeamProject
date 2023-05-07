package com.lec.jeju.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.UUID;

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

import com.lec.jeju.dao.MemberDao;
import com.lec.jeju.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private JavaMailSender mailSender;

	String backupPath = "D:/TeamProject/jeju-2ndTeamProject/jeju-2ndTeamProject/src/main/webapp/memberPhoto";

	@Override
	public int idConfirm(String mid) {
		return memberDao.idConfirm(mid);
	}

	@Override
	public int emailConfirm(String memail) {
		return memberDao.emailConfirm(memail);
	}

	@Override
	public int joinMember(final Member member, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("memberPhoto/");
		Iterator<String> params = mRequest.getFileNames();
		String mphoto = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		mphoto = mFile.getOriginalFilename();
		if (mphoto != null && !mphoto.equals("")) { // 첨부함
			if (new File(uploadPath + mphoto).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				mphoto = System.currentTimeMillis() + "_" + mphoto;
			} // if
			try {
				mFile.transferTo(new File(uploadPath + mphoto)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + mphoto);
				System.out.println("백업파일 : " + backupPath + mphoto);
				boolean result = fileCopy(uploadPath + mphoto, backupPath + mphoto);
				System.out.println(result ? "백업성공" : "백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		} else {
			mphoto = "default_profile.png";
		} // if
			// 메일전송
		final String mailContent = createWelcomeMailContent(member);
		MimeMessagePreparator message = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// 받을 메일
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemail()));
				// 보낼 메일
				mimeMessage.setFrom(new InternetAddress("jejukang94@gmail.com"));
				// 메일 제목
				mimeMessage.setSubject("[제주어때] " + member.getMname() + "님 제주도에 혼저옵서 !");
				// 메일 본문
				mimeMessage.setText(mailContent, "utf-8", "html");
			}
		}; // message 객체 생성
		mailSender.send(message); // 메일 전송
		httpSession.setAttribute("mid", member.getMid());
		member.setMphoto(mphoto);
		return memberDao.joinMember(member);
	}

	@Override
	public String loginCheck(String mid, String mpw, HttpSession httpSession) {
		String result = "로그인 성공";
		Member member = memberDao.getDetailMember(mid);
		if (member == null) {
			result = "유효하지 않은 아이디 입니다.";
		} else if (!member.getMpw().equals(mpw)) {
			result = "비밀번호가 맞지 않습니다";
		} else {
			httpSession.setAttribute("member", member);
		}
		return result;
	}

	@Override
	public Member getDetailMember(String mid) {
		return memberDao.getDetailMember(mid);
	}

	@Override
	public int modifyMember(Member member, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		// 기존 멤버 정보를 세션에서 가져옴
		Member sessionMember = (Member) httpSession.getAttribute("member");
		// 비밀번호
		String newPassword = member.getMpw();
		if (newPassword == null || newPassword.isEmpty()) {
			member.setMpw(sessionMember.getMpw());
		}
		// 이름
		String newName = member.getMname();
		if (newName == null || newName.isEmpty()) {
			member.setMname(sessionMember.getMname());
		}
		// 사진
		String mphoto = sessionMember.getMphoto();
		MultipartFile mFile = mRequest.getFile("temphoto");
		if (mFile != null && !mFile.isEmpty()) { // 새로운 파일이 첨부되었을 때
			String uploadPath = mRequest.getRealPath("memberPhoto/");
			String fileName = mFile.getOriginalFilename();
			if (new File(uploadPath + fileName).exists()) { // 같은 이름의 파일이 이미 존재하는 경우
				fileName = System.currentTimeMillis() + "_" + fileName;
			}
			try {
				mFile.transferTo(new File(uploadPath + fileName)); // 파일 업로드
				boolean result = fileCopy(uploadPath + fileName, backupPath + fileName); // 백업 파일 생성
				System.out.println(result ? "백업성공" : "백업실패");
				mphoto = "memberPhoto/" + fileName;
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		member.setMphoto(mphoto);

		httpSession.setAttribute("member", member);
		return memberDao.modifyMember(member);
	}

	public String findPW(final String mid, final String memail) {
		final Member member = new Member();
		member.setMid(mid);
		member.setMemail(memail);
		// 임시 비밀번호 생성 및 업데이트
		final String tempPw = UUID.randomUUID().toString().replace("-", "").substring(0, 6);
		member.setMpw(tempPw);
		memberDao.updatePW(member);
		String result = memberDao.findPW(member);
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<div style=\"width:500px; margin: 0 auto\">\n"
					+ "<img src=\"http://localhost:8088/jeju/img/logo(2).png\" "
					+ "alt=\"제주도가즈아\" style=\"width: 100%; max-width: 500px;\">\n" 
					+ " <h2>제주어때 임시 비밀번호 안내 메일 입니다.</h2>\n"
					+ " <h3>" + member.getMid() + "님의 임시 비밀번호는 " + tempPw + " 입니다.</h3>\n"
					+ "<p style=\"color:black; font-weight:bold;\">로그인 후 꼭 비밀번호를 변경해주세요.</p>" 
					+ "</div>";


			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemail())); // 받을 메일 주소
				mimeMessage.setFrom(new InternetAddress("jejukang94@gmail.com")); // 보낼 메일 주소
				mimeMessage.setSubject("[제주어때] " + member.getMid() + "님, 임시 비밀번호 안내 메일입니다."); // 메일 제목
				mimeMessage.setText(content, "utf-8", "html"); // 메일 내용
			}
		};
		mailSender.send(message); // 메일 전송
		return result;
	}

	@Override
	public int updatePW(Member member, HttpSession session) {
		return memberDao.updatePW(member);
	}

	@Override
	public int deleteMember(String mid) {
		int result = memberDao.deleteMember(mid);
		return result;
	}

	@Override
	public void logout(HttpSession httpSession) {
		httpSession.invalidate();

	}

	@Override
	public String findID(String memail, HttpSession session) {
		String mid = memberDao.findID(memail); // 회원 아이디 조회
		if (mid == null) {
			throw new RuntimeException("회원 아이디를 찾을 수 없습니다.");
		}
		return mid;
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

	// 메일전송 본문
	private String createWelcomeMailContent(Member member) {
		String content = "<div style=\"text-align: center;\">\n" + " <style>\n" + " @font-face {\n"
				+ "     font-family: 'RIDIBatang';\n"
				+ "     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');\n"
				+ "     font-weight: normal;\n" + "     font-style: normal;\n" + " }\n" + " </style>\n"
				+ " <img src=\"http://localhost:8088/jeju/img/logo(2).png\" "
				+ "alt=\"제주도가즈아\" style=\"max-width: 100%; width: 500px;\">\n"
				+ " <div style=\"width:500px; margin: 0 auto\">\n" + "  <h1 style=\"font-family: 'RIDIBatang';\">"
				+ member.getMname() + "님 회원가입 감사합니다!</h1>\n"
				+ "  <p style=\"color:orange; font-weight:bold; font-family: 'RIDIBatang';\">저희 제주어때 사이트에 오신걸 환영합니다.</p>\n"
				+ "  <p style=\"color:green; font-weight:bold; font-family: 'RIDIBatang';\">부디 편안하고 안전한 여행 되시길 바랍니다.</p>\n"
				+ "  <p style=\"color:black; font-weight:bold; font-family: 'RIDIBatang';\">(00000) 제주특별자치도 제주시 JEJU 어때</p>\n"
				+ "  <p style=\"color:black; font-weight:bold; font-family: 'RIDIBatang';\">관광불편신고 : 제주안내 120 콜센터 (국번없이 120번)</p>\n"
				+ " </div>\n" + "</div>";
		return content;
	}

}
