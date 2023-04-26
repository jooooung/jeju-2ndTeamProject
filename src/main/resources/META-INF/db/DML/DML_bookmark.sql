------------------------------------------------------
--           BOOKMARK query            
------------------------------------------------------
-- (1) 북마크 (호텔) - addHotel
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME)
    VALUES (bookmarkNo_seq.NEXTVAL, 'test', '호텔더원', null, null);
    
-- (2) 북마크 (식당) - addRes
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME)
    VALUES (bookmarkNo_seq.NEXTVAL, 'test', null, '돈사돈', null);
    
-- (3) 북마크 (관광지) - addSpot
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME)
    VALUES (bookmarkNo_seq.NEXTVAL, 'test', null, null, '협재해수욕장');

-- (4) 북마크 해제 (호텔) - deleteHotelMark
DELETE FROM BOOKMARK
    WHERE MID = 'aaa' AND HNAME = '호텔더원';

-- (5) 북마크 해제 (식당) - deleteResMark
DELETE FROM BOOKMARK
    WHERE MID = 'pham' AND RNAME = '돈사돈';
    
-- (6) 북마크 해제 (관광지) - deleteSpotMark
DELETE FROM BOOKMARK
    WHERE MID = 'kim' AND SNAME = '협재해수욕장';

-- (7) 북마크한 리스트 중 관광지만 보기 - bookmarkSpot
SELECT * 
    FROM SPOT, BOOKMARK
    WHERE SPOT.SNAME = BOOKMARK.SNAME
    AND BOOKMARK.MID = 'pham';
-- 갯수출력 - SpotCount
SELECT COUNT(*) 
    FROM SPOT, BOOKMARK
    WHERE SPOT.SNAME = BOOKMARK.SNAME
    AND BOOKMARK.MID = 'pham';
    
-- (8) 북마크한 리스트 중 식당만 보기 - bookmarkRes
SELECT *
    FROM RESTAURANT, BOOKMARK
    WHERE RESTAURANT.RNAME = BOOKMARK.RNAME
    AND BOOKMARK.MID = 'test';
    
-- 갯수출력 - ResCount
SELECT COUNT(*)
    FROM RESTAURANT, BOOKMARK
    WHERE RESTAURANT.RNAME = BOOKMARK.RNAME
    AND BOOKMARK.MID = 'pham';
  
-- (9) 북마크한 리스트 중 호텔만 보기 - bookmarkHotel
SELECT *
    FROM HOTEL, BOOKMARK
    WHERE HOTEL.HNAME = BOOKMARK.HNAME
    AND BOOKMARK.MID = 'test';
    
-- 갯수출력 - HotelCount
SELECT COUNT(*)
    FROM HOTEL, BOOKMARK
    WHERE HOTEL.HNAME = BOOKMARK.HNAME
    AND BOOKMARK.MID = 'test';

-- (10) 북마크 리스트 전체
SELECT * FROM BOOKMARK WHERE MID = 'pham';
SELECT * FROM BOOKMARK WHERE MID = 'test';


select * from bookmark;
SELECT * FROM MEMBER;
COMMIT;