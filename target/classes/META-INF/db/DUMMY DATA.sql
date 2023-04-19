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
INSERT INTO Business (bid, bpw, bname, bemail) VALUES ('su', '123', '제주만복집', 'su@naver.com');
INSERT INTO Business (bid, bpw, bname, bemail) VALUES ('guk', '123', '올래국수', 'guk@naver.com'); 
INSERT INTO Business (bid, bpw, bname, bemail) VALUES ('park', '123', '올레칠돈', 'park@naver.com');
INSERT INTO Business (bid, bpw, bname, bemail) VALUES ('jin', '123', '명진전복', 'jin@naver.com'); 
INSERT INTO Business (bid, bpw, bname, bemail) VALUES ('bang', '123', '가시아방', 'bang@naver.com'); 
INSERT INTO Business (bid, bpw, bname, bemail) VALUES ('don', '123', '돈사돈', 'don@naver.com'); 
INSERT INTO Business (bid, bpw, bname, bemail) VALUES ('bom', '123', '봄날카페', 'bom@naver.com'); 

-- BUSINESS hotel --
INSERT INTO Business (bid, bpw, bname, bemail) VALUES ('withCITY', '123', '위드시티호텔', 'withcity@naver.com'); 
INSERT INTO Business (bid, bpw, bname, bemail) VALUES ('grabel', '123', '그라벨호텔', 'grabel@naver.com'); 
INSERT INTO Business (bid, bpw, bname, bemail) VALUES ('theOne', '123', '호텔더원', 'theOne@naver.com'); 
INSERT INTO Business (bid, bpw, bname, bemail) VALUES ('hotel', '123', '호텔', 'hotel@naver.com'); 

-- MEMBER -- 
insert into member (mId, mPw, mName, mEmail, mAddr, mPost, mBirth)
    values('aaa', '1', '홍길동', 'hong@hong.com', '서울시 중랑구', '12345', '1995-12-12');
insert into member (mId, mPw, mName, mEmail, mAddr, mPost, mBirth)
    values('bbb', '1', '김길동', 'kim@kim.com', '서울시 서대문구', '12345', '1997-04-28');
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mADDR, mPOST, MBIRTH, MPHOTO)
    VALUES ('kim', '123', '김민지', 'kim@naver.com', '강원도 춘천시', '12345', '2004-05-07','NOIMG.JPG');
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mADDR, mPOST, MBIRTH, MPHOTO)
    VALUES ('pham', '123', '팜하니', 'hani@naver.com', '서울시 강서구', '45678', '2004-10-06','NOIMG.JPG');
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mADDR, mPOST, MBIRTH, MPHOTO)
    VALUES ('zico', '123', '지아코', 'zico@naver.com', '서울시 강북구', '54524', '1992-09-14','NOIMG.JPG');
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mADDR, mPOST, MBIRTH, MPHOTO)
    VALUES ('kang', '123', '강성빈', 'kang@naver.com', '서울시 강서구', '12345', '1994-08-25','NOIMG.JPG');

-- SPOT --
insert into spot (sName, aId, locationNo, sAddr, sTel, sLink, sInfo, sMainImg, sSubImg_1, sLatitude, sLongitude, sPrice) 
    values('한라산국립공원', 'admin', 2, '제주특별자치도 제주시 오등동 산 182', '064-713-9950', 
    'https://jeju.go.kr/hallasan/index.htm', '계절과 기후변화에 따른 입산 통제구간은 홈페이지 참고', 
    '한라산국립공원m.jpg', '한라산국립공원s.jpg', 33.37856425194726, 126.5431717373512, '무료');
    
