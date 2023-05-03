------------------- HOTEL ---------------
-- 숙소 목록 (즐겨찾기 많은 순) hotelList  (승인된 업체만)
    -- 전체목록
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
        FROM (SELECT H.*, NVL(bCnt, 0) bCnt, lName 
                FROM HOTEL H, LOCATION L, (SELECT HNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY HNAME) B 
                WHERE H.HNAME = B.HNAME(+) AND H.LOCATIONNO = L.LOCATIONNO AND REQUESTSTATUS = 'A' 
                 AND H.HNAME LIKE '%'||''||'%' ORDER BY bCnt DESC) A)
    WHERE RN BETWEEN 1 AND 10;
    -- 지역 미선택
SELECT *    
    FROM (SELECT ROWNUM RN, A.* 
        FROM (SELECT H.*, NVL(bCnt, 0) bCnt, lName
                FROM HOTEL H, LOCATION L, (SELECT HNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY HNAME) B 
                    WHERE H.HNAME = B.HNAME(+) AND H.LOCATIONNO = L.LOCATIONNO 
                    AND REQUESTSTATUS = 'A' AND H.HNAME LIKE '%'||'호텔더원'||'%' ORDER BY bCnt DESC) A)
    WHERE RN BETWEEN 1 AND 3;
select * from location;

    -- 지역선택
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
        FROM (SELECT H.*, NVL(bCnt, 0) bCnt, lName
                FROM HOTEL H, LOCATION L, (SELECT HNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY HNAME) B 
                WHERE H.HNAME = B.HNAME(+) AND H.LOCATIONNO = L.LOCATIONNO 
                    AND REQUESTSTATUS = 'A' AND H.LOCATIONNO IN (11, 12, 15)
                    AND H.HNAME LIKE '%'||''||'%'  ORDER BY bCnt DESC) A)
    WHERE RN BETWEEN 1 AND 5;
    
    
-- 숙소 개수 totCntHotel
    -- 지역 미선택
SELECT COUNT(*) FROM HOTEL WHERE HNAME LIKE '%'||'더원'||'%';
    -- 지역 선택
SELECT COUNT(*) FROM HOTEL WHERE HNAME LIKE '%'||'더원'||'%' AND LOCATIONNO =ANY (1, 3, 13);

-- 숙소 상세보기 detailHotel
SELECT (SELECT COUNT(*) FROM BOOKMARK WHERE HNAME = '호텔더원') bCnt, lName, H.*
    FROM HOTEL H, LOCATION L WHERE H.LOCATIONNO = L.LOCATIONNO 
    AND HNAME = '호텔더원';


-- 숙소 등록 registerHotel
INSERT INTO HOTEL (HNAME, BID, LOCATIONNO, HADDR, HTEL, HLINK, HINFO, INTIME, OUTTIME, 
                    HMAINIMG, HSUBIMG_1, HSUBIMG_2, HSUBIMG_3, HLATITUDE, HLONGITUDE, HPRICE)
              VALUES ('위드시티호텔', 'withCITY', 
                     (SELECT locationNo FROM (SELECT * FROM location WHERE lName = '제주시')), 
                     '제주특별자치도 제주시 노연로 34', '064-902-3275', 'http://www.withcityhotel.com/', 
                     '호텔위드시티는 공항에서 10분거리에 있으며 주변에 다양한 맛집이 있습니다.', '15:00', '11:00', 
                     'sample.jpg', NULL, NULL, NULL, '33.48582927685537', '126.48379663399649', 80000);
              
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
UPDATE HOTEL SET requestStatus = 'A' WHERE HNAME = '호텔더원';
    -- 관리자가 숙소 등록 거절
UPDATE HOTEL SET requestStatus = 'R' WHERE HNAME = 'DUMMY';

-- 숙소 삭제 deleteHotel
DELETE FROM HOTEL WHERE HNAME = '삭제';

------------------------ HRESERVATION ------------------------
-- 예약하기 doHreservation
INSERT INTO HRESERVATION (mID, hNAME, INDATE, OUTDATE)
    VALUES ('ccc', '그라벨호텔', '23/05/01', '23/05/03');
    
-- 예약 가능 날짜 조회  
SELECT INDATE, OUTDATE FROM HRESERVATION
    WHERE ((INDATE <= '23/05/11' AND OUTDATE >= '23/05/15')     -- 선택이 기존 예약 내역 내 
        OR (INDATE <= '23/05/11' AND OUTDATE >= '23/05/18')     -- 선택 입실일이 기존 예약 내역 내 
        OR (INDATE <= '23/05/08' AND OUTDATE >= '23/05/15')     -- 선택 퇴실일이 기존 예약 내역 내 
        OR (INDATE <= '23/05/08' AND OUTDATE >= '23/05/18'))    -- 선택이 기존 예약 내역을 감싸는 
     AND HNAME = '그라벨호텔';
-- 결과가 1이상이면 예약 불가 

-- 호텔 별 예약 목록
SELECT * 
    FROM (SELECT R.MID, R.HNAME, INDATE, OUTDATE FROM HRESERVATION R, HOTEL H 
            WHERE H.HNAME = R.HNAME ORDER BY INDATE DESC)
    WHERE HNAME = '그라벨호텔';
    DELETE FROM HRESERVATION WHERE INDATE = '230523';
    COMMIT;

-- ID 별 예약 목록
SELECT HNAME, INDATE, OUTDATE FROM HRESERVATION WHERE MID = 'aaa' ORDER BY INDATE DESC;
SELECT H.*, R.* FROM HRESERVATION R, HOTEL H 
    WHERE H.HNAME = R.HNAME AND MID = 'bbb' ORDER BY INDATE DESC;
    
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
UPDATE HOTELCOMMENT SET HCONTENT = '깨끗하고 좋아요' WHERE HCOMMENTNO = 1;

-- 한줄평 삭제
DELETE FROM HOTELCOMMENT WHERE HCOMMENTNO = 1;

ROLLBACK;