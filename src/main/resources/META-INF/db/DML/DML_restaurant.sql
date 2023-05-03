------------------------------------------------------
--           restaurant query            
------------------------------------------------------
-- (등록 순) - 기본출력
SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT R.*, NVL(bCnt, 0) bCnt FROM restaurant R, (SELECT RNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY RNAME)B 
    WHERE R.RNAME = B.RNAME(+))A)
    WHERE RN BETWEEN 1 AND 2;
    
-- 식당목록 즐겨찾기 순
SELECT * 
FROM (SELECT ROWNUM RN, A.* FROM (SELECT R.*, NVL(bCnt, 0) bCnt FROM restaurant R, (SELECT RNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY RNAME)B 
WHERE R.RNAME = B.RNAME(+) ORDER BY bCnt DESC)A)
WHERE RN BETWEEN 1 AND 2;

-- 이름검색
SELECT * 
        FROM (SELECT ROWNUM RN, A.* FROM (SELECT R.*, NVL(bCnt, 0) bCnt FROM restaurant R, (SELECT RNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY RNAME)B 
        WHERE R.RNAME = B.RNAME(+)  AND R.RNAME LIKE '%' || '카페' || '%' ORDER BY bCnt DESC)A)
        WHERE RN BETWEEN 1 AND 5;

-- 음식종류, 이름검색
SELECT * 
	 FROM (SELECT ROWNUM RN, A.* FROM (SELECT R.*, NVL(bCnt, 0) bCnt FROM restaurant R, (SELECT RNAME, COUNT(*) bCnt FROM BOOKMARK GROUP BY RNAME)B 
	 WHERE R.RNAME = B.RNAME(+) AND RESTAURANTTYPENO = '3' AND R.RNAME LIKE '%' || '제주' || '%' ORDER BY bCnt DESC)A)
     WHERE RN BETWEEN 1 AND 2;
-- 식당목록 카페
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM  RESTAURANT WHERE RestauranTtypeNo LIKE '%'||'5'||'%' ORDER BY RNAME DESC) A) 
    WHERE RN BETWEEN 1 AND 10;
    
-- 식당목록 국수
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM  RESTAURANT WHERE RestauranTtypeNo LIKE '%'||'4'||'%' ORDER BY RNAME DESC) A) 
    WHERE RN BETWEEN 1 AND 10;
    
-- 식당목록 고기
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM  RESTAURANT WHERE RestauranTtypeNo LIKE '%'||'1'||'%' ORDER BY RNAME DESC) A) 
    WHERE RN BETWEEN 1 AND 10;
    
-- 식당목록 해산물
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM  RESTAURANT WHERE RestauranTtypeNo LIKE '%'||'2'||'%' ORDER BY RNAME DESC) A) 
    WHERE RN BETWEEN 1 AND 10;
    
-- 식당목록 분식
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM  RESTAURANT WHERE RestauranTtypeNo LIKE '%'||'3'||'%' ORDER BY RNAME DESC) A) 
    WHERE RN BETWEEN 1 AND 10;

-- (2) 등록된 식당 갯수
SELECT COUNT(*) FROM RESTAURANT; -- 전체
SELECT COUNT(*) FROM RESTAURANT WHERE RNAME LIKE '%'||'올래'||'%'; -- 이름검색
SELECT COUNT(*) FROM RESTAURANT WHERE LOCATIONNO = '2'; -- 지역검색
SELECT COUNT(*) FROM RESTAURANT WHERE RestauranTtypeNo = '1'; -- 종류검색
SELECT COUNT(*) FROM RESTAURANT WHERE RNAME -- 이름 및 지역
    LIKE '%'|| '가시' ||'%' AND LOCATIONNO = '5';
SELECT COUNT(*) FROM RESTAURANT WHERE RNAME -- 이름 및 종류
    LIKE '%'|| '가시' ||'%' AND RestauranTtypeNo = '4';

