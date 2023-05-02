package com.lec.jeju.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.jeju.dao.SpotDao;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Spot;
@Service
public class SpotServiceImpl implements SpotService {
	@Autowired
	private SpotDao sDao;
	String backupPath = "C:/houn/source/10_2ndTeamProject/jeju-2ndTeamProject/src/main/webapp/spotImgFileUpload/";
	@Override
	public List<Spot> spotList(String pageNum, Spot spot) {
		Paging paging = new Paging(sDao.totCntSpot(spot), pageNum, 5, 5);
		spot.setStartRow(paging.getStartRow());
		spot.setEndRow(paging.getEndRow());
		return sDao.spotList(spot);
	}

	@Override
	public List<Spot> spotSchList(String pageNum, Spot spot) {
		Paging paging = new Paging(sDao.totCntSpot(spot), pageNum, 5, 5);
		spot.setStartRow(paging.getStartRow());
		spot.setEndRow(paging.getEndRow());
		return sDao.spotSchList(spot);
	}

	@Override
	public int insertSpot(Spot spot, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("spotImgFileUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String[] simg = {"", "", ""};
		int i = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			simg[i] = mFile.getOriginalFilename();
			if(simg[i] != null && !simg[i].equals("")) {
				if(new File(uploadPath+simg[i]).exists()) {
					// 서버에 동일 파일명 있을 시 파일명 교체
					simg[i] = System.currentTimeMillis() + simg[i];
				}
				try {
					mFile.transferTo(new File(uploadPath+simg[i]));
				    System.out.println("서버파일 : "+uploadPath+simg[i]);
				    System.out.println("백업파일 : "+backupPath+simg[i]);
				    int result = fileCopy(uploadPath + simg[i], backupPath + simg[i]);	// 파일카피
				    System.out.println(result == 1? i + "번째 백업 성공" : i + "번째 백업 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 첨부 안 함
				System.out.println(i + "번째 첨부 안함 : " + simg[i].equals("") != null ? "빈스트링" : "빈스트링 아님");
			} // if
			i++;
		} // while
		spot.setSmainimg(simg[0]);
		spot.setSsubimg_1(simg[1]);
		spot.setSsubimg_2(simg[2]);
		return sDao.insertSpot(spot);
	}

	@Override
	public int modifySpot(Spot spot, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("spotImgFileUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String[] simg = {"", "", ""};
		int i = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			simg[i] = mFile.getOriginalFilename();
			if(simg[i] != null && !simg[i].equals("")) {
				if(new File(uploadPath+simg[i]).exists()) {
					// 서버에 동일 파일명 있을 시 파일명 교체
					simg[i] = System.currentTimeMillis() + simg[i];
				}
				try {
					mFile.transferTo(new File(uploadPath+simg[i]));
				    System.out.println("서버파일 : "+uploadPath+simg[i]);
				    System.out.println("백업파일 : "+backupPath+simg[i]);
				    int result = fileCopy(uploadPath + simg[i], backupPath + simg[i]);	// 파일카피
				    System.out.println(result == 1? i + "번째 백업 성공" : i + "번째 백업 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 첨부 안 함
				System.out.println(i + "번째 첨부 안함 : " + simg[i].equals("") != null ? "빈스트링" : "빈스트링 아님");
			} // if
			i++;
		} // while
		spot.setSmainimg(simg[0]);
		spot.setSsubimg_1(simg[1]);
		spot.setSsubimg_2(simg[2]);
		return sDao.modifySpot(spot);
	}

	@Override
	public int totCntSpot(Spot spot) {
		return sDao.totCntSpot(spot);
	}

	@Override
	public Spot detailSpot(String sname) {
		return sDao.detailSpot(sname);
	}
	
	@Override
	public int deleteSpot(String sname) {
		return sDao.deleteSpot(sname);
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
}
