CREATE SEQUENCE seq_memNo;

CREATE SEQUENCE SEQ_UNO
  START WITH 57
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE TABLE member(
UNO NUMBER(7) NOT NULL PRIMARY KEY,
UNM	 varchar2(100) NOT null,
PWD varchar2(100) NOT null,
BIRTH DATE,
PHOTO varchar2(200) NULL,
SEX varchar2(20),
entrDate date NOT NULL,
jobRank varchar2(2) NOT NULL,
jobSkill varchar2(2) NOT NULL,
devPt varchar2(2) NOT NULL,
inoffi_sts varchar2(2) NOT NULL,
mblNo varchar2(20),
emailAddr varchar2(100),
delete_col char(2)
);

ALTER TABLE MEMBER
ADD u_id varchar2(20);

SELECT * FROM MEMBER;

DROP TABLE MEMBER;

INSERT INTO member (uNO,unm,pwd,birth,photo,sex,entrDate,jobRank,jobSkill,devPt,inoffi_sts,mblNo,emailAddr,delete_col) 
values('1234534','이지수','1wltn@23',DATE'1998-11-21','','02',DATE'2023-06-07','08','04','02','01','01012344321','wltnlee@naver.com','02');

INSERT INTO member (uNO,unm,pwd,birth,photo,sex,entrDate,jobRank,jobSkill,devPt,inoffi_sts,mblNo,emailAddr,delete_col) 
values('5437738','김길동','skdpf@!32',DATE'1998-02-07','','01',DATE'2013-03-20','05','02','01','01','01043221123','kimgd@hanmail.com','02');

INSERT INTO member (uNO,unm,pwd,birth,photo,sex,entrDate,jobRank,jobSkill,devPt,inoffi_sts,mblNo,emailAddr,delete_col) 
values('4739428','윤솔','solwjswo!1',DATE'2000-04-12','','02',DATE'2023-10-12','08','04','03','01','01022304499','usol@gmail.com','02');

INSERT INTO member (uNO,unm,pwd,birth,photo,sex,entrDate,jobRank,jobSkill,devPt,inoffi_sts,mblNo,emailAddr,delete_col) 
values('5960953','신나라','funword1!$',DATE'1987-07-08','','02',DATE'2010-10-10','04','02','01','01','01033228785','sin_world@naver.com','02');

INSERT INTO member (uNO,unm,pwd,birth,photo,sex,entrDate,jobRank,jobSkill,devPt,inoffi_sts,mblNo,emailAddr,delete_col) 
values('5967238','김형욱','dogandc@t',DATE'1980-02-01','','01',DATE'2020-09-09','04','02','01','02','01012991599','wooki@hanmail.com','02');

INSERT INTO member (uNO,unm,pwd,birth,photo,sex,entrDate,jobRank,jobSkill,devPt,inoffi_sts,mblNo,emailAddr,delete_col) 
values('3895094','김말숙','lastse2t!',DATE'1999-09-11','','02',DATE'2023-01-04','08','04','03','01','01099881990','malsuk@naver.com','02');

INSERT INTO member (uNO,unm,pwd,birth,photo,sex,entrDate,jobRank,jobSkill,devPt,inoffi_sts,mblNo,emailAddr,delete_col) 
values('5849839','마진가','masaj!9o',DATE'1990-09-19','','01',DATE'2021-04-07','08','04','02','01','01077813347','majjin@gmail.com','02');

INSERT INTO member (uNO,unm,pwd,birth,photo,sex,entrDate,jobRank,jobSkill,devPt,inoffi_sts,mblNo,emailAddr,delete_col) 
values('4893247','가일권','onefi%@11',DATE'1992-03-21','','01',DATE'2023-04-22','08','04','02','01','01011277889','onefist@naver.com','02');

INSERT INTO member (uNO,unm,pwd,birth,photo,sex,entrDate,jobRank,jobSkill,devPt,inoffi_sts,mblNo,emailAddr,delete_col) 
values('5985902','김이노','dl!sh2tm',DATE'1985-08-10','','01',DATE'2023-01-23','08','03','01','01','01019221922','inokim@gmail.com','02');

INSERT INTO member (uNO,unm,pwd,birth,photo,sex,entrDate,jobRank,jobSkill,devPt,inoffi_sts,mblNo,emailAddr,delete_col) 
values('5984920','김고로','dimon*098',DATE '1988-07-19','','01',DATE'2020-09-11','07','03','01','01','01015881744','dimon@naver.com','02');

INSERT INTO "MEMBER"(UNO, UNM, PWD, BIRTH, PHOTO, SEX, ENTRDATE, JOBRANK, JOBSKILL, DEVPT, INOFFI_STS, MBLNO, EMAILADDR, DELETE_COL)
VALUES('8922332', '맨자구', 'mjjy0207=', DATE '1989-07-22', 'null', '02', DATE'2023-10-19', '08', '04', '01', '01', '01022333990', 'dead18@daum.net', '02');

INSERT INTO "MEMBER"
(UNO, UNM, PWD, BIRTH, PHOTO, SEX, ENTRDATE, JOBRANK, JOBSKILL, DEVPT, INOFFI_STS, MBLNO, EMAILADDR, DELETE_COL)
VALUES('8302932', '막둥이', 'makdy0107@', DATE'1989-07-22', 'null', '01', DATE'2023-03-19', '08', '04', '01', '01', '01022333990', 'deadto@daum.net', '02');

