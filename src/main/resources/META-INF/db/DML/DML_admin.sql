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
