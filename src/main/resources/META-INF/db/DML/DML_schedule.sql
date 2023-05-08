-- ★★★★★★★ 일정 ★★★★★★★ --
-- 1. 일정 생성
INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent)
    VALUES (scheduleNo_seq.NEXTVAL, 'aaa', '제주여행', TO_DATE('2023-05-01','YYYY-MM-DD'), TO_DATE('2023-05-03','YYYY-MM-DD'), '제주에서의 즐거운 여행');
-- 2. 일정 조회
SELECT * FROM Schedule
    WHERE mId = 'aaa';

select * from schedule;
-- 3. 특정 일정 조회
SELECT * FROM Schedule
    WHERE scheduleNo = 36;

-- 4. 일정 수정
UPDATE Schedule
    SET scheduleTitle = '제주 여행', startDate = TO_DATE('2023-05-01','YYYY-MM-DD'), endDate = TO_DATE('2023-05-01','YYYY-MM-DD'), ScheduleContent = 'aa'
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
    WHERE mId = 'aaa' AND startDate >= TO_DATE('2023-05-01','YYYY-MM-DD') AND endDate <= TO_DATE('2023-05-03','YYYY-MM-DD');

-- 8. 일정명으로 검색
SELECT * FROM Schedule
    WHERE mId = 'aaa' AND LOWER(scheduleTitle) LIKE LOWER('%제주여행%');
    
    COMMIT;