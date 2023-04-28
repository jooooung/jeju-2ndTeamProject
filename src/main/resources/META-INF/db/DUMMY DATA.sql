------------------------- DUMMY DATA ------------------

-- LOCATION --
insert into location values (locationNo_seq.nextval, '제주시');
insert into location values (locationNo_seq.nextval, '서귀포시');
insert into location values (locationNo_seq.nextval, '조천');
insert into location values (locationNo_seq.nextval, '구좌');
insert into location values (locationNo_seq.nextval, '성산');
insert into location values (locationNo_seq.nextval, '표선');
insert into location values (locationNo_seq.nextval, '남원');
insert into location values (locationNo_seq.nextval, '중문');
insert into location values (locationNo_seq.nextval, '안덕');
insert into location values (locationNo_seq.nextval, '대정');
insert into location values (locationNo_seq.nextval, '한경');
insert into location values (locationNo_seq.nextval, '한림');
insert into location values (locationNo_seq.nextval, '애월');
insert into location values (locationNo_seq.nextval, '우도');
insert into location values (locationNo_seq.nextval, '추자도');

-- RestauranTtype --
insert into RestauranTtype values (RestauranTtypeNo_seq.nextval, '고기');
insert into RestauranTtype values (RestauranTtypeNo_seq.nextval, '해산물');
insert into RestauranTtype values (RestauranTtypeNo_seq.nextval, '분식');
insert into RestauranTtype values (RestauranTtypeNo_seq.nextval, '국수');
insert into RestauranTtype values (RestauranTtypeNo_seq.nextval, '카페');

-- ADMIN --
insert into admin (aId, aPw, aName) values('admin', '1', '관리자');
INSERT INTO ADMIN (aID, aPW, aNAME) VALUES ('admin2', '111', '강영자');

-- BUSINESS restaurant --
INSERT INTO Business (bId, bPw, bName, bTel, bEmail, bAddr, bDeAddr, bPost, bPhoto, bRdate)
    VALUES ('su', 'bpw', '제주만복집', '010-1234-1234', 'su@naver.com', '제주시 서귀포구', '감귤동', '125863', null, sysdate);
INSERT INTO Business (bId, bPw, bName, bTel, bEmail, bAddr, bDeAddr, bPost, bPhoto, bRdate)
    VALUES ('guk', 'bpw', '올래국수', '010-1234-1234', 'guk@naver.com', '제주시 서귀포구', '감귤동', '125863', null, sysdate);
INSERT INTO Business (bId, bPw, bName, bTel, bEmail, bAddr, bDeAddr, bPost, bPhoto, bRdate)
    VALUES ('park', 'bpw', '올레칠돈', '010-1234-1234', 'park@naver.com', '제주시 서귀포구', '감귤동', '125863', null, sysdate);
INSERT INTO Business (bId, bPw, bName, bTel, bEmail, bAddr, bDeAddr, bPost, bPhoto, bRdate)
    VALUES ('jin', 'bpw', '명진전복', '010-1234-1234', 'jin@naver.com', '제주시 서귀포구', '감귤동', '125863', null, sysdate);
INSERT INTO Business (bId, bPw, bName, bTel, bEmail, bAddr, bDeAddr, bPost, bPhoto, bRdate)
    VALUES ('bang', 'bpw', '가시아방', '010-1234-1234', 'bang@naver.com', '제주시 서귀포구', '감귤동', '125863', null, sysdate);
INSERT INTO Business (bId, bPw, bName, bTel, bEmail, bAddr, bDeAddr, bPost, bPhoto, bRdate)
    VALUES ('don', 'bpw', '돈사돈', '010-1234-1234', 'don@naver.com', '제주시 서귀포구', '감귤동', '125863', null, sysdate);
INSERT INTO Business (bId, bPw, bName, bTel, bEmail, bAddr, bDeAddr, bPost, bPhoto, bRdate)
    VALUES ('bom', 'bpw', '봄날카페', '010-1234-1234', 'bom@naver.com', '제주시 서귀포구', '감귤동', '125863', null, sysdate);