insert into spot (sName, aId, locationNo, sAddr, sTel, sLink, sInfo, sMainImg, sSubImg_1, sLatitude, sLongitude, sPrice) 
    values('성산일출봉(UNESCO 세계자연유산)', 'admin', 2, '제주특별자치도 서귀포시 성산읍 일출로 284-12', '064-783-0959', 
    'http://www.jeju.go.kr/dorip/seongsan.htm', '매일 07:00 - 20:00 (18:50분매표마감) 3~9월 / 매월 첫째 월요일 휴관 
    (단, 등하산교차로, 우뭇개 전망대, 우뭇개 해안은 무료개방) 매일 07:30 - 19:00 (17:50분매표마감) 10~2월 / 매월 첫째 월요일 휴관', 
    '성산일출봉m.jpg', '성산일출봉s.jpg', 33.45917466716145, 126.94059127727817, 
    '유료,개인 (성인 5,000원 / 청소년, 군인 2,500원 / 어린이 2,500원), 단체 (성인 4,000원 / 청소년, 군인 2,000원 / 어린이 2,000원)');
    
insert into spot (sName, aId, locationNo, sAddr, sTel, sInfo, sMainImg, sSubImg_1, sLatitude, sLongitude, sPrice) 
    values('협재해수욕장', 'admin', 1, '제주특별자치도 제주시 한림읍 한림로 329-10', '064-728-3981', 
    '협재 종합상황실: 064-728-3981(해수욕장 개장기간 동안 운영)', '협재해수욕장m.jpg', 
    '협재해수욕장s.jpg', 33.39906165536689, 126.1241478664344, '무료');

-- RESTAURANT --
INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('제주김만복', 'su', 1, 3, '제주특별자치도 제주시 오라로 41', '064-759-8582', 'LINK', 
    '매일매일 신선한 재료로 정성스레 만드는 만복이네 김밥입니다!', '만복김밥', 
            'main.img', 'sub1.img', 'sub2.img', 'sub3.img',  33.497066158681676, 126.50894864880289, '세트가 단돈 만원!');
INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo,RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('올래국수', 'guk', 1, 4, '제주특별자치도 제주시 귀아랑길 24 (연동)', '064-742-7355', 'LINK', 
    '너 올래 안올래? 올래국수!', '해물국수',
            'main.img', 'sub1.img', 'sub2.img', 'sub3.img',  33.49710002092335, 126.5089619090469, '국수 7000원 부터');
            
INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('올레칠돈', 'park', 2, 1, '제주특별자치도 서귀포시 월평하원로 20', '064-739-5533', 'LINK', 
    'A급 돼지들만 사용하는 진짜들의 고기집 입니다.', '제주흑돼지',
            'main.img', 'sub1.img', 'sub2.img', 'sub3.img',  33.243687142086976, 126.45959335549377, '1인분 15,000원');
            
INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('명진전복', 'jin', 1, 2, '제주특별자치도 제주시 구좌읍 해맞이해안로 1282', '064-782-9944', 
    'https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_000000000020047', 
    '명진전복은 전복돌솥밥, 전복구이, 전복죽 등을 판매하는 인기 맛집 입니다!', '전복구이',
            'main.img', 'sub1.img', 'sub2.img', 'sub3.img',  33.53248445339446, 126.85020647896245, '12,000원');     

INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('가시아방', 'bang', 5, 4, '제주특별자치도 서귀포시 성산읍 섭지코지로 10', '064-783-0987', 
    'https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_000000000018307', 
    '국수가 먹고싶을땐? 가시아방', '고기국수, 비빔국수',
            'main.img', 'sub1.img', 'sub2.img', 'sub3.img',  33.53248445339446, 126.85020647896245, '8,000원');

INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('돈사돈', 'don', 1, 1, '제주특별자치도 제주시 우평로 19', '064-746-8989', 
    'https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_000000000020104', 
    '진정한 흑돼지 달인', '흑돼지 오겹살',
            'main.img', 'sub1.img', 'sub2.img', 'sub3.img',  33.53248445339446, 126.85020647896245, '30,000원');
            
INSERT INTO restaurant (RNAME, BID, LOCATIONNO, RestauranTtypeNo, RADDR, RTEL, RLINK, RINFO, RMENU, RMAINIMG, RSUBIMG_1, RSUBIMG_2, RSUBIMG_3, RLATITUDE, RLONGITUDE, RPRICE)
    VALUES ('봄날카페', 'bom', 1, 5, '제주특별자치도 제주시 애월읍 애월로1길 25', '064-799-4999', 
    'link', 
    '드라마 맨도롱 또똣의 주인공이 일하던 카페', '아메리카노',
            'main.img', 'sub1.img', 'sub2.img', 'sub3.img',  33.53248445339446, 126.85020647896245, '3,000원');



