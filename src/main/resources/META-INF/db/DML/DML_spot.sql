--------------------------------
---------- SPOT TABLE ----------
--------------------------------
-- 리스트 출력
-- 1-1. (등록 순) - 기본출력
SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT S.*, NVL(bCnt, 0) bCnt FROM SPOT S, (SELECT SNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY SNAME)B 
        WHERE S.SNAME = B.SNAME(+))A)
WHERE RN BETWEEN 1 AND 3;

-- 1-2. (신규등록 순)
SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT S.*, NVL(bCnt, 0) bCnt FROM SPOT S, (SELECT SNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY SNAME)B 
        WHERE S.SNAME = B.SNAME(+) ORDER BY ROWNUM DESC)A)
WHERE RN BETWEEN 1 AND 3;

-- 1-3. (즐겨찾기 수가 높은 순)
SELECT S.*, NVL(bCnt, 0) bCnt 
    FROM SPOT S, (SELECT SNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY SNAME)B 
WHERE S.SNAME = B.SNAME(+) ORDER BY bCnt DESC;

SELECT ROWNUM RN, A.* FROM (SELECT S.*, bCnt 
    FROM SPOT S, (SELECT SNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY SNAME)B 
WHERE S.SNAME = B.SNAME ORDER BY bCnt DESC)A;

SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT S.*, NVL(bCnt, 0) bCnt FROM SPOT S, (SELECT SNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY SNAME)B 
        WHERE S.SNAME = B.SNAME(+) ORDER BY bCnt DESC)A)
WHERE RN BETWEEN 1 AND 3;

-- 1-4. (가격이 무료인 순)
SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT S.*, NVL(bCnt, 0) bCnt FROM SPOT S, (SELECT SNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY SNAME)B 
        WHERE S.SNAME = B.SNAME(+) AND SPRICE = '무료')A)
WHERE RN BETWEEN 1 AND 3;

-- 2. 관광지 등록
INSERT INTO SPOT (SNAME, AID, LOCATIONNO, SADDR, STEL, SINFO, SMAINIMG, SSUBIMG_1, SLATITUDE, SLONGITUDE, SPRICE) 
    VALUES('협재해수욕장1', 'admin', 1, '제주특별자치도 제주시 한림읍 한림로 329-10', '064-728-3981', '협재 종합상황실: 064-728-3981(해수욕장 개장기간 동안 운영)', '협재해수욕장m.jpg', '협재해수욕장s.jpg', 33.39906165536689, 126.1241478664344, '무료');
    
-- 3. 관광지 삭제
DELETE FROM SPOT WHERE SNAME = '협재해수욕장1';

-- 4. 관광지 수정
UPDATE SPOT SET SNAME = '협재해수욕장_수정',
                LOCATIONNO = 2,
                SADDR = '주소 수정',
                STEL = '010-1111-1111',
                SINFO = '인포 수정',
                SLINK = '링크 수정',
                STIME = '이용시간 수정',
                SMAINIMG = '수정.jpg',
                SSUBIMG_1 = '수정.jpg',
                SSUBIMG_2 = '수정.jpg',
                SSUBIMG_3 = '수정.jpg',
                SLATITUDE = 1111,
                SLONGITUDE = 2222,
                SPRICE = '수정'
    WHERE SNAME = '협재해수욕장1';
    
-- 5. 관광지 상세보기
SELECT * FROM SPOT WHERE SNAME = '협재해수욕장';

--------------------------------
------ SPOTCOMMENT TABLE -------
--------------------------------

-- 1. 관광지 댓글 페이징
SELECT M.*, SCOMMENTNO, SNAME, SCONTENT, SCRDATE FROM MEMBER M, SPOTCOMMENT S WHERE M.MID = S.MID ORDER BY SCRDATE;

SELECT ROWNUM RN, A.* FROM (SELECT M.*, SCOMMENTNO, SNAME, SCONTENT, SCRDATE FROM MEMBER M, SPOTCOMMENT S WHERE M.MID = S.MID ORDER BY SCRDATE)A;

SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT M.*, SCOMMENTNO, SNAME, SCONTENT, SCRDATE FROM MEMBER M, SPOTCOMMENT S WHERE M.MID = S.MID ORDER BY SCRDATE)A)
WHERE RN BETWEEN 1 AND 2;

-- 2. 관광지 댓글 등록
INSERT INTO SPOTCOMMENT (SCOMMENTNO, SNAME, MID, SCONTENT)
    VALUES (SCOMMENTNO_SEQ.NEXTVAL, '성산일출봉(UNESCO 세계자연유산)', 'aaa', '날씨 좋은날 일출 보러가면 너무 예뻐요');

-- 3. 관광지 댓글 삭제
DELETE FROM SPOTCOMMENT WHERE SCOMMENTNO = 4;

-- 4. 관광지 댓글 수정
UPDATE SPOTCOMMENT SET SCONTENT = '이쁩니다' WHERE SCOMMENTNO = 4;