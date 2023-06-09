DROP TABLE Review;
DROP TABLE Festival;
DROP TABLE hotelComment;
DROP TABLE restaurantComment;
DROP TABLE spotComment;
DROP TABLE Bookmark;
DROP TABLE Schedule;
DROP TABLE Hreservation;
DROP TABLE hotel;
DROP TABLE restaurant;
DROP TABLE spot;
DROP TABLE Member;
DROP TABLE Business;
DROP TABLE Admin;
DROP TABLE location;
DROP TABLE RestauranTtype;

DROP SEQUENCE FestivalNo_seq;
DROP SEQUENCE bookmarkNo_seq;
DROP SEQUENCE reviewNo_seq;
DROP SEQUENCE scheduleNo_seq;
DROP SEQUENCE sCommentNo_seq;
DROP SEQUENCE hCommentNo_seq;
DROP SEQUENCE rCommentNo_seq;
DROP SEQUENCE locationNo_seq;
DROP SEQUENCE RestauranTtypeNo_seq;

CREATE TABLE Member (
    mId VARCHAR2(50) PRIMARY KEY,
    mPw VARCHAR2(50) NOT NULL,
    mName VARCHAR2(50) NOT NULL,
    mTel VARCHAR2(50) NOT NULL,
    mEmail VARCHAR2(100) NOT NULL,
    mAddr VARCHAR2(200) NOT NULL,
    mDeAddr VARCHAR2(200) NOT NULL,
    mPost VARCHAR2(50) NOT NULL,
    mBirth DATE NOT NULL,
    mPhoto VARCHAR2(255),
    mRdate DATE DEFAULT SYSDATE NOT NULL
); -- 멤버 테이블


CREATE TABLE Admin (
    aId VARCHAR2(50) PRIMARY KEY,
    aPw VARCHAR2(50) NOT NULL,
    aName VARCHAR2(50) NOT NULL
); -- 관리자 테이블


CREATE TABLE Business (
    bId VARCHAR2(50) PRIMARY KEY,
    bPw VARCHAR2(50) NOT NULL,
    bName VARCHAR2(100) NOT NULL,
    bTel VARCHAR2(50) NOT NULL, --
    bEmail VARCHAR2(100) NOT NULL,
    bAddr VARCHAR2(200) NOT NULL, -- 일반주소
    bDeAddr VARCHAR2(200) NOT NULL, -- 상세주소
    bPost VARCHAR2(50) NOT NULL,  -- 우편번호
    bPhoto VARCHAR2(255),  -- 업체사진
    bRdate DATE DEFAULT SYSDATE NOT NULL
); -- 업체 테이블 

CREATE SEQUENCE reviewNo_seq MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE Review (
    reviewNO NUMBER(5) PRIMARY KEY,
    mId VARCHAR2(50) REFERENCES Member(mId) ON DELETE CASCADE,
    rTitle VARCHAR2(100) NOT NULL,
    rContent CLOB NOT NULL,
    rRdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rHit NUMBER(5) DEFAULT 0
); -- 후기 게시판 테이블

CREATE SEQUENCE festivalNo_seq MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE Festival (
    festivalNo NUMBER(5) PRIMARY KEY,
    aId VARCHAR2(50) REFERENCES Admin(aId) ON DELETE CASCADE,
    fTitle VARCHAR2(100) NOT NULL,
    fContent CLOB NOT NULL,
    fHit NUMBER(5) DEFAULT 0 NOT NULL,
    fRdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); -- 축제 테이블

CREATE SEQUENCE locationNo_seq MAXVALUE 99 NOCACHE NOCYCLE;
CREATE TABLE location (
    locationNo NUMBER(2) PRIMARY KEY,
    lName VARCHAR2(50)
); -- 지역테이블

CREATE SEQUENCE RestauranTtypeNo_seq MAXVALUE 99 NOCACHE NOCYCLE;
CREATE TABLE RestauranTtype (
    RestauranTtypeNo NUMBER(2) PRIMARY KEY,
    RTName VARCHAR2(50)
); -- 식당종류 테이블

CREATE TABLE hotel (
  hName VARCHAR2(50) PRIMARY KEY,
  bId VARCHAR2(50) REFERENCES Business(bId) ON DELETE CASCADE,
  locationNo NUMBER(5) REFERENCES location(locationNo) ON DELETE CASCADE,
  hAddr VARCHAR2(255),
  hTel VARCHAR2(50),
  hLink VARCHAR2(200),
  hInfo CLOB NOT NULL,
  inTime VARCHAR2(50) NOT NULL,
  outTime VARCHAR2(50) NOT NULL,
  hMainImg VARCHAR2(255) NOT NULL,
  hSubImg_1 VARCHAR2(255),
  hSubImg_2 VARCHAR2(255),
  hSubImg_3 VARCHAR2(255),
  hLatitude NUMBER(10, 6), -- 위도
  hLongitude NUMBER(10, 6), -- 경도
  hPrice NUMBER(8),
  requestStatus VARCHAR(1) DEFAULT 'P'  -- P:대기, A:승인, R:거절
); -- 숙소 테이블

