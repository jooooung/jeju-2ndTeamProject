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
INSERT INTO Hotel (hName, bId, locationNo, hAddr, hTel, hLink, hInfo, inTime, outTime, hMainImg, hSubImg_1, hSubImg_2, hSubImg_3, hLatitude, hLongitude, hPrice, requestStatus)
    VALUES ('호텔', 'bid', (SELECT locationNo FROM (SELECT * FROM location WHERE lName = '제주시') WHERE ROWNUM = 1), '제주', '010-1234-1324', 'www.naver.com', '정보', '14:00', '11:00', 'main.jpg', 'sub_img_1', 'sub_img_2', 'sub_img_3', 50.5, 50.5, 40000, 'P');
-- Restaurant 등록
INSERT INTO Restaurant (rName, bId, locationNo, rAddr, rTel, rLink, rInfo, rMenu, rMainImg, rSubImg_1, rSubImg_2, rSubImg_3, rLatitude, rLongitude, rPrice, requestStatus)
SELECT '식당', 'bid', locationNo, '제주', '02-1234-1234', 'www.naver.com', '정보', '올래국수', 'main_img.jpg', 'sub_img_1', 'sub_img_2', 'sub_img_3', 50.5, 50.5, '40,000', 'P'
    FROM location
    WHERE lName = '제주시' AND ROWNUM = 1;
    
-- 4. 업체 등록요청 (등록글 수정)
-- Hotel 수정
UPDATE Hotel
SET hName = '호텔', locationNo = (SELECT locationNo FROM location WHERE lName = '제주시' AND ROWNUM = 1), hAddr = '제주시', hTel = '010-1234-1324', hLink = 'www.naver.com', hInfo = '정보', inTime = '14:00', outTime = '11:00',
        hMainImg = 'new_main.jpg', hSubImg_1 = 'new_sub_img_1', hSubImg_2 = 'new_sub_img_2', hSubImg_3 = 'new_sub_img_3', hLatitude = 50.5, hLongitude = 50.5, hPrice = 50000
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