INSERT INTO "MEMBER"
(UNO, UNM, PWD, BIRTH, PHOTO, SEX, ENTRDATE, JOBRANK, JOBSKILL, DEVPT, INOFFI_STS, MBLNO, EMAILADDR, DELETE_COL)
VALUES('1442232', '김담비', 'bombi007!=', DATE'2000-04-20', 'null', '02', DATE'2023-10-22', '08', '04', '01', '01', '01044531451', 'bombi@naver.com', '02');

INSERT INTO "MEMBER"
(UNO, UNM, PWD, BIRTH, PHOTO, SEX, ENTRDATE, JOBRANK, JOBSKILL, DEVPT, INOFFI_STS, MBLNO, EMAILADDR, DELETE_COL)
VALUES('2053121', '김밤비', 'dambi007!=', DATE'1988-04-20', 'null', '02', DATE'2019-10-20', '06', '03', '01', '01', '01044220990', 'dambi@naver.com', '02');

INSERT INTO "MEMBER"
(UNO, UNM, PWD, BIRTH, PHOTO, SEX, ENTRDATE, JOBRANK, JOBSKILL, DEVPT, INOFFI_STS, MBLNO, EMAILADDR, DELETE_COL)
VALUES('1239909', '강주아', 'jua09@1', DATE'2001-02-05', 'null', '02', DATE'2023-10-19', '08', '04', '01', '01', '01099050211', 'kangjua@naver.com', '01');


INSERT ALL
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234544', '더미1', '비밀번호1', DATE '1990-01-01', '', '01', DATE '2022-01-01', '01', '01', '01', '01', '01012340001', 'dummy1@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234545', '더미2', '비밀번호2', DATE '1990-01-02', '', '01', DATE '2022-01-02', '01', '01', '01', '01', '01012340002', 'dummy2@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234546', '더미3', '비밀번호3', DATE '1990-01-03', '', '01', DATE '2022-01-03', '01', '01', '01', '01', '01012340003', 'dummy3@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234547', '더미4', '비밀번호4', DATE '1990-01-04', '', '01', DATE '2022-01-04', '01', '01', '01', '01', '01012340004', 'dummy4@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234548', '더미5', '비밀번호5', DATE '1990-01-05', '', '01', DATE '2022-01-05', '01', '01', '01', '01', '01012340005', 'dummy5@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234549', '더미6', '비밀번호6', DATE '1990-01-06', '', '01', DATE '2022-01-06', '01', '01', '01', '01', '01012340006', 'dummy6@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234550', '더미7', '비밀번호7', DATE '1990-01-07', '', '01', DATE '2022-01-07', '01', '01', '01', '01', '01012340007', 'dummy7@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234551', '더미8', '비밀번호8', DATE '1990-01-08', '', '01', DATE '2022-01-08', '01', '01', '01', '01', '01012340008', 'dummy8@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234552', '더미9', '비밀번호9', DATE '1990-01-09', '', '01', DATE '2022-01-09', '01', '01', '01', '01', '01012340009', 'dummy9@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234553', '더미10', '비밀번호10', DATE '1990-01-10', '', '01', DATE '2022-01-10', '01', '01', '01', '01', '01012340010', 'dummy10@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234554', '더미11', '비밀번호11', DATE '1990-01-11', '', '01', DATE '2022-01-11', '01', '01', '01', '01', '01012340011', 'dummy11@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234555', '더미12', '비밀번호12', DATE '1990-01-12', '', '01', DATE '2022-01-12', '01', '01', '01', '01', '01012340012', 'dummy12@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234556', '더미13', '비밀번호13', DATE '1990-01-13', '', '01', DATE '2022-01-13', '01', '01', '01', '01', '01012340013', 'dummy13@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234557', '더미14', '비밀번호14', DATE '1990-01-14', '', '01', DATE '2022-01-14', '01', '01', '01', '01', '01012340014', 'dummy14@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234558', '더미15', '비밀번호15', DATE '1990-01-15', '', '01', DATE '2022-01-15', '01', '01', '01', '01', '01012340015', 'dummy15@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234559', '더미16', '비밀번호16', DATE '1990-01-16', '', '01', DATE '2022-01-16', '01', '01', '01', '01', '01012340016', 'dummy16@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234560', '더미17', '비밀번호17', DATE '1990-01-17', '', '01', DATE '2022-01-17', '01', '01', '01', '01', '01012340017', 'dummy17@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234561', '더미18', '비밀번호18', DATE '1990-01-18', '', '01', DATE '2022-01-18', '01', '01', '01', '01', '01012340018', 'dummy18@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234562', '더미19', '비밀번호19', DATE '1990-01-19', '', '01', DATE '2022-01-19', '01', '01', '01', '01', '01012340019', 'dummy19@example.com', '02')
  SELECT 1 FROM DUAL;
  
INSERT ALL
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234520', '더미20', '비밀번호20', DATE '1990-01-20', '', '01', DATE '2022-01-20', '01', '01', '01', '01', '01012340020', 'dummy20@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234521', '더미21', '비밀번호21', DATE '1990-01-21', '', '01', DATE '2022-01-21', '01', '01', '01', '01', '01012340021', 'dummy21@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234522', '더미22', '비밀번호22', DATE '1990-01-22', '', '01', DATE '2022-01-22', '01', '01', '01', '01', '01012340022', 'dummy22@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234523', '더미23', '비밀번호23', DATE '1990-01-23', '', '01', DATE '2022-01-23', '01', '01', '01', '01', '01012340023', 'dummy23@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234524', '더미24', '비밀번호24', DATE '1990-01-24', '', '01', DATE '2022-01-24', '01', '01', '01', '01', '01012340024', 'dummy24@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234525', '더미25', '비밀번호25', DATE '1990-01-25', '', '01', DATE '2022-01-25', '01', '01', '01', '01', '01012340025', 'dummy25@example.com', '02')
SELECT 1 FROM DUAL;