select * from Business;
-- BUSINESS hotel --
INSERT INTO Business (bId, bPw, bName, bTel, bEmail, bAddr, bDeAddr, bPost, bPhoto, bRdate)
    VALUES ('withCITY', 'bpw', '위드시티호텔', '010-1234-1234', 'withcity@naver.com', '제주시 서귀포구', '감귤동', '125863', null, sysdate);
INSERT INTO Business (bId, bPw, bName, bTel, bEmail, bAddr, bDeAddr, bPost, bPhoto, bRdate)
    VALUES ('grabel', 'bpw', '그라벨호텔', '010-1234-1234', 'grabel@naver.com', '제주시 서귀포구', '감귤동', '125863', null, sysdate);
INSERT INTO Business (bId, bPw, bName, bTel, bEmail, bAddr, bDeAddr, bPost, bPhoto, bRdate)
    VALUES ('theOne', 'bpw', '호텔더원', '010-1234-1234', 'theOne@naver.com', '제주시 서귀포구', '감귤동', '125863', null, sysdate);
INSERT INTO Business (bId, bPw, bName, bTel, bEmail, bAddr, bDeAddr, bPost, bPhoto, bRdate)
    VALUES ('hotel', 'bpw', '호텔', '010-1234-1234', 'hotel@naver.com', '제주시 서귀포구', '감귤동', '125863', null, sysdate);

-- MEMBER -- 
insert into member (mId, mPw, mName, mTel, mEmail, mAddr, mDeAddr, mPost, mBirth)
    values('aaa', '1', '홍길동','010-1234-1234',  'hong@hong.com', '서울시 중랑구', 'xx아파트', '12345', '1995-12-12');
insert into member (mId, mPw, mName, mTel, mEmail, mAddr, mDeAddr, mPost, mBirth)
    values('bbb', '1', '김길동', '010-4321-4321', 'kim@kim.com', '서울시 서대문구', '이젠빌라', '12345', '1997-04-28');
insert into member (mId, mPw, mName, mTel, mEmail, mAddr, mDeAddr, mPost, mBirth, mphoto, mrDate)
    VALUES ('kim', '123', '김민지', '010-1234-4321', 'kim@naver.com', '강원도 춘천시', '춘천아파트',' 12345', '2004-05-07','민지.png', SYSDATE);
insert into member (mId, mPw, mName, mTel, mEmail, mAddr, mDeAddr, mPost, mBirth, mphoto, mrDate)
    VALUES ('pham', '123', '팜하니',  '010-4321-1234', 'hani@naver.com', '서울시 강서구', '염창아파트', '45678', '2004-10-06','하니.png', SYSDATE);
insert into member (mId, mPw, mName, mTel, mEmail, mAddr, mDeAddr, mPost, mBirth, mphoto, mrDate)
    VALUES ('zico', '123', '지아코', '010-6666-666', 'zico@naver.com', '서울시 강북구', '강북아파트', '54524', '1992-09-14','gico.png', SYSDATE);
insert into member (mId, mPw, mName, mTel, mEmail, mAddr, mDeAddr, mPost, mBirth, mphoto, mrDate)
    VALUES ('mid', '123', '강성빈',  '010-5555-4343', 'kang@naver.com', '서울시 강서구', '미주아파트', '12345', '1994-08-25','kang.png', SYSDATE);

-- SPOT --
insert into spot (sName, aId, locationNo, sAddr, sTel, sLink, sInfo, sMainImg, sSubImg_1, sLatitude, sLongitude, sPrice) 
    values('한라산국립공원', 'admin', 2, '제주특별자치도 제주시 오등동 산 182', '064-713-9950', 
    'https://jeju.go.kr/hallasan/index.htm', '계절과 기후변화에 따른 입산 통제구간은 홈페이지 참고', 
    '한라산국립공원m.jpg', '한라산국립공원s1.jpg', 33.37856425194726, 126.5431717373512, '무료');
    
