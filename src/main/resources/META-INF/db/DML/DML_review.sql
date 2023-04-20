--------------------------------
---------- REVIEW TABLE --------
--------------------------------

-- 1. 리뷰게시판 페이징
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM REVIEW ORDER BY REVIEWNO DESC)A)
    WHERE RN BETWEEN 1 AND 2;

-- 2. 리뷰 등록
INSERT INTO REVIEW (REVIEWNO, MID, RTITLE, RCONTENT)
    VALUES (REVIEWNO_SEQ.NEXTVAL, 'aaa', '성산일출봉 다녀왔습니다~', '새벽 4시에 기상해서 아침 일찍 산에 올랐는데 몸은 힘들었지만... 일출이 너무 아름다웠습니다 제주도 여행가시는 분들은 꼭 한번 가보셨으면 좋겠어요');

-- 3. 리뷰 삭제
DELETE FROM REVIEW WHERE REVIEWNO = 1; 

-- 4. 리뷰 수정
UPDATE REVIEW SET RTITLE = '수정',
                  RCONTENT = '수정'
    WHERE REVIEWNO = 2; 

-- 5. 리뷰 상세보기
SELECT * FROM REVIEW WHERE REVIEWNO = 2;

-- 6. 리뷰 상세보기시 조회수 올리기
UPDATE REVIEW SET RHIT = RHIT + 1
    WHERE REVIEWNO = 2;