INSERT ALL
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234526', '더미26', '비밀번호26', DATE '1990-01-26', '', '01', DATE '2022-01-26', '01', '01', '01', '01', '01012340026', 'dummy26@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234527', '더미27', '비밀번호27', DATE '1990-01-27', '', '01', DATE '2022-01-27', '01', '01', '01', '01', '01012340027', 'dummy27@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234528', '더미28', '비밀번호28', DATE '1990-01-28', '', '01', DATE '2022-01-28', '01', '01', '01', '01', '01012340028', 'dummy28@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234529', '더미29', '비밀번호29', DATE '1990-01-29', '', '01', DATE '2022-01-29', '01', '01', '01', '01', '01012340029', 'dummy29@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234530', '더미30', '비밀번호30', DATE '1990-01-30', '', '01', DATE '2022-01-30', '01', '01', '01', '01', '01012340030', 'dummy30@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('1234531', '더미31', '비밀번호31', DATE '1990-01-31', '', '01', DATE '2022-01-31', '01', '01', '01', '01', '01012340031', 'dummy31@example.com', '02')
SELECT 1 FROM DUAL;

INSERT ALL
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('2000001', '더미32', '비밀번호32', TO_DATE('1990-02-01', 'YYYY-MM-DD'), '', '01', TO_DATE('1999-02-01', 'YYYY-MM-DD'), '01', '01', '01', '01', '01012340032', 'dummy32@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('2000002', '더미33', '비밀번호33', TO_DATE('1990-02-02', 'YYYY-MM-DD'), '', '01', TO_DATE('2000-02-02', 'YYYY-MM-DD'), '01', '01', '01', '01', '01012340033', 'dummy33@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('2000003', '더미34', '비밀번호34', TO_DATE('1990-02-03', 'YYYY-MM-DD'), '', '01', TO_DATE('2001-02-03', 'YYYY-MM-DD'), '01', '01', '01', '01', '01012340034', 'dummy34@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES ('2000004', '더미35', '비밀번호35', TO_DATE('1990-02-04', 'YYYY-MM-DD'), '', '01', TO_DATE('2002-02-04', 'YYYY-MM-DD'), '01', '01', '01', '01', '01012340035', 'dummy35@example.com', '02')
  INTO member (uNO, unm, pwd, birth, photo, sex, entrDate, jobRank, jobSkill, devPt, inoffi_sts, mblNo, emailAddr, delete_col)
  VALUES (SEQ_UNO.NEXTVAL, '더미36', '비밀번호36', TO_DATE('1990-02-05', 'YYYY-MM-DD'), '', '01', TO_DATE('2003-02-05', 'YYYY-MM-DD'), '01', '01', '01', '01', '01012340036', 'dummy36@example.com', '02')
SELECT 1 FROM DUAL;



CREATE SEQUENCE project_seq
      MAXVALUE 9999
      NOCYCLE
      NOCACHE;

DROP SEQUENCE project_SEQ;

CREATE TABLE project(
pjtNo number(25) NOT NULL PRIMARY KEY,
pjtNm varchar2(200) NOT NULL,
pjtFromDate date NOT NULL,
pjtToDate date NULL,
compyNo varchar2(4) NOT null
);

DROP TABLE project;

SELECT * FROM PROJECT;

INSERT INTO project (pjtNo, pjtNm, pjtFromDate, pjtToDate, compyNo)
values(project_seq.nextval,'삼성 A001 프로젝트',DATE '2017-05-16', DATE '2018-08-14','01');

INSERT INTO project (pjtNo, pjtNm, pjtFromDate, pjtToDate, compyNo)
values(project_seq.nextval,'롯데 B010 프로젝트',DATE '2019-11-05',DATE '2020-10-20','05');

INSERT INTO project (pjtNo, pjtNm, pjtFromDate, pjtToDate, compyNo)
values(project_seq.nextval,'두산 C001 프로젝트',DATE '2019-12-05',DATE '2020-11-30','10');

INSERT INTO project (pjtNo, pjtNm, pjtFromDate, pjtToDate, compyNo)
values(project_seq.nextval,'동부 D021 프로젝트',DATE '2020-05-16',DATE '2021-08-14','07');

INSERT INTO project (pjtNo, pjtNm, pjtFromDate, pjtToDate, compyNo)
values(project_seq.nextval,'LG E301 프로젝트',DATE '2021-03-05',DATE '2024-06-11','04');

INSERT INTO project (pjtNo, pjtNm, pjtFromDate, pjtToDate, compyNo)
values(project_seq.nextval,'한화 F111 프로젝트 ',DATE '2022-04-05',DATE '2024-09-15','06');

INSERT INTO project (pjtNo, pjtNm, pjtFromDate, pjtToDate, compyNo)
values(project_seq.nextval,'현대 자동차 E101 프로젝트',DATE '2023-02-05',DATE '2024-06-18','12');

INSERT INTO project (pjtNo, pjtNm, pjtFromDate, pjtToDate, compyNo)
values(project_seq.nextval,'CJ F201 프로젝트',DATE '2023-11-01',DATE '2024-05-10','02');

INSERT INTO project (pjtNo, pjtNm, pjtFromDate, pjtToDate, compyNo)
values(project_seq.nextval,'GS B221 프로젝트',DATE '2023-04-05',DATE '2024-01-22','08');

INSERT INTO project (pjtNo, pjtNm, pjtFromDate, pjtToDate, compyNo)
values(project_seq.nextval,'SK S501 프로젝트',DATE '2021-04-05',DATE '2021-10-15','03');


CREATE SEQUENCE MemberP_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE;
DROP SEQUENCE MemberP_SEQ;


CREATE TABLE MEMBER_project(
  uNo NUMBER(7) NOT NULL,
  pjtNo NUMBER(25) NOT NULL,
  INP_DATE DATE NULL,
  WDP_ToDate DATE NULL,
  pjtRole VARCHAR2(2) NULL,
  CONSTRAINT pk_member_project PRIMARY KEY (uNo, pjtNo),
  CONSTRAINT fk_member_project_uno FOREIGN KEY (uNo) REFERENCES MEMBER(UNO),
  CONSTRAINT fk_member_project_pjtno FOREIGN KEY (pjtNo) REFERENCES PROJECT(PJTNO)
);

DROP TABLE MEMBER_PROJECT; 

INSERT INTO member_project(uNO,pjtNo, pjt_FromDate,pjt_ToDate,pjtRole)
values('5849839','1',DATE '2017-05-16',DATE '2018-08-14','01');

INSERT INTO member_project (uNO, pjtNo, pjt_FromDate, pjt_ToDate, pjtRole)
VALUES ('5849839', '3', DATE '2019-1-05', DATE '2020-10-20', '01');

INSERT INTO member_project (uNO, pjtNo, pjt_FromDate, pjt_ToDate, pjtRole)
VALUES ('5849839', '10', DATE '2021-04-05', DATE '2021-10-15', '02');

INSERT INTO member_project (uNO, pjtNo, pjt_FromDate, pjt_ToDate, pjtRole)
VALUES ('5849839', '5', DATE '2022-01-01', DATE '2023-11-30', '01');

INSERT INTO member_project (uNO, pjtNo, pjt_FromDate, pjt_ToDate, pjtRole)
VALUES ('1234534', '5', DATE '2021-03-05', DATE '2023-10-11', '08');

INSERT INTO member_project (uNO, pjtNo, pjt_FromDate, pjt_ToDate, pjtRole)
VALUES ('5437738', '2', DATE '2019-11-05', DATE '2020-10-20', '08');

-- 김길동 회원
INSERT INTO member_project (uNO, pjtNo, pjt_FromDate, pjt_ToDate, pjtRole)
VALUES ('5437738', '6', DATE '2022-04-05', DATE '2023-11-28', '08');

-- 윤솔 회원
INSERT INTO member_project (uNO, pjtNo, pjt_FromDate, pjt_ToDate, pjtRole)
VALUES ('4739428', '3', DATE '2019-12-05', DATE '2020-11-30', '08');

-- 신나라 회원
INSERT INTO member_project (uNO, pjtNo, pjt_FromDate, pjt_ToDate, pjtRole)
VALUES ('5960953', '7', DATE '2023-02-05', DATE '2024-06-18', '08');

/*-- 김형욱 회원
INSERT INTO member_project (mpn, uNO, pjtNo, pjt_FromDate, pjt_ToDate, pjtRole)
VALUES (MemberP_SEQ.NEXTVAL, '5967238', '6', DATE '2022-04-05', DATE '2023-11-28', '08');*/



SELECT * FROM member_project;


DROP seqence 

CREATE TABLE code(
code varchar2(4) NOT NULL,
codeNm varchar2(20) NOT NULL
);

INSERT INTO code(code, codeNm)
values('D100','성별');

INSERT INTO code(code, codeNm)
values('D200','직급');

INSERT INTO code(code, codeNm)
values('D300','기술등급');

INSERT INTO code(code, codeNm)
values('D400','개발분야');

INSERT INTO code(code, codeNm)
values('D500','재직상태');

INSERT INTO code(code, codeNm)
values('D600','고객사');

INSERT INTO code(code, codeNm)
values('D700','프로젝트_역할');

INSERT INTO code(code, codeNm)
values('D800','삭제여부');

SELECT * FROM code;


CREATE TABLE dtl_code(
code varchar2(4) NOT NULL,
dtl_Cd varchar2(4) NOT NULL,
dtl_CdNm varchar2(20) NOT NULL,

CONSTRAINT dtl_pk PRIMARY KEY (code,dtl_Cd)
);

CREATE TABLE dtl_code(
  code varchar2(4) NOT NULL,
  dtl_Cd varchar2(4) NOT NULL,
  dtl_CdNm varchar2(40) NOT NULL,
  CONSTRAINT dtl_pk PRIMARY KEY (code, dtl_Cd)
);

DROP TABLE dtl_code;

INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D100','01','남자');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D100','02','여자');

INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D200','01','사장');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D200','02','상무');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D200','03','이사');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D200','04','부장');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D200','05','차장');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D200','06','과장');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D200','07','대리');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D200','08','사원');

INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D300','01','특급');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D300','02','고급');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D300','03','중급');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D300','04','초급');

INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D400','01','풀스텍');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D400','02','백엔드');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D400','03','프론트엔드');

INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D500','01','재직');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D500','02','휴직');


INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D600','01','삼성');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D600','02','cj');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D600','03','SK');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D600','04','LG');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D600','05','롯데');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D600','06','한화');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D600','07','농협');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D600','08','GS');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D600','09','신세계');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D600','10','두산');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D600','11','동부');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D600','12','현대자동차');

INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D700','01','Project Manager');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D700','02','Project Leader');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D700','03','Application Architect');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D700','04','Technical Architect');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D700','05','Data Architect');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D700','06','Quality Architect');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D700','07','Business Architect');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D700','08','Developer');


INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D800','01','삭제');
INSERT INTO dtl_code(code, dtl_cd,dtl_CdNm)values('D800','02','보관');


SELECT * FROM MEMBER;
SELECT * FROM PROJECT;
SELECT * FROM MEMBER_PROJECT;
SELECT * FROM code;
SELECT * FROM DTL_CODE;


 ALTER TABLE EX00."MEMBER" MODIFY UNO NUMBER(10,0) NOT NULL;


SELECT * FROM dtl_code;
SELECT code, dtl_cd FROM dtl_code WHERE code = 'D700' AND dtl_cd = '03';