insert into spot (sName, aId, locationNo, sAddr, sTel, sLink, sInfo, sMainImg, sSubImg_1, sLatitude, sLongitude, sPrice) 
    values('성산일출봉', 'admin', 2, '제주특별자치도 서귀포시 성산읍 일출로 284-12', '064-783-0959', 
    'http://www.jeju.go.kr/dorip/seongsan.htm', '매일 07:00 - 20:00 (18:50분매표마감) 3~9월 / 매월 첫째 월요일 휴관 (단, 등하산교차로, 우뭇개 전망대, 우뭇개 해안은 무료개방) 매일 07:30 - 19:00 (17:50분매표마감) 10~2월 / 매월 첫째 월요일 휴관', 
    '성산일출봉m.jpg', '성산일출봉s1.jpg', 33.45917466716145, 126.94059127727817, 
    '유료,개인 (성인 5,000원 / 청소년, 군인 2,500원 / 어린이 2,500원), 단체 (성인 4,000원 / 청소년, 군인 2,000원 / 어린이 2,000원)');
    
insert into spot (sName, aId, locationNo, sAddr, sTel, sInfo, sMainImg, sSubImg_1, sLatitude, sLongitude, sPrice) 
    values('협재해수욕장', 'admin', 1, '제주특별자치도 제주시 한림읍 한림로 329-10', '064-728-3981', 
    '협재 종합상황실: 064-728-3981(해수욕장 개장기간 동안 운영)', '협재해수욕장m.jpg', 
    '협재해수욕장s1.jpg', 33.39396920901713, 126.23921468065957, '무료');

-- RESTAURANT --
INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('제주김만복', 'su', 1, 3, '제주특별자치도 제주시 오라로 41', '064-759-8582', 'LINK', 
    '매일매일 신선한 재료로 정성스레 만드는 만복이네 김밥입니다!', '만복김밥', 
            '제주김만복m.jpg', '제주김만복s1.jpg', '제주김만복s2.jpg', '제주김만복s3.jpg',  33.497066158681676, 126.50894864880289, '세트가 단돈 만원!');
            
INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo,RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('올래국수', 'guk', 1, 4, '제주특별자치도 제주시 귀아랑길 24 (연동)', '064-742-7355', 'LINK', 
    '너 올래 안올래? 올래국수!', '해물국수',
            '올래국수m.jpg', '올래국수s1.jpg', '올래국수s2.jpg', '올래국수s3.jpg', 33.49151973703596, 126.49729949767276, '국수 7000원 부터');
            
INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('올레칠돈', 'park', 2, 1, '제주특별자치도 서귀포시 월평하원로 20', '064-739-5533', 'LINK', 
    'A급 돼지들만 사용하는 진짜들의 고기집 입니다.', '제주흑돼지',
            '올레칠돈m.jpg', '올레칠돈s1.jpg', '올레칠돈s2.jpg', '올레칠돈s3.jpg',  33.243687142086976, 126.45959335549377, '1인분 15,000원');
            
INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('명진전복', 'jin', 1, 2, '제주특별자치도 제주시 구좌읍 해맞이해안로 1282', '064-782-9944', 
    'https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_000000000020047', 
    '명진전복은 전복돌솥밥, 전복구이, 전복죽 등을 판매하는 인기 맛집 입니다!', '전복구이',
            '명진전복m.jpg', '명진전복s1.jpg', '명진전복s2.jpg', '명진전복s3.jpg',  33.53246865592159, 126.8501903577186, '12,000원');     

INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('가시아방', 'bang', 5, 4, '제주특별자치도 서귀포시 성산읍 섭지코지로 10', '064-783-0987', 
    'https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_000000000018307', 
    '국수가 먹고싶을땐? 가시아방', '고기국수, 비빔국수',
            '가시아방m.jpg', '가시아방s1.jpg', '가시아방s2.jpg', '가시아방s3.jpg',  33.43858028658235, 126.9180594306653, '8,000원');

INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('돈사돈', 'don', 1, 1, '제주특별자치도 제주시 우평로 19', '064-746-8989', 
    'https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_000000000020104', 
    '진정한 흑돼지 달인', '흑돼지 오겹살',
            '돈사돈m.jpg', '돈사돈s1.jpg', '돈사돈s2.jpg', '돈사돈s3.jpg',  33.478845919157024, 126.46402562151444, '30,000원');
            
INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('봄날카페', 'bom', 1, 5, '제주특별자치도 제주시 애월읍 애월로1길 25', '064-799-4999', 
    'link', 
    '드라마 맨도롱 또똣의 주인공이 일하던 카페', '아메리카노',
            '봄날카페m.jpg', '봄날카페s1.jpg', '봄날카페s2.jpg', '봄날카페s3.jpg',  33.46242809443207, 126.30958428618032 , '3,000원');

INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('델문도', 'bom', 1, 3, '제주특별자치도 제주시 조천읍 조함해안로 519-10', '064-702-0007', 
    'https://delmoondo.com/', 
    '일출과 일몰, 바람, 그리고 델문도 커피가 선사하는 특별하고 몽환적인 순간.', '선라이즈 블렌드',
            '델문도m.jpg', '델문도s1.jpg', '델문도s2.jpg', '델문도s3.jpg',  33.54369039106334, 126.66871972286157 , '19,000원');

-- HOTEL --
INSERT INTO HOTEL (HNAME, BID, LOCATIONNO, HADDR, HTEL, HLINK, HINFO, INTIME, OUTTIME, HMAINIMG, HSUBIMG_1, HSUBIMG_2, HSUBIMG_3, HLATITUDE, HLONGITUDE, HPRICE, requestStatus)
              VALUES ('위드시티호텔', 'withCITY', (SELECT locationNo FROM (SELECT * FROM location WHERE lName = '제주시')), '제주특별자치도 제주시 노연로 34', '064-902-3275', 'http://www.withcityhotel.com/', '호텔위드시티는 공항에서 10분거리에 있으며 주변에 다양한 맛집이 있습니다.', '15:00', '11:00', '위드시티호텔m.jpg', '위드시티호텔s1.jpg', '위드시티호텔s2.jpg', '위드시티호텔s3.jpg', '33.48582927685537', '126.48379663399649', 80000, 'A');
              
INSERT INTO HOTEL (HNAME, BID, LOCATIONNO, HADDR, HTEL, HLINK, HINFO, INTIME, OUTTIME, HMAINIMG, HSUBIMG_1, HSUBIMG_2, HSUBIMG_3, HLATITUDE, HLONGITUDE, HPRICE, requestStatus)
              VALUES ('그라벨호텔', 'grabel', (SELECT locationNo FROM (SELECT * FROM location WHERE lName = '제주시')), '제주특별자치도 제주시 일주서로 7316', '064-740-8000', 'https://grabelhotel.com/', '제주 유일하게 자갈로 이루어진 역빈해안이 눈 앞에 펼쳐지는 곳 그라벨 호텔입니다.', '15:00', '11:00', '그라벨호텔m.jpg', '그라벨호텔s1.jpg', '그라벨호텔s2.jpg', '그라벨호텔s2.jpg', '33.492437097713896', '126.42864471233102', 1350000, 'A');
              
INSERT INTO HOTEL (HNAME, BID, LOCATIONNO, HADDR, HTEL, HLINK, HINFO, INTIME, OUTTIME, HMAINIMG, HSUBIMG_1, HSUBIMG_2, HSUBIMG_3, HLATITUDE, HLONGITUDE, HPRICE, requestStatus)
              VALUES ('호텔더원', 'theOne', (SELECT locationNo FROM (SELECT * FROM location WHERE lName = '제주시')), '제주특별자치도 제주시 연동 사장3길 33 KR', '064-798-0001', 'http://www.hoteltheone.com/', '제주 시내에 위치해 있어 현지 명소 및 관광지와 인접해 있습니다. 떠나기 전 유명한 성산일출봉을 방문해 보세요.', '15:00', '11:00', '호텔더원m.jpg', '호텔더원s1.jpg', '호텔더원s2.jpg', '호텔더원s3.jpg', '33.483523318292406', '126.49084698890063', 85000, 'A');              

