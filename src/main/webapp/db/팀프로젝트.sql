-- ★★★★★★★ 관리자 ★★★★★★★ --
-- 1. 관리자 등록
INSERT INTO Admin (aId, aPw, aName)
    VALUES ('jejuKing', 'island', '감귤');

select * from admin;

-- 2. 승인 요청 리스트
-- Hotel 승인 요청 목록
SELECT hName, bId, requestStatus
    FROM Hotel
    WHERE requestStatus = 'P';

-- Restaurant 승인 요청 목록
SELECT rName, bId, requestStatus
    FROM Restaurant
    WHERE requestStatus = 'P';

-- 3. 업체 등록 승인
-- Hotel 승인
UPDATE Hotel
    SET requestStatus = 'A'
    WHERE hName = '호텔';

-- Restaurant 승인
UPDATE Restaurant
    SET requestStatus = 'A'
    WHERE rName = '제주김만복';
    
-- 4. 업체 등록 거절
-- Hotel 거절
UPDATE Hotel
    SET requestStatus = 'R'
    WHERE hName = '호텔';

-- Restaurant 거절
UPDATE Restaurant
    SET requestStatus = 'R'
    WHERE rName = '식당';
-- 5. 업체 등록 승인 현황
-- Hotel 승인 현황
SELECT hName, requestStatus
    FROM Hotel
    WHERE requestStatus = 'A';

-- Restaurant 승인 현황
SELECT rName, requestStatus
    FROM Restaurant
    WHERE requestStatus = 'A';
    
-- 6. 업체 등록 거절 현황
-- Hotel 거절 현황
SELECT hName, requestStatus
    FROM Hotel
    WHERE requestStatus = 'R';

-- Restaurant 거절 현황
SELECT rName, requestStatus
    FROM Restaurant
    WHERE requestStatus = 'R';

-- 7. 게시글 삭제 
-- For Festival posts:
DELETE FROM Festival
    WHERE festivalNo = '1';

-- For Review posts:
DELETE FROM Review
    WHERE reviewNo = '1';

-- 8. 댓글 삭제
-- For hotelComment:
DELETE FROM hotelComment
    WHERE hCommentNo = '1';

-- For restaurantComment:
DELETE FROM restaurantComment
    WHERE rCommentNo = '1';

-- For spotComment:
DELETE FROM spotComment
    WHERE sCommentNo = '1';

-- ★★★★★★★ 업체 ★★★★★★★ --
-- 1. 업체 회원가입
INSERT INTO Business (bId, bPw, bName, bEmail)
    VALUES ('bid', 'bpw', 'bname', 'business@naver.com');

INSERT INTO Business (bId, bPw, bName, bEmail)
    VALUES ('id', 'password', 'Business Name', 'business@example.com');

-- 2. 업체 정보수정
UPDATE Business
    SET bPw = 'bpw', bName = 'bname', bEmail = 'update@naver.com'
    WHERE bId = 'bid';

