------------------------------------------------------
--           MYREVIEW query            
------------------------------------------------------
-- (1) 작성한 리뷰게시판 글 조회
INSERT INTO MYREVIEW (myreviewno, MID, sCommentNo, RCommentNo, HCommentNo, REVIEWNO)
    VALUES (MYREVIEWNO_SEQ.NEXTVAL, 'aaa', 4, null, null, 2);
    
SELECT *
    FROM MYREVIEW MR, REVIEW R
    WHERE MR.REVIEWNO=R.REVIEWNO
    AND R.MID = 'aaa';



    
SELECT * FROM REVIEW WHERE MID = 'aaa';
SELECT * FROM spotComment WHERE MID = 'aaa';
SELECT * FROM restaurantComment WHERE MID = 'aaa';
SELECT * FROM hotelComment WHERE MID = 'aaa';




-- (2) 작성한 관광지 댓글 조회


-- (3) 작성한 식당 댓글 조회


-- (4) 작성한 호텔 댓글 조회








SELECT * FROM MYREVIEW;
SELECT * FROM REVIEW;
COMMIT;