-- Hreservation --
INSERT INTO Hreservation (MID, HNAME, INDATE, OUTDATE) VALUES ('aaa', '위드시티호텔', '2023-04-20', '2023-04-22');
INSERT INTO Hreservation (MID, HNAME, INDATE, OUTDATE) VALUES ('bbb', '그라벨호텔', '2023-05-20', '2023-05-22');
INSERT INTO Hreservation (MID, HNAME, INDATE, OUTDATE) VALUES ('kim', '위드시티호텔', '2023-04-25', '2023-04-27');

-- SCHEDULE --
INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent, hName, rName, sName)
VALUES (scheduleNo_seq.NEXTVAL, 'kim', '제주여행', TO_TIMESTAMP('2023-05-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-05-03 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), '제주에서의 즐거운 여행', '호텔더원', '제주김만복', '한라산국립공원');

INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent, hName, rName, sName)
VALUES (scheduleNo_seq.NEXTVAL, 'kim', '가족여행', TO_TIMESTAMP('2023-07-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), '제주에서의 가족과 함께하는 여행', '그라벨호텔', '제주김만복', '성산일출봉');

INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent, hName, rName, sName)
VALUES (scheduleNo_seq.NEXTVAL, 'kim', '축제여행', TO_TIMESTAMP('2023-08-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-05 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), '제주의 다양한 축제를 즐길 수 있는 여행', NULL, '올래국수', '성산일출봉');

INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent, hName, rName, sName)
VALUES (scheduleNo_seq.NEXTVAL, 'kim', '산책여행', TO_TIMESTAMP('2023-09-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-09-02 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), '제주의 아름다운 자연과 함께하는 산책 여행', NULL, '올레칠돈', '협재해수욕장');

INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent, hName, rName, sName)
VALUES (scheduleNo_seq.NEXTVAL, 'kim', '드라이브여행', TO_TIMESTAMP('2023-10-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-10-04 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), '제주에서의 시원한 바닷바람과 함께하는 드라이브 여행', '위드시티호텔', '올레칠돈', '협재해수욕장');
    
-- BOOKMARK --
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME, HMAINIMG, RMAINIMG, SMAINIMG)
    VALUES (bookmarkNo_seq.NEXTVAL, 'kim', '호텔더원', null, null, '호텔더원m.jpg', null, null);
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME, HMAINIMG, RMAINIMG, SMAINIMG)
    VALUES (bookmarkNo_seq.NEXTVAL, 'kim', null, '올래국수', null, null, '올래국수m.jpg', null);
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME, HMAINIMG, RMAINIMG, SMAINIMG)
    VALUES (bookmarkNo_seq.NEXTVAL, 'kim', null, NULL, '한라산국립공원', null, null, '한라산국립공원m');

    
-- SPOTCOMMENT --
insert into spotComment (sCommentNo, sName, mId, sContent, sGroup, sStep, sIndent) values (sCommentNo_seq.nextval, '한라산국립공원', 'aaa', '높아서 오르지는 못했지만, 겨울에 가면 눈꽃으로 특히나 아름다운 산', sCommentNo_seq.CURRVAL, 0, 0);

insert into spotComment (sCommentNo, sName, mId, sContent, sGroup, sStep, sIndent) values (sCommentNo_seq.nextval, '성산일출봉', 'bbb', '아침 일찍 일출보러온 보람이 있습니다... 제주도 필수코스라고 생각해요', sCommentNo_seq.CURRVAL, 0, 0);

insert into spotComment (sCommentNo, sName, mId, sContent, sGroup, sStep, sIndent) values (sCommentNo_seq.nextval, '성산일출봉', 'aaa', '날씨 좋은날 일출 보러가면 너무 예뻐요', sCommentNo_seq.CURRVAL, 0, 0);

-- RESTAURANTCOMMENT --
insert into restaurantComment (rCommentNo, rName, mId, bID, RContent, RGroup, RStep, RIndent) -- 원 댓글
    values (rCommentNo_seq.nextval, '올래국수', 'kim', null, '해물국수 존맛탱 인정이요.', rCommentNo_seq.CURRVAL, 0, 0);

insert into restaurantComment (rCommentNo, rName, bID, RContent, RGroup, RStep, RIndent) -- 윗 댓글에 대한 답댓글
    values (rCommentNo_seq.nextval, '올래국수', 'su', '헉 고객님 칭찬 베리 감사합니다!', 1, 1, 1);

insert into restaurantComment (rCommentNo, rName, mId, bID, RContent, RGroup, RStep, RIndent) -- 원 댓글
    values (rCommentNo_seq.nextval, '올래국수', 'pham', null, '대퓨님 너무 맛있어요.', rCommentNo_seq.CURRVAL, 0, 0);  
    
insert into restaurantComment (rCommentNo, rName, bID, RContent, RGroup, RStep, RIndent) -- 윗 댓글에 대한 답댓글
    values (rCommentNo_seq.nextval, '올래국수', 'su', '헉 고객님 칭찬 베리 감사합니다!', 3, 1, 1);

-- hotelComment --
-- 원 댓글
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '호텔더원', 'aaa', NULL, '깨끗하고 좋아요', hCommentNo_seq.CURRVAL, 0, 0, SYSDATE);
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '호텔더원', 'bbb', NULL, '경치가 너무 좋네요', hCommentNo_seq.CURRVAL, 0, 0, SYSDATE);
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '위드시티호텔', 'bbb', NULL, '공항에서 가까워서 편했어요', hCommentNo_seq.CURRVAL, 0, 0, SYSDATE);
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '그라벨호텔', 'kim', NULL, '시내랑 가까워서 움직이기 좋아요', hCommentNo_seq.CURRVAL, 0, 0, SYSDATE);

