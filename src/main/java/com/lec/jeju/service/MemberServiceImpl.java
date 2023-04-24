package com.lec.jeju.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.jeju.dao.MemberDao;
import com.lec.jeju.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;

	String backupPath = "D:/webPro/source/08_Spring/jeju/src/main/webapp/memberPhoto/";

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
			mphoto = null;
		} // if
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
	public int modifyMember(Member member, HttpSession httpSession) {
		httpSession.setAttribute("member", member);
		return memberDao.modifyMember(member);
	}

	@Override
	public int deleteMember(HttpSession httpSession, String mid) {
		int result = memberDao.deleteMember(mid);
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
}