-- 3. 업체 등록요청 (등록글 작성)
-- Hotel 등록
INSERT INTO Hotel (hName, bId, locationNo, hAddr, hTel, hLink, hInfo, inTime, outTime, inDate, outDate, hMainImg, hSubImg_1, hSubImg_2, hSubImg_3, hLatitude, hLongitude, hPrice, requestStatus)
    VALUES ('호텔', 'bid', (SELECT locationNo FROM (SELECT * FROM location WHERE lName = '제주시') WHERE ROWNUM = 1), '제주', '010-1234-1324', 'www.naver.com', '정보', '14:00', '11:00', TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-03', 'YYYY-MM-DD'), 'main.jpg', 'sub_img_1', 'sub_img_2', 'sub_img_3', 50.5, 50.5, '40,000', 'P');
-- Restaurant 등록
INSERT INTO Restaurant (rName, bId, locationNo, rAddr, rTel, rLink, rInfo, rMenu, rMainImg, rSubImg_1, rSubImg_2, rSubImg_3, rLatitude, rLongitude, rPrice, requestStatus)
SELECT '식당', 'bid', locationNo, '제주', '02-1234-1234', 'www.naver.com', '정보', '올래국수', 'main_img.jpg', 'sub_img_1', 'sub_img_2', 'sub_img_3', 50.5, 50.5, '40,000', 'P'
    FROM location
    WHERE lName = '제주시' AND ROWNUM = 1;
    
-- 4. 업체 등록요청 (등록글 수정)
-- Hotel 수정
UPDATE Hotel
SET hName = '호텔', locationNo = (SELECT locationNo FROM location WHERE lName = '제주시' AND ROWNUM = 1), hAddr = '제주시', hTel = '010-1234-1324', hLink = 'www.naver.com', hInfo = '정보', inTime = '14:00', outTime = '11:00', inDate = TO_DATE('2023-05-01', 'YYYY-MM-DD'), outDate = TO_DATE('2023-05-04', 'YYYY-MM-DD'),
        hMainImg = 'new_main.jpg', hSubImg_1 = 'new_sub_img_1', hSubImg_2 = 'new_sub_img_2', hSubImg_3 = 'new_sub_img_3', hLatitude = 50.5, hLongitude = 50.5, hPrice = '50,000'
WHERE bId = 'bid';

-- Restaurant 수정
UPDATE Restaurant
SET rName = '식당', locationNo = (SELECT locationNo FROM location WHERE lName = '제주시' AND ROWNUM = 1), rAddr = '제주시', rTel = '02-1234-1234', rLink = 'www.naver.com', rInfo = '정보', rMenu = '국수', rMainImg = 'main_img.jpg', rSubImg_1 = 'new_sub_img_1', rSubImg_2 = 'new_sub_img_2', rSubImg_3 = 'new_sub_img_3', rLatitude = 50.5, rLongitude = 50.5, rPrice = '50,000'
    WHERE bId = 'bid';

-- 5. 업체 등록요청 (등록글 삭제)
-- Hotel 삭제
DELETE FROM Hotel
    WHERE hName = '호텔';

-- Restaurant 삭제
DELETE FROM Restaurant
    WHERE rName = '식당';

-- 6. 업체 마이페이지 (나의 글)
SELECT *
    FROM Hotel
    WHERE bId = 'bid';

SELECT *
    FROM Restaurant
    WHERE bId = 'bid';

-- 7. 업체 마이페이지 (나의 댓글)
-- My comments in the hotelComment table
SELECT *
    FROM hotelComment
    WHERE bId = 'bid';

-- My comments in the restaurantComment table
SELECT *
    FROM restaurantComment
    WHERE bId = 'bid';

-- 8. 업체 마이페이지 (업체 등록 승인 여부 확인)
-- Hotel 등록 승인 여부 확인
SELECT hName, requestStatus
    FROM Hotel
    WHERE hName = '호텔';

-- Restaurant 등록 승인 여부 확인
SELECT rName, requestStatus
    FROM Restaurant
    WHERE rName = '식당';

-- 9. 업체 탈퇴
DELETE FROM Business
    WHERE bId = 'bid';

-- ★★★★★★★ 일정 ★★★★★★★ --
-- 1. 일정 생성
INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent, hName, rName, sName)
    VALUES (scheduleNo_seq.NEXTVAL, 'aaa', '제주여행', TO_TIMESTAMP('2023-05-01 10:00:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-05-03 20:00:00','YYYY-MM-DD HH24:MI:SS'), '제주에서의 즐거운 여행', '호텔더원', '제주김만복', '한라산국립공원');
-- 2. 일정 조회
SELECT * FROM Schedule
    WHERE mId = 'aaa';

-- 3. 특정 일정 조회
SELECT * FROM Schedule
    WHERE scheduleNo = 8;

-- 4. 일정 수정
UPDATE Schedule
    SET hName = '위드시티호텔', rName = '제주김만복', sName = '한라산국립공원', scheduleTitle = '제주 여행', startDate = TO_TIMESTAMP('2023-05-02 00:00:00','YYYY-MM-DD HH24:MI:SS'), endDate = TO_TIMESTAMP('2023-05-05 00:00:00','YYYY-MM-DD HH24:MI:SS'), ScheduleContent = 'aa'
    WHERE mId = 'aaa' AND scheduleNo = 8;

-- 5. 일정 삭제
DELETE FROM Schedule
    WHERE scheduleNo = 1;

-- 6. 회원별 일정 목록 조회
SELECT scheduleNo, scheduleTitle, startDate, endDate
    FROM Schedule
    WHERE mId = 'aaa'
    ORDER BY startDate;

-- 7. 기간별 일정 검색
SELECT * FROM Schedule
    WHERE mId = 'aaa' AND startDate >= TO_TIMESTAMP('2023-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') AND endDate <= TO_TIMESTAMP('2023-05-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS');

-- 8. 일정명으로 검색
SELECT * FROM Schedule
    WHERE mId = 'aaa' AND LOWER(scheduleTitle) LIKE LOWER('%제주여행%');