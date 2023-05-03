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

import com.lec.jeju.dao.RestaurantDao;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Restaurant;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	@Autowired
	private RestaurantDao resDao;
	String backupPath = "D:/TeamProject/Source/jeju-2ndTeamProject/src\\main/webapp/resImgFileUpload/";

	@Override
	public List<Restaurant> ResList(String pageNum, Restaurant res) {
		Paging paging = new Paging(resDao.totCntRes(res), pageNum, 4, 4);
		res.setStartRow(paging.getStartRow());
		res.setEndRow(paging.getEndRow());
		return resDao.ResList(res);
	}

	@Override
	public List<Restaurant> ResSchList(String pageNum, Restaurant res) {
		Paging paging = new Paging(resDao.totCntRes(res), pageNum, 4, 4);
		res.setStartRow(paging.getStartRow());
		res.setEndRow(paging.getEndRow());
		return resDao.ResSchList(res);
	}

	@Override
	public int totCntRes(Restaurant res) {
		return resDao.totCntRes(res);
	}

	@Override
	public int insertRes(Restaurant res, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("resImgFileUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String[] rimg = { "", "", "", "" };
		int i = 0;
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			rimg[i] = mFile.getOriginalFilename();
			if (rimg[i] != null && !rimg[i].equals("")) {
				if (new File(uploadPath + rimg[i]).exists()) {
					// 서버에 동일 파일명 있을 시 파일명 교체
					rimg[i] = System.currentTimeMillis() + rimg[i];
				}
				try {
					mFile.transferTo(new File(uploadPath + rimg[i]));
					System.out.println("서버파일 : " + uploadPath + rimg[i]);
					System.out.println("백업파일 : " + backupPath + rimg[i]);
					int result = fileCopy(uploadPath + rimg[i], backupPath + rimg[i]); // 파일카피
					System.out.println(result == 1 ? i + "번째 백업 성공" : i + "번째 백업 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 첨부 안 함
				System.out.println(i + "번째 첨부 안함 : " + rimg[i].equals("") != null ? "빈스트링" : "빈스트링 아님");
			} // if
			i++;
		} // while
		res.setRmainimg(rimg[0]);
		res.setRsubimg_1(rimg[1]);
		res.setRsubimg_2(rimg[2]);
		res.setRsubimg_3(rimg[3]);
		return resDao.insertRes(res);
	}

	@Override
	public int modifyRes(Restaurant res, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("resImgFileUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String[] rimg = { "", "", "", "" };
		int i = 0;
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			rimg[i] = mFile.getOriginalFilename();
			if (rimg[i] != null && !rimg[i].equals("")) {
				if (new File(uploadPath + rimg[i]).exists()) {
					// 서버에 동일 파일명 있을 시 파일명 교체
					rimg[i] = System.currentTimeMillis() + rimg[i];
				}
				try {
					mFile.transferTo(new File(uploadPath + rimg[i]));
					System.out.println("서버파일 : " + uploadPath + rimg[i]);
					System.out.println("백업파일 : " + backupPath + rimg[i]);
					int result = fileCopy(uploadPath + rimg[i], backupPath + rimg[i]); // 파일카피
					System.out.println(result == 1 ? i + "번째 백업 성공" : i + "번째 백업 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 첨부 안 함
				System.out.println(i + "번째 첨부 안함 : " + rimg[i].equals("") != null ? "빈스트링" : "빈스트링 아님");
			} // if
			i++;
		} // while
		res.setRmainimg(rimg[0]);
		res.setRsubimg_1(rimg[1]);
		res.setRsubimg_2(rimg[2]);
		res.setRsubimg_3(rimg[3]);
		return resDao.modifyRes(res);
	}

	@Override
	public int deleteRes(Restaurant res) {
		// TODO Auto-generated method stub
		return resDao.deleteRes(res);
	}

	@Override
	public Restaurant detailRes(String rname) {
		return resDao.detailRes(rname);
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
			while (true) {
				int nReadByte = is.read(buff);
				if (nReadByte == -1)
					break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = 1;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (os != null)
					os.close();
				if (is != null)
					is.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

}
