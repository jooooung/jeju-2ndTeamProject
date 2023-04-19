------------------------------------------------------
--           MEMBER query            
------------------------------------------------------
-- (1) 회원 ID 중복체크
SELECT * FROM MEMBER WHERE MID='kang';

-- (2) 회원 이메일 중복체크
SELECT * FROM MEMBER WHERE mEMAIL = 'kang@naver.com';

-- (3) 회원가입
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mADDR, mPOST, MBIRTH, MPHOTO)
    VALUES ('kang', '123', '강성빈', 'kang@NN.COM', '서울시 강서구', '12345', '1994-08-25','NOIMG.JPG');

-- (4) 로그인
SELECT * FROM MEMBER WHERE mID='kang' AND mPW='123';

-- (5) mID로 DTO 가져오기 (로그인 성공시 session에 넣기위한 용도)
SELECT * FROM MEMBER WHERE mID='aaa';

-- (6) 회원정보 수정
UPDATE MEMBER SET 
        mPW = '123',
        mNAME = '수정용',
        mEMAIL = 'su@ss@.com',
        mADDR = '서울시 강남구',
        mPOST = '789456',
        mBIRTH = '1984-10-12',
        mPHOTO = 'NOIMG.JPG'
    WHERE mID = 'kang';

-- (7) 회원탈퇴
DELETE FROM MEMBER WHERE mID = 'kang';

-- (8) 작성한 글 보기
SELECT * FROM Review WHERE mID = 'kim';

-- (9) 작성한 댓글 보기
SELECT * FROM restaurantComment WHERE mID = 'kim';
SELECT * FROM hotelComment WHERE mID = 'kang';
SELECT * FROM spotComment WHERE mID = 'kang';

-- (10) 북마크한 리스트 보기
SELECT * FROM BOOKMARK WHERE mID = 'kang';

SELECT * FROM MEMBER;
COMMIT;