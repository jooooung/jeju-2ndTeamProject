package com.lec.jeju.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.jeju.dao.HotelDao;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Location;
@Service
public class HotelServiceImpl implements HotelService {
	@Autowired
	private HotelDao hotelDao;
	String backupPath = "C:/Full-stack/sourse/10_jejuProject/jeju/src/main/webapp/hotelImgFileUpload/";
	
	@Override
	public List<Hotel> hotelList(String pageNum, Hotel hotel, Model model) {
		Paging paging = new Paging(hotelDao.totCntHotel(hotel), pageNum, 5, 5);
		model.addAttribute("paging", paging);
		hotel.setStartrow(paging.getStartRow());
		hotel.setEndrow(paging.getEndRow());
		return hotelDao.hotelList(hotel);
	}
	
	@Override
	public int totCntHotel(Hotel hotel) {
		return hotelDao.totCntHotel(hotel);
	}

	@Override
	public Hotel detailHotel(String hname) {
		return hotelDao.detailHotel(hname);
	}

	@Override
	public int registerHotel(Hotel hotel, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("hotelImgFileUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String[] himg = {"", "", "", ""};
		int i = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			himg[i] = mFile.getOriginalFilename();
			if(himg[i] != null && !himg[i].equals("")) {
				// 파일 첨부 함
				if(new File(uploadPath+himg[i]).exists()) {
					// 서버에 동일 파일명 있을 시 파일명 교체
					himg[i] = System.currentTimeMillis() + himg[i];
				}
				try {
					mFile.transferTo(new File(uploadPath+himg[i]));
				    System.out.println("서버파일 : "+uploadPath+himg[i]);
				    System.out.println("백업파일 : "+backupPath+himg[i]);
				    int result = fileCopy(uploadPath + himg[i], backupPath + himg[i]);	// 파일카피
				    System.out.println(result == 1? i + "번째 백업 성공" : i + "번째 백업 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 첨부 안 함
				System.out.println(i + "번째 첨부 안함 : " + himg[i].equals("") != null ? "빈스트링" : "빈스트링 아님");
			} // if
			i++;
		} // while
		hotel.setHmainimg(himg[0]);
		hotel.setHsubimg_1(himg[1]);
		hotel.setHsubimg_2(himg[2]);
		hotel.setHsubimg_3(himg[3]);
	
		return hotelDao.registerHotel(hotel);
	}

	@Override
	public int modifyHotel(Hotel hotel, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("hotelImgFileUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String[] himg = {"", "", "", ""};
		int i = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			himg[i] = mFile.getOriginalFilename();
			if(himg[i] != null && !himg[i].equals("")) {
				// 파일 첨부 함
				if(new File(uploadPath+himg[i]).exists()) {
					// 서버에 동일 파일명 있을 시 파일명 교체
					himg[i] = System.currentTimeMillis() + himg[i];
				}
				try {
					mFile.transferTo(new File(uploadPath+himg[i]));
				    System.out.println("서버파일 : "+uploadPath+himg[i]);
				    System.out.println("백업파일 : "+backupPath+himg[i]);
				    int result = fileCopy(uploadPath + himg[i], backupPath + himg[i]);	// 파일카피
				    System.out.println(result == 1? i + "번째 백업 성공" : i + "번째 백업 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 첨부 안 함
				System.out.println(i + "번째 첨부 안함 : " + himg[i].equals("") != null ? "빈스트링" : "빈스트링 아님");
			} // if
			i++;
		} // while
		hotel.setHmainimg(himg[0]);
		hotel.setHsubimg_1(himg[1]);
		hotel.setHsubimg_2(himg[2]);
		return hotelDao.modifyHotel(hotel);
	}

	@Override
	public int deleteHotel(String hname) {
		return hotelDao.deleteHotel(hname);
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

	@Override
	public List<Location> locList() {
		return hotelDao.locList();
	}
}