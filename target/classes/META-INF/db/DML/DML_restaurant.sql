------------------------------------------------------
--           restaurant query            
------------------------------------------------------
-- (1) 식당목록 (startRow ~ endRow까지) 전체
SELECT * 
    FROM (SELECT ROWNUM RN, A.*
        FROM (SELECT R.* FROM restaurant R, BUSINESS B  WHERE R.BID = B.BID ORDER BY RPRICE DESC) A)
    WHERE RN BETWEEN 1 AND 50;
    
-- 식당목록 즐겨찾기 순
SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT S.*, NVL(bCnt, 0) bCnt FROM restaurant S, (SELECT rName, COUNT(*) bCnt FROM BOOKMARK GROUP BY rName)B 
        WHERE S.rName = B.rName(+) ORDER BY bCnt DESC)A)
WHERE RN BETWEEN 1 AND 3;

-- (2) 등록된 식당 갯수
SELECT COUNT(*) FROM RESTAURANT;

-- (3) 식당등록
INSERT INTO RESTAURANT (RNAME, BID, LOCATIONNO, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('제주김만복', 'su', 1, '제주특별자치도 제주시 오라로 41', '064-759-8582', 'LINK', '매일매일 신선한 재료로 정성스레 만드는 만복이네 김밥입니다!', '만복김밥', 
            'main.img', 'sub1.img', 'sub2.img', 'sub3.img',  33.497066158681676, 126.50894864880289, '세트가 단돈 만원!');
            
-- (4) 등록된 식당 수정
UPDATE RESTAURANT SET
    RNAME = '바뀐식당',
    BID = 'su',
    LOCATIONNO = 1,
    RADDR = '제주특별자치도 제주시 오라로 42',
    RTEL = '064-759-8582',
    RLINK = 'LINK',
    RINFO = '만복이네 바뀌었어유',
    RMENU = '참치김밥',
    RMAINIMG = 'main.jpg',
    RSUBIMG_1 = 'sub1.jpg',
    RSUBIMG_2 = 'sub2.jpg',
    RSUBIMG_3 = 'sub3.jpg',
    RLATITUDE = 33.497066158681676,
    RLONGITUDE = 126.50894864880289,
    RPRICE = '수정하자고'
WHERE RNAME = '제주김만복';

-- (5) 등록된 식당 삭제
DELETE FROM RESTAURANT WHERE RNAME = '바뀐식당';

-- (6) 상세보기 
SELECT * FROM RESTAURANT WHERE RNAME = '올래국수';


------------------------------------------------------
--           restaurantComment query            
------------------------------------------------------
select * from restaurantComment;
SELECT * FROM MEMBER;
SELECT * FROM ADMIN;
SELECT * FROM Business;

-- (1) 댓글 전체출력
SELECT A. *,
    (SELECT MNAME FROM MEMBER WHERE A.MID=MID) MNAME,
    (SELECT BNAME FROM BUSINESS WHERE A.BID=BID) BNAME
        FROM (SELECT ROWNUM RN, B.*
            FROM (SELECT * FROM RESTAURANTCOMMENT ORDER BY RCRDATE) B) A
    WHERE RN BETWEEN 1 AND 30;

-- (2) 댓글갯수 
SELECT COUNT(*) FROM RESTAURANTCOMMENT;

-- (3) 댓글쓰기
insert into restaurantComment (rCommentNo, rName, mId, bID, RContent, RGroup, RStep, RIndent) -- 원 댓글
    values (rCommentNo_seq.nextval, '올래국수', 'pham', null, '대퓨님 너무 맛있어요.', rCommentNo_seq.CURRVAL, 0, 0);

-- (4) 글번호로 전체 내용 가져오기
SELECT * FROM RESTAURANTCOMMENT WHERE RCOMMENTNO = '1';

-- (5) 댓글 수정
UPDATE RESTAURANTCOMMENT SET
    RContent = '수정된 내용'
    WHERE RNAME = '올래국수' AND MID = 'pham';