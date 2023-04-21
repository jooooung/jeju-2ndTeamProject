------------------------------------------------------
--           Festival query            
------------------------------------------------------
-- (1) 글 목록 (startRow ~ endRow까지) - festivalList
SELECT * 
    FROM (SELECT ROWNUM RN, A.*
        FROM (SELECT N.* FROM FESTIVAL N, ADMIN A  WHERE N.AID = A.AID ORDER BY festivalNo DESC) A)
    WHERE RN BETWEEN 1 AND 10;

-- (2) 글 갯수 - totCntFestival
SELECT COUNT(*) FROM FESTIVAL;

-- (3) 글등록 (원글) - writeFestival
INSERT INTO FESTIVAL (FESTIVALNO, aID, FTITLE, FCONTENT)
    VALUES (festivalNo_seq.NEXTVAL, 'admin', '오늘의 축제정보', '일단 와보쇼');

-- (4) festivalNo(글번호)로 DTO 가져오기 (상세보기, 수정VIEW) - contentFestival
SELECT F.*, ANAME FROM FESTIVAL F, ADMIN A WHERE F.AID=A.AID AND FESTIVALNO = 1;

-- (5) 글수정 - modifiyFestival
UPDATE FESTIVAL SET 
        FTITLE ='수정제목1',
        FCONTENT ='수정내용2',
        FRDATE = SYSDATE
    WHERE FESTIVALNO = 2;
    
-- (4) hit(조회수) 1회 올리기 - hitupFestival
UPDATE FESTIVAL SET FHIT = FHIT + 1 WHERE FESTIVALNO = 2;    
    
-- (7) 글 삭제하기(festivalNo로) - deleteFestival
DELETE FROM FESTIVAL WHERE FESTIVALNO = 1;    
    
SELECT * FROM festival;
COMMIT;