CREATE TABLE Hreservation (
    mID VARCHAR2(50),
    hNAME VARCHAR2(50) REFERENCES HOTEL(hNAME),
    inDate DATE NOT NULL,  
    outDate DATE NOT NULL
); -- 호텔 예약 테이블

                      
CREATE TABLE restaurant (
  rName VARCHAR2(50) PRIMARY KEY,
  bId VARCHAR2(50) REFERENCES Business(bId) ON DELETE CASCADE,
  locationNo NUMBER(5) REFERENCES location(locationNo),
  RestauranTtypeNo NUMBER(5) REFERENCES RestauranTtype(RestauranTtypeNo),
  rAddr VARCHAR2(200),
  rTel VARCHAR2(20),
  rLink VARCHAR2(200),
  rInfo CLOB NOT NULL,
  rMENU VARCHAR2(50) NOT NULL,
  rMainImg VARCHAR2(255) NOT NULL,
  rSubImg_1 VARCHAR2(255),
  rSubImg_2 VARCHAR2(255),
  rSubImg_3 VARCHAR2(255),
  rLatitude NUMBER(10, 6), -- 위도
  rLongitude NUMBER(10, 6), -- 경도
  rPrice VARCHAR2(2000),
  requestStatus VARCHAR(1) DEFAULT 'P'
); -- 맛집 테이블

CREATE TABLE spot (
  sName VARCHAR2(50) PRIMARY KEY,
  aId VARCHAR2(50) REFERENCES ADMIN(aId) ON DELETE CASCADE,
  locationNo NUMBER(5) REFERENCES location(locationNo),
  sAddr VARCHAR2(200),
  sTel VARCHAR2(50),
  sLink VARCHAR2(200),
  sInfo CLOB NOT NULL,
  sTime VARCHAR2(2000),
  sMainImg VARCHAR2(255) NOT NULL,
  sSubImg_1 VARCHAR2(255),
  sSubImg_2 VARCHAR2(255),
  sSubImg_3 VARCHAR2(255),
  Slatitude NUMBER(10, 6) NOT NULL, -- 위도
  Slongitude NUMBER(10, 6) NOT NULL, -- 경도
  sPrice VARCHAR2(2000)
); -- 관광지 테이블

CREATE SEQUENCE scheduleNo_seq MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE Schedule (
    scheduleNo NUMBER(5) PRIMARY KEY,
    mId VARCHAR2(50) REFERENCES Member(mId) ON DELETE CASCADE,
    scheduleTitle VARCHAR2(100) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    ScheduleContent CLOB NOT NULL
); -- 일정관리 테이블


CREATE SEQUENCE bookmarkNo_seq MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE Bookmark (
    bookmark_no NUMBER(5) PRIMARY KEY,
    mId VARCHAR2(50) REFERENCES Member(mId) ON DELETE CASCADE,
    hName VARCHAR2(50) REFERENCES hotel(hName),
    rName VARCHAR2(50) REFERENCES restaurant(rName),
    sName VARCHAR2(50) REFERENCES spot(sName),
    hMainImg VARCHAR2(255),
    RMainImg VARCHAR2(255),
    SMainImg VARCHAR2(255),
    bookmarkdate DATE DEFAULT SYSDATE
); -- 즐겨찾기 테이블

CREATE SEQUENCE hCommentNo_seq MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE hotelComment (
    hCommentNo NUMBER(5) PRIMARY KEY,
    hName VARCHAR2(50) REFERENCES HOTEL(hName),
    mId VARCHAR2(50) REFERENCES Member(mId) ON DELETE CASCADE,
    bId VARCHAR2(50) REFERENCES BUSINESS(bId) ON DELETE CASCADE,
    hContent CLOB NOT NULL,
    hGroup NUMBER(5) NOT NULL,
    hStep NUMBER(5) NOT NULL,       -- 출력순서
    hIndent NUMBER(5) NOT NULL,     -- 들여쓰기
    hCrdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); -- 숙소댓글 테이블

CREATE SEQUENCE rCommentNo_seq MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE restaurantComment (
    rCommentNo NUMBER(5) PRIMARY KEY,
    rName VARCHAR2(50) REFERENCES restaurant(rName),
    mId VARCHAR2(50) REFERENCES Member(mId) ON DELETE CASCADE,
    bId VARCHAR2(50) REFERENCES BUSINESS(bId) ON DELETE CASCADE,
    rContent CLOB NOT NULL,
    rGroup NUMBER(5) NOT NULL,
    rStep NUMBER(5) NOT NULL,
    rIndent NUMBER(5) NOT NULL,
    rCrdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);  -- 맛집 댓글 테이블

CREATE SEQUENCE sCommentNo_seq MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE spotComment (
    sCommentNo NUMBER(5) PRIMARY KEY,
    sName VARCHAR2(50) REFERENCES SPOT(sName),
    mId VARCHAR2(50) REFERENCES Member(mId) ON DELETE CASCADE,
    sContent CLOB NOT NULL,
    sGroup NUMBER(5) NOT NULL,
    sStep NUMBER(5) NOT NULL,
    sIndent NUMBER(5) NOT NULL,
    sCrdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); -- 관광지 댓글 테이블

SELECT * FROM restaurant;
SELECT * FROM restaurantComment;
SELECT * FROM Festival;
SELECT * FROM MEMBER;
SELECT * FROM BOOKMARK;
SELECT * FROM RestauranTtype;
SELECT * FROM Review;
SELECT * FROM hotelComment;
SELECT * FROM spotComment;
SELECT * FROM Schedule;
SELECT * FROM Hreservation;
SELECT * FROM hotel;
SELECT * FROM spot;
SELECT * FROM Business;
SELECT * FROM Admin;
SELECT * FROM LOCATION;
COMMIT;
--select * from v$resource_limit where resource_name = 'processes';
--alter system set processes=300 scope=spfile;
--shutdown immediate; --셧다운
--startup; --재시작