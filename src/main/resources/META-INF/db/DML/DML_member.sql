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
SELECT * FROM restaurantComment WHERE mID = 'pham'; -- getrsComment
SELECT * FROM hotelComment WHERE mID = 'kang'; -- gethotelComment
SELECT * FROM spotComment WHERE mID = 'kang'; -- getsoptComment

-- (10) 북마크한 리스트 전체 보기
SELECT * FROM BOOKMARK WHERE mID = 'kim' ORDER BY BOOKMARK_NO DESC;

-- (11) 북마크한 리스트 중 식당만 보기
SELECT * FROM BOOKMARK WHERE MID = 'kim' AND;


SELECT * 
    FROM MEMBER M, BOOKMARK B
    WHERE M.MID=B.MID(+);



SELECT * FROM MEMBER;
COMMIT;