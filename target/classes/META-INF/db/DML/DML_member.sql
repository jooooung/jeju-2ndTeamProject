------------------------------------------------------
--           MEMBER query            
------------------------------------------------------
-- (1) 회원 ID 중복체크 - idConfirm
SELECT COUNT(*) FROM MEMBER WHERE MID = 'kang';

-- (2) 회원 이메일 중복체크 - emailConfirm
SELECT COUNT(*) FROM MEMBER WHERE mEMAIL = 'kang@Naver.com';

-- (3) 회원가입 - joinMember
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mADDR, mPOST, MBIRTH, MPHOTO)
    VALUES ('kang', '123', '강성빈', 'kang@Naver.com', '서울시 강서구', '12345', '1994-08-25','NOIMG.JPG');

-- (4) 로그인 - loginCheck
SELECT * FROM MEMBER WHERE mID='kang' AND mPW='123';

-- (5) 상세보기 - getDetailMember
SELECT * FROM MEMBER WHERE mID='aaa';

-- (6) 회원정보 수정 - modifyMember
UPDATE MEMBER SET 
        mPW = '123',
        mNAME = '수정용',
        mEMAIL = 'su@ss@.com',
        mADDR = '서울시 강남구',
        mPOST = '789456',
        mBIRTH = '1984-10-12',
        mPHOTO = 'NOIMG.JPG'
    WHERE mID = 'kang';

-- (7) 회원탈퇴 - deleteMember
DELETE FROM MEMBER WHERE mID = 'kang';

-- (8) 작성한 글 보기 - getReview
SELECT * FROM Review WHERE mID = 'aaa';

-- (9) 작성한 댓글 보기
SELECT * FROM restaurantComment WHERE mID = 'pham'; -- getResComment
SELECT * FROM hotelComment WHERE mID = 'kim'; -- getHotelComment
SELECT * FROM spotComment WHERE mID = 'aaa'; -- getSoptComment

-- (10) 북마크한 리스트 중 관광지만 보기 - bookmarkSpot
SELECT * 
    FROM SPOT, BOOKMARK
    WHERE SPOT.SNAME = BOOKMARK.SNAME
    AND BOOKMARK.MID = 'kim';

-- (11) 북마크한 리스트 중 식당만 보기 - bookmarkRes
SELECT *
    FROM RESTAURANT, BOOKMARK
    WHERE RESTAURANT.RNAME = BOOKMARK.RNAME
    AND BOOKMARK.MID = 'kim';
    
-- (12) 북마크한 리스트 중 호텔만 보기 - bookmarkHotel
SELECT *
    FROM HOTEL, BOOKMARK
    WHERE HOTEL.HNAME = BOOKMARK.HNAME
    AND BOOKMARK.MID = 'kim';

SELECT * FROM HOTEL;
SELECT * FROM RESTAURANT;
SELECT * FROM SPOT;
SELECT * FROM MEMBER;
COMMIT;