--이거 파일 업로드 할때 쓸려고 만든 테이블
CREATE TABLE photo(
UUID VARCHAR2(1000) CONSTRAINT PK_FILE PRIMARY KEY,
UPLOAD_PATH VARCHAR2(500),
FILE_NAME VARCHAR2(500),
FILE_TYPE CHAR(1),
NUO VARCHAR2(50),
CONSTRAINT FK_FILE FOREIGN KEY (UNO) REFERENCES MEMBER(UNO)
);


SELECT m.uNO, m.unm, m.pwd, m.birth, dc.dtl_CdNm AS sex, m.entrDate, m.jobRank, m.jobSkill, m.devPt, m.inoffi_sts, m.mblNo, m.emailAddr, m.delete_col
FROM member m
JOIN dtl_code dc ON m.sex = dc.dtl_cd AND dc.code = 'D100'
WHERE m.uNO = '1234534';

/* 전체 검색 조인 해서*/
SELECT m.uNO AS UNO, m.unm AS UNM, m.pwd AS PWD, m.birth AS BIRTH, se.dtl_CdNm AS sex, m.entrDate AS ENTRDATE, 
       jr.DTL_CDNM  AS JOBRANK, js.DTL_CDNM  AS JOBSKILL, dp.DTL_CDNM AS DEVPT, io.DTL_CDNM AS INOFFI_STS, 
       m.mblNo AS MBLNO, m.emailAddr AS EMAILADDR,  dl.DTL_CDNM AS DELETE_COL
FROM member m
JOIN dtl_code se ON m.sex = se.dtl_cd AND se.code = 'D100'
JOIN dtl_code jr ON m.jobRank = jr.DTL_CD  AND jr.CODE ='D200'
JOIN dtl_code js ON m.jobSkill = js.DTL_CD  AND js.CODE ='D300'
JOIN dtl_code dp ON m.devPt = dp.DTL_CD  AND dp.CODE ='D400'
JOIN dtl_code io ON m.inoffi_sts = io.DTL_CD  AND io.CODE ='D500'
JOIN dtl_code dl ON m.delete_col = dl.DTL_CD AND dl.CODE ='D800'
;

/*개인 검색 조인해서*/
SELECT m.uNO AS UNO, m.unm AS UNM, m.pwd AS PWD, m.birth AS BIRTH, se.dtl_CdNm AS sex, m.entrDate AS ENTRDATE, 
       jr.DTL_CDNM  AS JOBRANK, js.DTL_CDNM  AS JOBSKILL, dp.DTL_CDNM AS DEVPT, io.DTL_CDNM AS INOFFI_STS, 
       m.mblNo AS MBLNO, m.emailAddr AS EMAILADDR,  dl.DTL_CDNM AS DELETE_COL
FROM member m
JOIN dtl_code se ON m.sex = se.dtl_cd AND se.code = 'D100'
JOIN dtl_code jr ON m.jobRank = jr.DTL_CD  AND jr.CODE ='D200'
JOIN dtl_code js ON m.jobSkill = js.DTL_CD  AND js.CODE ='D300'
JOIN dtl_code dp ON m.devPt = dp.DTL_CD  AND dp.CODE ='D400'
JOIN dtl_code io ON m.inoffi_sts = io.DTL_CD  AND io.CODE ='D500'
JOIN dtl_code dl ON m.delete_col = dl.DTL_CD AND dl.CODE ='D800'
WHERE m.uNO = '1234534';


SELECT m.uNO AS 사번, m.unm AS 이름, m.pwd AS 비밀번호, m.birth AS 생일, se.dtl_CdNm AS 성별, m.entrDate AS 입사일
, jr.DTL_CDNM AS 직급 , js.DTL_CDnm AS 기술등급, dp.DTL_CDNM AS 개발분야, io.DTL_CDNM AS 재직상태 , m.mblNo AS 핸드폰, m.emailAddr AS 이메일
, dl.DTL_CDNM AS 보관여부
FROM member m
JOIN dtl_code se ON m.sex = se.dtl_cd AND se.code = 'D100'
JOIN dtl_code jr ON m.jobRank = jr.DTL_CD  AND jr.CODE ='D200'
JOIN dtl_code js ON m.jobSkill = js.DTL_CD  AND js.CODE ='D300'
JOIN dtl_code dp ON m.devPt = dp.DTL_CD  AND dp.CODE ='D400'
JOIN dtl_code io ON m.inoffi_sts = io.DTL_CD  AND io.CODE ='D500'
JOIN dtl_code dl ON m.delete_col = dl.DTL_CD AND dl.CODE ='D800'
WHERE m.uNO = '1234534';