-- (3) 식당등록
INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo,RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('올래국수', 'guk', 1, 4, '제주특별자치도 제주시 귀아랑길 24 (연동)', '064-742-7355', 'LINK', 
    '너 올래 안올래? 올래국수!', '해물국수',
            'main.img', 'sub1.img', 'sub2.img', 'sub3.img',  33.49710002092335, 126.5089619090469, '국수 7000원 부터');
            
-- (4) 등록된 식당 수정
UPDATE RESTAURANT SET RNAME = '제주김만복2',
    BID = '수정',
    LOCATIONNO = 2,
    RestauranTtypeNo = 1,
    RADDR = '수정 주소',
    RTEL = '수정 전화',
    RLINK = '수정 링크',
    RINFO = '수정 인포',
    RMENU = '수정 메뉴',
    RMAINIMG = '수정 메인',
    RSUBIMG_1 = '수정 서브1',
    RSUBIMG_2 = '수정 서브2',
    RSUBIMG_3 = '수정 서브3',
    RLATITUDE = 1212,
    RLONGITUDE = 1414,
    RPRICE = '수정된 만복이예유'
WHERE RNAME = '올래국수1';

select * from spot;
SELECT * FROM location;
SELECT * FROM restaurant;

-- (5) 등록된 식당 삭제
DELETE FROM RESTAURANT WHERE RNAME = '올래국수1';

-- (6) 상세보기 
SELECT * FROM RESTAURANT WHERE RNAME = '올래국수';

-- (7) 숙소 등록 승인 여부                 
    -- 관리자가 숙소 등록 승인
UPDATE RESTAURANT SET requestStatus = 'A';
    -- 관리자가 숙소 등록 거절
UPDATE RESTAURANT SET requestStatus = 'R';


SELECT * FROM location;
SELECT * FROM restaurant;
SELECT * FROM RestauranTtype;
commit;
------------------------------------------------------
--           restaurantComment query            
------------------------------------------------------
-- (1) 댓글 전체출력
SELECT A. *,
    (SELECT MNAME FROM MEMBER WHERE A.MID=MID) MNAME,
    (SELECT BNAME FROM BUSINESS WHERE A.BID=BID) BNAME
        FROM (SELECT ROWNUM RN, B.*
            FROM (SELECT * FROM RESTAURANTCOMMENT ORDER BY RGROUP DESC, RSTEP) B) A
    WHERE RN BETWEEN 1 AND 30;
 
-- (2) 댓글갯수 
SELECT COUNT(*) FROM RESTAURANTCOMMENT;

-- (3) 댓글쓰기 (멤버)
insert into restaurantComment (rCommentNo, rName, mId, bID, RContent, RGroup, RStep, RIndent) -- 원 댓글
    values (rCommentNo_seq.nextval, '올래국수', 'pham', null, '대퓨님 너무 맛있어요.', rCommentNo_seq.CURRVAL, 0, 0);

-- (4) 글번호로 전체 내용 가져오기
SELECT * FROM RESTAURANTCOMMENT WHERE RCOMMENTNO = '1';

-- (5) 댓글 수정
UPDATE RESTAURANTCOMMENT SET
    RContent = '수정된 내용'
    WHERE RNAME = '올래국수' AND MID = 'pham';

-- (6)댓글 삭제
DELETE FROM RESTAURANTCOMMENT 
    WHERE RCOMMENTNO = 1 AND (MID = (SELECT MID FROM RESTAURANTCOMMENT WHERE RCOMMENTNO = 1)
    OR BID = (SELECT BID FROM RESTAURANTCOMMENT WHERE RCOMMENTNO = 1));

-- (7) 대댓글 쓰기 전 단계
UPDATE RESTAURANTCOMMENT 
    SET RSTEP = RSTEP + 1
    WHERE RGROUP = 3 AND RSTEP > 0;

-- (8) 대댓글 쓰기(업체)
INSERT INTO restaurantComment (rCommentNo, rName, mId, bID, RContent, RGroup, RStep, RIndent)
    VALUES (rCommentNo_seq.nextval, '올래국수', null, 'guk', '다음에 또 방문 해주세요^^.', 3, 1, 1);


COMMIT;