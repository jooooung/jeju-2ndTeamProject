------------------------------------------------------
--           MYREVIEW query            
------------------------------------------------------
-- (1) 작성한 리뷰게시판 글 조회 -- ReadReview    
SELECT * FROM Review WHERE mId = 'kim';


-- (2) 작성한 관광지 댓글 조회 -- ReadSpotcomment
SELECT * FROM spotComment WHERE mId = 'aaa';


-- (3) 작성한 식당 댓글 조회 -- ReadRescomment
SELECT * FROM restaurantComment WHERE mId = 'kim';

-- (4) 작성한 호텔 댓글 조회 -- ReadHotelcomment
SELECT * FROM hotelComment WHERE mId = 'kim';

SELECT * FROM MYREVIEW;
COMMIT;