SELECT m.uNO AS 사번, m.unm AS 이름, m.pwd AS 비밀번호, m.birth AS 생일, se.dtl_CdNm AS 성별, m.entrDate AS 입사일
, jr.DTL_CDNM AS 직급 , js.DTL_CDnm AS 기술등급, dp.DTL_CDNM AS 개발분야, io.DTL_CDNM AS 재직상태 , m.mblNo AS 핸드폰, m.emailAddr AS 이메일
, dl.DTL_CDNM AS 보관여부
FROM member m
JOIN dtl_code se ON m.sex = se.dtl_cd AND se.code = 'D100'
JOIN dtl_code jr ON m.jobRank = jr.DTL_CD  AND jr.CODE ='D200'
JOIN dtl_code js ON m.jobSkill = js.DTL_CD  AND js.CODE ='D300'
JOIN dtl_code dp ON m.devPt = dp.DTL_CD  AND dp.CODE ='D400'
JOIN dtl_code io ON m.inoffi_sts = io.DTL_CD  AND io.CODE ='D500'
JOIN dtl_code dl ON m.delete_col = dl.DTL_CD AND dl.CODE ='D800'
;

SELECT UNO, UNM, PWD, BIRTH, PHOTO, SEX, ENTRDATE, JOBRANK, JOBSKILL, DEVPT,
		INOFFI_STS, MBLNO, EMAILADDR, DELETE_COL
FROM MEMBER;

SELECT UNO, UNM, PWD, TO_CHAR(birth, 'YYYY-MM-DD') AS BIRTH, PHOTO, SEX, TO_CHAR(ENTRDATE, 'YYYY-MM-DD') AS ENTRDATE, JOBRANK, JOBSKILL, DEVPT,
INOFFI_STS, MBLNO, EMAILADDR, DELETE_COL
FROM MEMBER;

SELECT UNO, UNM, PWD, DATEOF(BIRTH) AS BIRTH, PHOTO, SEX, DATEOF(ENTRDATE) AS ENTRDATE, JOBRANK, JOBSKILL, DEVPT, INOFFI_STS, MBLNO, EMAILADDR, DELETE_COL
FROM MEMBER;

SELECT * FROM MEMBER;
UPDATE MEMBER SET birth='1998-11-21' WHERE uno = 1234534;
COMMIT;


SELECT /*+ INDEX_DESC(member, SYS_C007111)*/ UNO, UNM, PWD,  BIRTH, PHOTO, SEX, ENTRDATE, JOBRANK, JOBSKILL, DEVPT, INOFFI_STS, MBLNO, EMAILADDR, DELETE_COL
FROM MEMBER;



SELECT
    M.UNO,
    M.UNM,
    DC1.DTL_CDNM AS JOBRANK,
    MP.PJT_FROMDATE,
    MP.PJT_TODATE,
    DC2.DTL_CDNM AS ROLE,
    P.PJTNO,
    P.PJTNM,
    DC3.DTL_CDNM AS COMPANYNM
FROM
    MEMBER M
JOIN
    MEMBER_PROJECT MP ON M.UNO = MP.UNO
JOIN
    PROJECT P ON MP.PJTNO = P.PJTNO
JOIN
    DTL_CODE DC3 ON P.COMPYNO = DC3.DTL_CD AND DC3.CODE = 'D600'
JOIN
    DTL_CODE DC1 ON M.JOBRANK = DC1.DTL_CD AND DC1.CODE = 'D200'
JOIN
    DTL_CODE DC2 ON MP.PJTROLE = DC2.DTL_CD AND DC2.CODE = 'D700'
WHERE
    M.UNO = '5849839';

   
   
   SELECT
	    M.UNO
	    ,M.UNM
	    ,DC1.DTL_CDNM AS JOBRANK
	    ,MP.PJT_FROMDATE
	    ,MP.PJT_TODATE
	    ,DC2.DTL_CDNM AS ROLE
	    ,P.PJTNO
	    ,P.PJTNM
	    ,DC3.DTL_CDNM AS COMPANYNM
	FROM
    MEMBER M
		JOIN
		    MEMBER_PROJECT MP ON M.UNO = MP.UNO
		JOIN
		    PROJECT P ON MP.PJTNO = P.PJTNO
		JOIN
		    DTL_CODE DC3 ON (P.COMPYNO = DC3.DTL_CD AND DC3.CODE = 'D600')
		JOIN
		    DTL_CODE DC1 ON (M.JOBRANK = DC1.DTL_CD AND DC1.CODE = 'D200')
		JOIN
		    DTL_CODE DC2 ON (MP.PJTROLE = DC2.DTL_CD AND DC2.CODE = 'D700')
	WHERE
        M.UNO = '5849839';


       
       SELECT
    MP.UNO,
    M.UNM,
    DC1.DTL_CDNM AS JOBRANK,
    P.PJTNM,
    DC3.DTL_CDNM AS COMPANYNM,
    TO_CHAR(MP.PJT_FROMDATE, 'YYYY-MM-DD') AS PJT_FROMDATE,
    TO_CHAR(MP.PJT_TODATE, 'YYYY-MM-DD') AS PJT_TODATE,
    DC2.DTL_CDNM AS PJTROLE
FROM
    MEMBER_PROJECT MP
LEFT JOIN
    MEMBER M ON MP.UNO = M.UNO
LEFT JOIN
    PROJECT P ON MP.PJTNO = P.PJTNO
LEFT JOIN
    DTL_CODE DC3 ON (P.COMPYNO = DC3.DTL_CD AND DC3.CODE = 'D600')