-- HOTEL --
INSERT INTO HOTEL (HNAME, BID, LOCATIONNO, HADDR, HTEL, HLINK, HINFO, INTIME, OUTTIME, HMAINIMG, HSUBIMG_1, HSUBIMG_2, HSUBIMG_3, HLATITUDE, HLONGITUDE, HPRICE, requestStatus)
              VALUES ('위드시티호텔', 'withCITY', (SELECT locationNo FROM (SELECT * FROM location WHERE lName = '제주시')), '제주특별자치도 제주시 노연로 34', '064-902-3275', 'http://www.withcityhotel.com/', '호텔위드시티는 공항에서 10분거리에 있으며 주변에 다양한 맛집이 있습니다.', '15:00', '11:00', 'sample.jpg', NULL, NULL, NULL, '33.48582927685537', '126.48379663399649', 80000, 'A');
              
INSERT INTO HOTEL (HNAME, BID, LOCATIONNO, HADDR, HTEL, HLINK, HINFO, INTIME, OUTTIME, HMAINIMG, HSUBIMG_1, HSUBIMG_2, HSUBIMG_3, HLATITUDE, HLONGITUDE, HPRICE, requestStatus)
              VALUES ('그라벨호텔', 'grabel', (SELECT locationNo FROM (SELECT * FROM location WHERE lName = '제주시')), '제주특별자치도 제주시 일주서로 7316', '064-740-8000', 'https://grabelhotel.com/', '제주 유일하게 자갈로 이루어진 역빈해안이 눈 앞에 펼쳐지는 곳 그라벨 호텔입니다.', '15:00', '11:00', 'sample.jpg', NULL, NULL, NULL, '33.492437097713896', '126.42864471233102', 1350000, 'A');
              
INSERT INTO HOTEL (HNAME, BID, LOCATIONNO, HADDR, HTEL, HLINK, HINFO, INTIME, OUTTIME, HMAINIMG, HSUBIMG_1, HSUBIMG_2, HSUBIMG_3, HLATITUDE, HLONGITUDE, HPRICE, requestStatus)
              VALUES ('호텔더원', 'theOne', (SELECT locationNo FROM (SELECT * FROM location WHERE lName = '제주시')), '제주특별자치도 제주시 특별자치도, 연동 사장3길 33 KR', '064-798-0001', 'http://www.hoteltheone.com/', '제주 시내에 위치해 있어 현지 명소 및 관광지와 인접해 있습니다. 떠나기 전 유명한 성산일출봉을 방문해 보세요.', '15:00', '11:00', 'sample.jpg', NULL, NULL, NULL, '33.483523318292406', '126.49084698890063', 85000, 'A');
INSERT INTO Hotel (hName, bId, locationNo, hAddr, hTel, hLink, hInfo, inTime, outTime, hMainImg, hSubImg_1, hSubImg_2, hSubImg_3, hLatitude, hLongitude, hPrice, requestStatus)
    VALUES ('호텔', 'hotel', 
        (SELECT locationNo FROM (SELECT * FROM location WHERE lName = '제주시')), 
    '제주', '010-1234-1324', 'www.naver.com', '정보', '14:00', '11:00','main.jpg', 'sub_img_1', 'sub_img_2', 'sub_img_3', 50.5, 50.5, '40000', 'P');              

-- Hreservation --
INSERT INTO Hreservation (MID, HNAME, INDATE, OUTDATE, RWHETHER) VALUES ('aaa', '위드시티호텔', '2023-04-20', '2023-04-22', 'Y');
INSERT INTO Hreservation (MID, HNAME, INDATE, OUTDATE, RWHETHER) VALUES ('bbb', '그라벨호텔', '2023-04-20', '2023-04-22', 'Y');
INSERT INTO Hreservation (MID, HNAME, INDATE, OUTDATE, RWHETHER) VALUES ('kim', '위드시티호텔', '2023-04-25', '2023-04-27', 'Y');

