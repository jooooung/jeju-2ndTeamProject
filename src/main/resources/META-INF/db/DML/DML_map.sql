--------------------------------
-------------- MAP -------------
--------------------------------

-- 1. 지도에 리스트 출력 (페이징)
    -- 관광지
SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT S.*, NVL(bCnt, 0) bCnt FROM SPOT S, (SELECT SNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY SNAME)B 
        WHERE S.SNAME = B.SNAME(+))A)
WHERE RN BETWEEN 1 AND 3;
    -- 음식점
SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT R.*, NVL(bCnt, 0) bCnt FROM RESTAURANT R, (SELECT RNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY RNAME)B 
        WHERE R.RNAME = B.RNAME(+) ORDER BY bCnt DESC)A)
WHERE RN BETWEEN 1 AND 3;
    -- 호텔
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
        FROM (SELECT H.*, NVL(bCnt, 0) bCnt 
                FROM HOTEL H, (SELECT HNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY HNAME) B 
             WHERE H.HNAME = B.HNAME(+) ORDER BY bCnt DESC) A)
    WHERE RN BETWEEN 1 AND 3;
    
-- 2. 지도 이름 검색
    -- 관광지
SELECT * FROM SPOT WHERE SNAME LIKE '%' || '협재' || '%';
    -- 음식점
SELECT * FROM RESTAURANT WHERE RNAME LIKE '%' || '올래' || '%';
    -- 호텔
SELECT * FROM HOTEL WHERE HNAME LIKE '%' || '위드' || '%';

-- 3. 지역 클릭시 리스트 출력
    -- 관광지
SELECT S.*, LNAME FROM SPOT S, LOCATION L WHERE LNAME = '서귀포시' AND S.LOCATIONNO = L.LOCATIONNO;
    -- 음식점
SELECT R.*, LNAME FROM RESTAURANT R, LOCATION L WHERE LNAME =  '제주시' AND R.LOCATIONNO = L.LOCATIONNO;
    -- 호텔
SELECT H.*, LNAME FROM HOTEL H, LOCATION L WHERE LNAME =  '제주시' AND H.LOCATIONNO = L.LOCATIONNO;

-- 4. 마커 클릭 시 상세보기
    -- 관광지
SELECT (SELECT COUNT(*) FROM BOOKMARK WHERE SNAME = '한라산국립공원') bCnt, S.*
    FROM SPOT S WHERE SNAME = '한라산국립공원';
    -- 음식점
SELECT (SELECT COUNT(*) FROM BOOKMARK WHERE RNAME = '올래국수') bCnt, R.*
    FROM RESTAURANT R WHERE RNAME = '올래국수';
    -- 호텔
SELECT (SELECT COUNT(*) FROM BOOKMARK WHERE HNAME = '호텔더원') bCnt, H.*
    FROM HOTEL H WHERE HNAME = '호텔더원';

select * from  hotel;
select * from restaurant;

-- 5. 지도에 마커 추가
    -- 관광지
SELECT S.*, NVL(bCnt, 0) bCnt 
    FROM SPOT S, (SELECT SNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY SNAME)B 
WHERE S.SNAME = B.SNAME(+);
    -- 음식점
SELECT R.*, NVL(bCnt, 0) bCnt 
    FROM RESTAURANT R, (SELECT RNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY RNAME)B 
WHERE R.RNAME = B.RNAME(+);
    -- 호텔
SELECT H.*, NVL(bCnt, 0) bCnt 
    FROM HOTEL H, (SELECT HNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY HNAME)B 
WHERE H.HNAME = B.HNAME(+);