-- 답 댓글
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '호텔더원', NULL, 'theOne', '항상 좋은 모습으로 보답하겠습니다', 1, 1, 1, SYSDATE);
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '호텔더원', NULL, 'theOne', '보답하겠습니다', 4, 1, 1, SYSDATE);

-- 댓글의 댓글
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '호텔더원', 'aaa', NULL, '감사합니다', 1, 2, 2, SYSDATE);

    
-- FESTIVAL --
INSERT INTO FESTIVAL (FESTIVALNO, aID, FTITLE, FCONTENT)
    VALUES (festivalNo_seq.NEXTVAL, 'admin', '휴애리 봄 수국축제', '2023.04.07. ~ 2023.06.14.');
INSERT INTO FESTIVAL (FESTIVALNO, aID, FTITLE, FCONTENT)
    VALUES (festivalNo_seq.NEXTVAL, 'admin', '제주 허브동산 별빛놀이', '2022.01.01. ~ 2023.12.31.');
INSERT INTO FESTIVAL (FESTIVALNO, aID, FTITLE, FCONTENT)
    VALUES (festivalNo_seq.NEXTVAL, 'admin', '탐라 문화제', '2023.10.06. ~ 2023.10.08.');
INSERT INTO FESTIVAL (FESTIVALNO, aID, FTITLE, FCONTENT)
    VALUES (festivalNo_seq.NEXTVAL, 'admin', '한라산 청정 고사리축제', '2023.04.29. ~ 2023.04.30.');
INSERT INTO FESTIVAL (FESTIVALNO, aID, FTITLE, FCONTENT)
    VALUES (festivalNo_seq.NEXTVAL, 'admin', '제주 반려동물 문화축제', '2023.05.06. ~ 2023.05.07.');

-- REVIEW --
insert into Review (reviewNo, mId, rTitle, rContent) 
values (reviewNo_seq.nextval, 'aaa', '성산일출봉 다녀왔습니다~', 
                    '새벽 4시에 기상해서 아침 일찍 산에 올랐는데 몸은 힘들었지만... 일출이 너무 아름다웠습니다 제주도 여행가시는 분들은 꼭 한번 가보셨으면 좋겠어요');

COMMIT;