-- SCHEDULE --
INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent, hName, rName, sName)
VALUES (scheduleNo_seq.NEXTVAL, 'kim', '제주여행', TO_TIMESTAMP('2023-05-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-05-03 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), '제주에서의 즐거운 여행', '호텔더원', '제주김만복', '한라산국립공원');

INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent, hName, rName, sName)
VALUES (scheduleNo_seq.NEXTVAL, 'kim', '가족여행', TO_TIMESTAMP('2023-07-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), '제주에서의 가족과 함께하는 여행', '그라벨호텔', '제주김만복', '성산일출봉(UNESCO 세계자연유산)');

INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent, hName, rName, sName)
VALUES (scheduleNo_seq.NEXTVAL, 'kim', '축제여행', TO_TIMESTAMP('2023-08-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-05 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), '제주의 다양한 축제를 즐길 수 있는 여행', NULL, '올래국수', '성산일출봉(UNESCO 세계자연유산)');

INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent, hName, rName, sName)
VALUES (scheduleNo_seq.NEXTVAL, 'kim', '산책여행', TO_TIMESTAMP('2023-09-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-09-02 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), '제주의 아름다운 자연과 함께하는 산책 여행', NULL, '올레칠돈', '협재해수욕장');

INSERT INTO Schedule (scheduleNo, mId, scheduleTitle, startDate, endDate, scheduleContent, hName, rName, sName)
VALUES (scheduleNo_seq.NEXTVAL, 'kim', '드라이브여행', TO_TIMESTAMP('2023-10-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-10-04 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), '제주에서의 시원한 바닷바람과 함께하는 드라이브 여행', '위드시티호텔', '올레칠돈', '협재해수욕장');
    
-- BOOKMARK --
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME) 
    VALUES (bookmarkNo_seq.NEXTVAL, 'aaa', '호텔더원', NULL, NULL);
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME)
    VALUES (bookmarkNo_seq.NEXTVAL, 'kang', null, '올래국수', null);
INSERT INTO BOOKMARK (BOOKMARK_NO, MID, HNAME, RNAME, SNAME)
    VALUES (bookmarkNo_seq.NEXTVAL, 'kim', null, NULL, '한라산국립공원');

    
-- SPOTCOMMENT --
insert into spotComment (sCommentNo, sName, mId, sContent, sGroup, sStep, sIndent) values (sCommentNo_seq.nextval, '한라산국립공원', 'aaa', '높아서 오르지는 못했지만, 겨울에 가면 눈꽃으로 특히나 아름다운 산', sCommentNo_seq.CURRVAL, 0, 0);

insert into spotComment (sCommentNo, sName, mId, sContent, sGroup, sStep, sIndent) values (sCommentNo_seq.nextval, '성산일출봉(UNESCO 세계자연유산)', 'bbb', '아침 일찍 일출보러온 보람이 있습니다... 제주도 필수코스라고 생각해요', sCommentNo_seq.CURRVAL, 0, 0);

insert into spotComment (sCommentNo, sName, mId, sContent, sGroup, sStep, sIndent) values (sCommentNo_seq.nextval, '성산일출봉(UNESCO 세계자연유산)', 'aaa', '날씨 좋은날 일출 보러가면 너무 예뻐요', sCommentNo_seq.CURRVAL, 0, 0);

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
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '호텔더원', 'aaa', NULL, '깨끗하고 좋아요', hCommentNo_seq.CURRVAL, 0, 0, SYSDATE);
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '위드시티호텔', 'bbb', NULL, '공항에서 가까워서 편했어요', hCommentNo_seq.CURRVAL, 0, 0, SYSDATE);
INSERT INTO HOTELCOMMENT (HCOMMENTNO, HNAME, MID, BID, HCONTENT, HGROUP, HSTEP, HINDENT, HCRDATE)
    VALUES (hCommentNo_seq.NEXTVAL, '그라벨호텔', 'kim', NULL, '시내랑 가까워서 움직이기 좋아요', hCommentNo_seq.CURRVAL, 0, 0, SYSDATE);
    
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