------------------------------------------------------
--           BOOKMARK query            
------------------------------------------------------
-- (1) 북마크 (호텔) - addHotel
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME, HMAINIMG, RMAINIMG, SMAINIMG)
    VALUES (bookmarkNo_seq.NEXTVAL, 'bbb', '위드시티호텔', null, null, '위드시티호텔m.jpg', null, null);

-- (2) 북마크 (식당) - addRes
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME, HMAINIMG, RMAINIMG, SMAINIMG)
    VALUES (bookmarkNo_seq.NEXTVAL, 'kim', null, '올레칠돈', null, null, '올레칠돈m', null);
    
-- (3) 북마크 (관광지) - addSpot
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME, HMAINIMG, RMAINIMG, SMAINIMG)
    VALUES (bookmarkNo_seq.NEXTVAL, 'kim', null, null, '성산일출봉', null, null, '성산일출봉m.jpg');

-- (4) 북마크 해제 (호텔) - deleteHotelMark
DELETE FROM BOOKMARK
    WHERE MID = 'kim' AND HNAME = '호텔더원';

-- (5) 북마크 해제 (식당) - deleteResMark
DELETE FROM BOOKMARK
    WHERE MID = 'kim' AND RNAME = '돈사돈';
    
-- (6) 북마크 해제 (관광지) - deleteSpotMark
DELETE FROM BOOKMARK
    WHERE MID = 'kim' AND SNAME = '협재해수욕장';

-- (7) 북마크한 리스트 중 관광지만 보기 - bookmarkSpot
SELECT * 
    FROM SPOT, BOOKMARK
    WHERE SPOT.SNAME = BOOKMARK.SNAME
    AND BOOKMARK.MID = 'kim' ORDER BY BOOKMARKDATE DESC;
-- 갯수출력 - SpotCount
SELECT COUNT(*) 
    FROM SPOT, BOOKMARK
    WHERE SPOT.SNAME = BOOKMARK.SNAME
    AND BOOKMARK.MID = 'pham';
    
-- (8) 북마크한 리스트 중 식당만 보기 - bookmarkRes
SELECT *
    FROM RESTAURANT, BOOKMARK
    WHERE RESTAURANT.RNAME = BOOKMARK.RNAME
    AND BOOKMARK.MID = 'kim' ORDER BY BOOKMARKDATE DESC;
    
-- 갯수출력 - ResCount
SELECT COUNT(*)
    FROM RESTAURANT, BOOKMARK
    WHERE RESTAURANT.RNAME = BOOKMARK.RNAME
    AND BOOKMARK.MID = 'pham';
  
-- (9) 북마크한 리스트 중 호텔만 보기 - bookmarkHotel
SELECT *
    FROM HOTEL, BOOKMARK
    WHERE HOTEL.HNAME = BOOKMARK.HNAME
    AND BOOKMARK.MID = 'kim' ORDER BY BOOKMARKDATE DESC;
    
-- 갯수출력 - HotelCount
SELECT COUNT(*)
    FROM HOTEL, BOOKMARK
    WHERE HOTEL.HNAME = BOOKMARK.HNAME
    AND BOOKMARK.MID = 'test';
    
-- 특정 숙소 북마크 여부 - checkBookmark
SELECT COUNT(*) FROM BOOKMARK WHERE MID = 'bbb' AND HNAME = '위드시티호텔';

-- 특정 숙소 북마크 개수 - cntBmarkHotel
SELECT COUNT(*) FROM BOOKMARK WHERE HNAME = '위드시티호텔';
-- delete from bookmark where HNAME = '위드시티호텔';

SELECT * FROM BOOKMARK;
SELECT * FROM MEMBER;
COMMIT;