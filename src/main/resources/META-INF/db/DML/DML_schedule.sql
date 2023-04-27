-- ★★★★★★★ 일정 ★★★★★★★ --
-- 1. 일정 생성
INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent, hName, rName, sName)
    VALUES (scheduleNo_seq.NEXTVAL, 'aaa', '제주여행', TO_TIMESTAMP('2023-05-01 10:00:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-05-03 20:00:00','YYYY-MM-DD HH24:MI:SS'), '제주에서의 즐거운 여행', '호텔더원', '제주김만복', '한라산국립공원');
-- 2. 일정 조회
SELECT * FROM Schedule
    WHERE mId = 'aaa';

-- 3. 특정 일정 조회
SELECT * FROM Schedule
    WHERE scheduleNo = 36;

-- 4. 일정 수정
UPDATE Schedule
    SET hName = '위드시티호텔', rName = '제주김만복', sName = '한라산국립공원', scheduleTitle = '제주 여행', startDate = TO_TIMESTAMP('2023-05-02 00:00:00','YYYY-MM-DD HH24:MI:SS'), endDate = TO_TIMESTAMP('2023-05-05 00:00:00','YYYY-MM-DD HH24:MI:SS'), ScheduleContent = 'aa'
    WHERE mId = 'aaa' AND scheduleNo = 36;

-- 5. 일정 삭제
DELETE FROM Schedule
    WHERE scheduleNo = 1;

-- 6. 회원별 일정 목록 조회
SELECT scheduleNo, scheduleTitle, startDate, endDate
    FROM Schedule
    WHERE mId = 'aaa'
    ORDER BY startDate;

-- 7. 기간별 일정 검색
SELECT * FROM Schedule
    WHERE mId = 'aaa' AND startDate >= TO_TIMESTAMP('2023-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') AND endDate <= TO_TIMESTAMP('2023-05-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS');

-- 8. 일정명으로 검색
SELECT * FROM Schedule
    WHERE mId = 'aaa' AND LOWER(scheduleTitle) LIKE LOWER('%제주여행%');