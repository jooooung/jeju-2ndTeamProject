------------------- HOTEL ---------------
-- 숙소 목록 (즐겨찾기 많은 순) hotelList
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
        FROM (SELECT H.*, NVL(bCnt, 0) bCnt 
                FROM HOTEL H, (SELECT HNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY HNAME) B 
             WHERE H.HNAME = B.HNAME(+) ORDER BY bCnt DESC) A)
    WHERE RN BETWEEN 1 AND 3;
    -- schHName이 존재할 때(검색기능)
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
        FROM (SELECT H.*, NVL(bCnt, 0) bCnt 
                FROM HOTEL H, (SELECT HNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY HNAME) B 
             WHERE H.HNAME = B.HNAME(+) AND H.HNAME LIKE '%'||'호텔더원'||'%' ORDER BY bCnt DESC) A)
    WHERE RN BETWEEN 1 AND 3;

-- 지역별 숙소 목록(즐겨찾기 많은 순)
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
        FROM (SELECT H.*, NVL(bCnt, 0) bCnt 
                FROM HOTEL H, (SELECT HNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY HNAME) B 
             WHERE H.HNAME = B.HNAME(+) AND HADDR LIKE '%'||'제주시'||'%' ORDER BY bCnt DESC) A)
    WHERE RN BETWEEN 1 AND 3;
    -- 지역별 목록 schHName 이 존재(지역별 검색 기능)
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
        FROM (SELECT H.*, NVL(bCnt, 0) bCnt 
                FROM HOTEL H, (SELECT HNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY HNAME) B 
                WHERE H.HNAME = B.HNAME(+) AND LOCATIONNO = 1
                    AND H.HNAME LIKE '%'||'더원'||'%' ORDER BY bCnt DESC) A)
    WHERE RN BETWEEN 1 AND 3;
    
    
-- 숙소 개수 totCntHotel
SELECT COUNT(*) FROM HOTEL;

-- 숙소 상세보기 detailHotel
SELECT (SELECT COUNT(*) FROM BOOKMARK WHERE HNAME = '호텔더원') bCnt, H.*
    FROM HOTEL H WHERE HNAME = '호텔더원';


-- 숙소 등록 registerHotel
INSERT INTO HOTEL (HNAME, BID, LOCATIONNO, HADDR, HTEL, HLINK, HINFO, INTIME, OUTTIME, HMAINIMG, HSUBIMG_1, HSUBIMG_2, HSUBIMG_3, HLATITUDE, HLONGITUDE, HPRICE, requestStatus)
              VALUES ('위드시티호텔', 'withCITY', (SELECT locationNo FROM (SELECT * FROM location WHERE lName = '제주시')), '제주특별자치도 제주시 노연로 34', '064-902-3275', 'http://www.withcityhotel.com/', '호텔위드시티는 공항에서 10분거리에 있으며 주변에 다양한 맛집이 있습니다.', '15:00', '11:00', 'sample.jpg', NULL, NULL, NULL, '33.48582927685537', '126.48379663399649', 80000, 'A');
              
-- 숙소 수정 modifyHotel
UPDATE HOTEL SET LOCATIONNO = '1',
                 HADDR = '제주특별자치도 제주시 노연로 34',
                 HTEL = '064-902-3275',
                 HLINK = 'http://www.withcityhotel.com/',
                 HINFO = '호텔위드시티는 공항에서 10분거리에 있으며 주변에 다양한 맛집이 있습니다.',
                 INTIME = '15:00',
                 OUTTIME = '11:00',
                 HMAINIMG = 'sample.jpg', 
                 HSUBIMG_1 = NULL, 
                 HSUBIMG_2 = NULL, 
                 HSUBIMG_3 = NULL, 
                 HLATITUDE = '33.48582927685537', 
                 HLONGITUDE = '126.48379663399649', 
                 HPRICE = 80000
        WHERE HNAME = '위드시티호텔';

-- 숙소 등록 승인 여부                 
    -- 관리자가 숙소 등록 승인 hrequest
UPDATE HOTEL SET requestStatus = 'A';
    -- 관리자가 숙소 등록 거절
UPDATE HOTEL SET requestStatus = 'R';

------------------------ HRESERVATION ------------------------
-- 호텔 별 예약 목록
SELECT * 
    FROM (SELECT R.MID, R.HNAME, INDATE, OUTDATE, HPRICE, (H.HPRICE * (OUTDATE - INDATE)) PRICE FROM HRESERVATION R, HOTEL H 
            WHERE H.HNAME = R.HNAME AND MID = 'bbb')
    WHERE HNAME = '그라벨호텔';

-- ID 별 예약 목록
SELECT R.HNAME, R.INDATE, R.OUTDATE, H.HPRICE, (H.HPRICE * (OUTDATE - INDATE)) PRICE 
    FROM HRESERVATION R, HOTEL H 
    WHERE H.HNAME = R.HNAME AND MID = 'bbb';

-- 예약 취소    (같은 호텔의 예약이 여러개일 경우 입실일 기준으로 삭제)
DELETE FROM HRESERVATION WHERE MID = 'aaa' AND HNAME = '위드시티호텔' AND INDATE = '23/04/20';


------------------------ HOTELCOMMENT ------------------------
-- 한줄평 목록 페이징
SELECT * 
    FROM (SELECT H.*, ROWNUM RN 
        FROM (SELECT * FROM HOTELCOMMENT WHERE HNAME = '호텔더원' ORDER BY HGROUP DESC, HSTEP) H)
    WHERE RN BETWEEN 1 AND 10;


-- 한줄평 개수
SELECT COUNT(*) FROM HOTELCOMMENT WHERE HNAME = '그라벨호텔';

-- 한줄평 달기
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '호텔더원', 'aaa', NULL, '좋아요', hCommentNo_seq.CURRVAL, 0, 0, SYSDATE);
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '호텔더원', 'kim', NULL, '깨끗 좋아요', hCommentNo_seq.CURRVAL, 0, 0, SYSDATE);    
    
    
-- 답글 달기 전 작업
UPDATE HOTELCOMMENT SET HSTEP = HSTEP + 1
    WHERE HGROUP = 1 AND HSTEP > 2;


-- 답글 달기
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '호텔더원', NULL, 'theOne', '별 말씀을요', 1, 3, 3, SYSDATE);

    
-- 한줄평 수정
UPDATE HOTELCOMMENT SET HCONTENT = '깨끗하고 좋아요' WHERE HNAME = '호텔더원' AND MID = 'aaa';

-- 한줄평 삭제
DELETE FROM HOTELCOMMENT WHERE HCOMMENTNO = 1 AND (MID = (SELECT MID FROM HOTELCOMMENT WHERE HCOMMENTNO = 1) OR BID = (SELECT BID FROM HOTELCOMMENT WHERE HCOMMENTNO = 1));

ROLLBACK;