LEFT JOIN
    DTL_CODE DC1 ON (M.JOBRANK = DC1.DTL_CD AND DC1.CODE = 'D200')
LEFT JOIN
    DTL_CODE DC2 ON (MP.PJTROLE = DC2.DTL_CD AND DC2.CODE = 'D700')
WHERE
    MP.UNO = '3334445'
   ORDER BY MP.PJT_FROMDATE DESC;
   
  
  
  SELECT
    M.UNO,
    M.UNM,
    DC1.DTL_CDNM AS JOBRANK
FROM
    MEMBER M
LEFT JOIN
    MEMBER_PROJECT MP ON M.UNO = MP.UNO
LEFT JOIN
    PROJECT P ON MP.PJTNO = P.PJTNO
LEFT JOIN
    DTL_CODE DC1 ON (M.JOBRANK = DC1.DTL_CD AND DC1.CODE = 'D200')
WHERE
    M.UNO = '3334445'
ORDER BY
    MP.PJT_FROMDATE DESC;
   
   
   SELECT
    M.UNO,
    M.UNM,
    DC1.DTL_CDNM AS JOBRANK,
    MP.PJTNO,
    COALESCE(P.PJTNM, '') AS PJTNM,
    COALESCE(DC3.DTL_CDNM, '') AS COMPANYNM,
    COALESCE(TO_CHAR(MP.PJT_FROMDATE, 'YYYY-MM-DD'), '') AS PJT_FROMDATE,
    COALESCE(TO_CHAR(MP.PJT_TODATE, 'YYYY-MM-DD'), '') AS PJT_TODATE,
    COALESCE(DC2.DTL_CDNM, '') AS PJTROLE
FROM
    MEMBER M
LEFT JOIN
    MEMBER_PROJECT MP ON M.UNO = MP.UNO
LEFT JOIN
    PROJECT P ON MP.PJTNO = P.PJTNO
LEFT JOIN
    DTL_CODE DC1 ON (M.JOBRANK = DC1.DTL_CD AND DC1.CODE = 'D200')
LEFT JOIN
    DTL_CODE DC3 ON (P.COMPYNO = DC3.DTL_CD AND DC3.CODE = 'D600')
LEFT JOIN
    DTL_CODE DC2 ON (MP.PJTROLE = DC2.DTL_CD AND DC2.CODE = 'D700')
WHERE
    M.UNO = '3334445'
ORDER BY
    MP.PJT_FROMDATE DESC;

   
   UPDATE MEMBER_PROJECT
SET
    PJT_FROMDATE = TO_DATE('2021-01-05', 'YYYY-MM-DD'),
    PJT_TODATE = TO_DATE('2023-11-30', 'YYYY-MM-DD'),
    PJTROLE = '01'
WHERE
    UNO = '5849839'
    AND PJTNO = '5';
    
   
   
SELECT
    PJTNO,
    PJTNM,
    COMPYNO,
    PJTFROMDATE,
    PJTTODATE
FROM
    PROJECT P
WHERE
    NOT EXISTS (
        SELECT 1
        FROM MEMBER_PROJECT MP
        WHERE MP.PJTNO = P.PJTNO
        AND MP.UNO = 5849839 -- 여기에 실제 사용자 UNO를 넣어주세요
    );
   
   SELECT
    P.PJTNO,
    P.PJTNM,
    COALESCE(DC3.DTL_CDNM, '') AS COMPANYNM,
    P.PJTFROMDATE,
    P.PJTTODATE
FROM
    PROJECT P
LEFT JOIN
    DTL_CODE DC3 ON (P.COMPYNO = DC3.DTL_CD AND DC3.CODE = 'D600')
WHERE
    NOT EXISTS (
        SELECT 1
        FROM MEMBER_PROJECT MP
        WHERE MP.PJTNO = P.PJTNO
        AND MP.UNO = 5849839 -- 여기에 실제 사용자 UNO를 넣어주세요
    );
   
   
   SELECT
	    COALESCE(TO_CHAR(P.PJTNO), '') AS PJTNO,
	    COALESCE(P.PJTNM, '') AS PJTNM,
	    COALESCE(DC3.DTL_CDNM, '') AS COMPANYNM,
	    CASE WHEN P.PJTFROMDATE IS NOT NULL THEN TO_CHAR(P.PJTFROMDATE, 'YYYY-MM-DD') ELSE '' END AS PJTFROMDATE,
	    CASE WHEN P.PJTTODATE IS NOT NULL THEN TO_CHAR(P.PJTTODATE, 'YYYY-MM-DD') ELSE '' END AS PJTTODATE
	FROM PROJECT P
		LEFT JOIN DTL_CODE DC3 ON (P.COMPYNO = DC3.DTL_CD AND DC3.CODE = 'D600')
	WHERE NOT EXISTS (
       
        SELECT 1
        FROM MEMBER_PROJECT MP, PROJECT P
        WHERE MP.PJTNO = P.PJTNO
        AND MP.UNO = 5849839
       
        );
    
   
   
   
   
	SELECT * FROM MEMBER;
	SELECT * FROM PROJECT;
	SELECT * FROM MEMBER_PROJECT;
	SELECT * FROM code;
	SELECT * FROM DTL_CODE;
   
