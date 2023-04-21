------------------------------------------------------
--           BOOKMARK query            
------------------------------------------------------
-- (1) 북마크 (호텔)
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME)
    VALUES (bookmarkNo_seq.NEXTVAL, 'kim', '호텔더원', null, null);
    
-- (2) 북마크 (식당)
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME)
    VALUES (bookmarkNo_seq.NEXTVAL, 'pham', null, '돈사돈', null);
    
-- (3) 북마크 (관광지)
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME)
    VALUES (bookmarkNo_seq.NEXTVAL, 'kim', null, null, '협재해수욕장');

-- (4) 북마크 해제 (호텔)
DELETE FROM BOOKMARK
    WHERE MID = 'aaa' AND HNAME = '호텔더원';

-- (5) 북마크 해제 (식당)
DELETE FROM BOOKMARK
    WHERE MID = 'pham' AND RNAME = '돈사돈';
    
-- (6) 북마크 해제 (관광지)
DELETE FROM BOOKMARK
    WHERE MID = 'kim' AND SNAME = '협재해수욕장';

SELECT * FROM BOOKMARK;
COMMIT;