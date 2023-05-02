------------------------------------------------------
--           MEMBER query            
------------------------------------------------------
-- (1) 회원 ID 중복체크 - idConfirm
SELECT COUNT(*) FROM MEMBER WHERE MID = 'kang';

-- (2) 회원 이메일 중복체크 - emailConfirm
SELECT COUNT(*) FROM MEMBER WHERE mEMAIL = 'kang@Naver.com';

-- (3) 회원가입 - joinMember
insert into member (mId, mPw, mName, mTel, mEmail, mAddr, mDeAddr, mPost, mBirth, mphoto, mrDate)
    VALUES ('kang', '123', '강성빈',  '010-5555-4343', 'kang@naver.com', '서울시 강서구', '미주아파트', '12345', '1994-08-25','kang.png', SYSDATE);

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

-- (10) 아이디 찾기
SELECT MID FROM MEMBER
    WHERE MEMAIL = 'dnvk3535@naver.com';

-- (11) 비밀번호 찾기 
SELECT MPW FROM MEMBER
    WHERE MID = 'kang' and MEMAIL = 'dnvk3535@naver.com'; 
-- (12) 비번 업데이트
UPDATE MEMBER SET MPW = '123' WHERE MID ='kang';

delete from member where mid ='sungbin2';

SELECT * FROM MEMBER;
COMMIT;