SELECT RN, PJTNO, PJTNM, COALESCE(COMPANYNM, '') AS COMPANYNM, PJTFROMDATE, PJTTODATE 
FROM 
( 
    SELECT P.PJTNO, P.PJTNM, COALESCE(DC3.DTL_CDNM, '') AS COMPANYNM, P.PJTFROMDATE, P.PJTTODATE, 
    ROW_NUMBER() OVER (ORDER BY P.PJTFROMDATE DESC) AS RN 
    FROM PROJECT P LEFT JOIN DTL_CODE DC3 
    ON (P.COMPYNO = DC3.DTL_CD AND DC3.CODE = 'D600') 
    WHERE NOT EXISTS ( SELECT 1 FROM MEMBER_PROJECT 
        MP WHERE MP.PJTNO = P.PJTNO AND MP.UNO = 3334445 ) 
) TEMP 
WHERE RN BETWEEN ((1 - 1) * 10) + 1 AND 1 * 10
ORDER BY PJTFROMDATE DESC;

SELECT RN, PJTNO, PJTNM, COALESCE(COMPANYNM, '') AS COMPANYNM, PJTFROMDATE, PJTTODATE 
  FROM 
  ( 
    SELECT P.PJTNO, P.PJTNM, COALESCE(DC3.DTL_CDNM, '') AS COMPANYNM, P.PJTFROMDATE, P.PJTTODATE, 
    ROW_NUMBER() OVER (ORDER BY P.PJTFROMDATE DESC) AS RN 
    FROM PROJECT P LEFT JOIN DTL_CODE DC3 
    ON (P.COMPYNO = DC3.DTL_CD AND DC3.CODE = 'D600') 
    WHERE NOT EXISTS ( SELECT 1 FROM MEMBER_PROJECT 
        MP WHERE MP.PJTNO = P.PJTNO AND MP.UNO = 3334445 ) 
        AND P.PJTNO = 1
        AND P.COMPYNO = '01'
  ) TEMP 
  WHERE RN BETWEEN ((1 - 1) * 10) + 1 AND 1 * 10
  ORDER BY PJTFROMDATE DESC;
  
 
 
 
 
	SELECT * FROM MEMBER;
	SELECT * FROM PROJECT;
	SELECT * FROM MEMBER_PROJECT;
	SELECT * FROM code;
	SELECT * FROM DTL_CODE;
	

CREATE TABLE project(
pjtNo number(25) NOT NULL PRIMARY KEY,
pjtNm varchar2(200) NOT NULL,
pjtFromDate date NOT NULL,
pjtToDate date NULL,
compyNo varchar2(4) NOT null
);

CREATE TABLE authority(
authoNo number(2) NOT NULL PRIMARY KEY,
autoNm varchar2(30) NOT null
)

CREATE TABLE member_authority(
uno NUMBER NOT NULL,
authoNo NUMBER NOT null,
	CONSTRAINT pk_member_authority PRIMARY KEY (uno, authoNo),
	CONSTRAINT fk_member_authority_uno FOREIGN KEY (uno) REFERENCES MEMBER(UNO),
	CONSTRAINT fk_member_authority_authoNo FOREIGN KEY (authoNo) REFERENCES authority(authoNO)
)



SELECT * FROM AUTHORITY;
SELECT * FROM MEMBER_AUTHORITY;




CREATE TABLE menu (
    menu_id NUMBER PRIMARY KEY,
    menu_name VARCHAR(255),
    menu_url VARCHAR(255)
    );
   
INSERT INTO menu (MENU_ID, MENU_NAME, MENU_URL) VALUES (1, '홈', '/board/main');
INSERT INTO menu (MENU_ID, MENU_NAME, MENU_URL) VALUES (2, '로그인', '/main/login');
INSERT INTO menu (MENU_ID, MENU_NAME, MENU_URL) VALUES (3, '가입', '/board/register');
INSERT INTO menu (MENU_ID, MENU_NAME, MENU_URL) VALUES (4, '개인정보 수정', '/board/modify');
INSERT INTO menu (MENU_ID, MENU_NAME, MENU_URL) VALUES (5, '개인프로젝트 추가/수정', '/board/userProject');
INSERT INTO menu (MENU_ID, MENU_NAME, MENU_URL) VALUES (6, '사원조회', '/board/list');
INSERT INTO menu (MENU_ID, MENU_NAME, MENU_URL) VALUES (7, '프로젝트조회', '/project/list');
INSERT INTO menu (MENU_ID, MENU_NAME, MENU_URL) VALUES (8, '게시판', '/main/talk');
INSERT INTO menu (MENU_ID, MENU_NAME, MENU_URL) VALUES (9, '문의사항', '/main/qna');
INSERT INTO menu (MENU_ID, MENU_NAME, MENU_URL) VALUES (10, '주문', '/main/order');
INSERT INTO menu (MENU_ID, MENU_NAME, MENU_URL) VALUES (11, '도움말', '/main/help');

SELECT * FROM menu;

   CREATE TABLE autho_menu (
    authono NUMBER(2),
    menu_id NUMBER,
    PRIMARY KEY (authono, menu_id),
    FOREIGN KEY (authono) REFERENCES authority(authono),
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id)
);

SELECT * FROM AUTHO_MENU;
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (1, 1);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (1, 3);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (1, 6);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (1, 7);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (1, 8);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (1, 9);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (1, 10);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (1, 11);

INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (2, 1);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (2, 4);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (2, 5);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (2, 8);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (2, 9);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (2, 10);
INSERT INTO autho_menu (AUTHONO, MENU_ID) VALUES (2, 11);



SELECT m.menu_id, m.menu_name, m.menu_url
FROM menu m
JOIN autho_menu am ON m.menu_id = am.menu_id
WHERE am.authono = 1;