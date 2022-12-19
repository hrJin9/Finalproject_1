show user; 
-- USER이(가) "FINAL_ORAUSER1"입니다.

--select * from tab;

--select *
--from tbl_guestbook;

desc TBL_EMPLOYEE

---- *** 회원테이블 생성 *** ----
CREATE TABLE TBL_EMPLOYEE
(EMPLOYEE_NO           NUMBER(6)      NOT NULL   -- 사원번호 
,FK_DEPARTMENT_NO      NUMBER(4)                -- 부서번호
,FK_TEAM_NO            NUMBER(4)                -- 팀번호
,NAME_KR               VARCHAR2(40)   NOT NULL  -- 이름 
,NAME_EN               VARCHAR2(40)   NOT NULL  -- 영문이름 
,PASSWD                VARCHAR2(200)  NOT NULL  -- 비밀번호
,JOINTYPE              VARCHAR2(10)   NOT NULL  -- 입사유형
,MANAGER_NO            NUMBER(6)                -- 직속상관
,HIRE_DATE             DATE           NOT NULL  -- 입사일
,SALARY                NUMBER(8,2)              -- 연봉
,COMMISSION_PCT        NUMBER(2,2)              -- 성과급퍼센트
,MOBILE                VARCHAR2(20)             -- 연락처
,POSTCODE              VARCHAR2(5)              -- 주소 
,ADDRESS               VARCHAR2(100) 
,DETAIL_ADDRESS        VARCHAR2(100) 
,EXTRA_ADDRESS         VARCHAR2(100) 
,EMAIL                 VARCHAR2(25)   NOT NULL  -- 이메일
,GENDER                NUMBER                   -- 성별
,PROFILE_SYSTEMFILENAME VARCHAR2(200)           -- 프로필사진
,PROFILE_ORGINFILENAME  VARCHAR2(200)           -- 프로필사진(오리지널)
,ACADEMIC_ABILITY      VARCHAR2(100)            -- 최종학력
,MAJOR                 VARCHAR2(100)            -- 전공
,MILITARYSERVICE       VARCHAR2(50)             -- 병역사항
,BANK                  VARCHAR2(30)             -- 은행
,ACCOUNTNUMBER         VARCHAR2(30)             -- 계좌
,STATUS                VARCHAR2(10)             -- 상태
,ROLE                  VARCHAR2(100)            -- 직무
,POSITION              VARCHAR2(100)            -- 직위
,AUTHORITY             NUMBER(6)                -- 권한
,SIDEBARSIZE           NUMBER(6)                -- 넓게보기여부
,CONSTRAINT PK_TBL_EMPLOYEE_EMPLOYEE_NO PRIMARY KEY(EMPLOYEE_NO)
,CONSTRAINT UQ_TBL_EMPLOYEE_EMAIL  UNIQUE(EMAIL)
,CONSTRAINT  FK_TBL_EMPLOYEE_FK_DEPARTMENT_NO FOREIGN KEY(FK_DEPARTMENT_NO) REFERENCES TBL_DEPARTMENTS(DEPARTMENT_NO)
,CONSTRAINT  FK_TBL_EMPLOYEE_FK_TEAM_NO FOREIGN KEY(FK_TEAM_NO) REFERENCES TBL_TEAM(TEAM_NO)
,CONSTRAINT CK_TBL_EMPLOYEE_GENDER CHECK(GENDER IN(1,2))
,CONSTRAINT CK_TBL_EMPLOYEE_STATUS CHECK(STATUS IN(0,1))
);
-- Table TBL_EMPLOYEE이(가) 생성되었습니다.

CREATE TABLE TBL_DEPARTMENTS
(DEPARTMENT_NO   NUMBER(4)     NOT NULL     
,DEPARTMENT_NAME VARCHAR2(30)  NOT NULL   
,MANAGER_NO      NUMBER(6)                 -- 부서장
,DELETE_STATUS   NUMBER(4)     DEFAULT 1
,CONSTRAINT PK_TBL_DEPARTMENTS_DEPARTMENT_NO PRIMARY KEY(DEPARTMENT_NO)
);
-- Table TBL_DEPARTMENTS이(가) 생성되었습니다.

CREATE TABLE TBL_TEAM
(TEAM_NO          NUMBER(4)     NOT NULL     
,TEAM_NAME        VARCHAR2(30)  NOT NULL 
,FK_DEPARTMENT_NO NUMBER(4)     NOT NULL 
,MANAGER_NO       NUMBER(6)                -- 팀장
,DELETE_STATUS    NUMBER(4)     DEFAULT 1
,CONSTRAINT PK_TBL_TEAM_TEAM_NO PRIMARY KEY(TEAM_NO)
,CONSTRAINT FK_TBL_TEAM_FK_DEPARTMENT_NO FOREIGN KEY(FK_DEPARTMENT_NO) REFERENCES TBL_DEPARTMENTS(DEPARTMENT_NO)
);
-- Table TBL_TEAM이(가) 생성되었습니다.


drop table tbl_notice_board purge;
drop sequence commentSeq;
drop table tbl_free_board purge;
drop sequence boardSeq;
drop sequence seq_tbl_nboard;
drop table tbl_fb_comment purge;

select * from tab;
select * from user_sequences;

-- 게시글 분류
create table tbl_nb_smcategory
(sm_nbc_no         nvarchar2(30)  not null     -- 게시글분류번호
,sm_nbc_name       varchar2(50)   not null     -- 캘린더 대분류 명
,constraint PK_tbl_nb_smcategory primary key(sm_nbc_no)
);

-- 공지게시판
create table tbl_notice_board
(nbno                 varchar2(30)          not null     -- 공지게시물번호
,lg_nbc_no             varchar2(30)          not null     -- 공지사항분류
,fk_sm_nbc_no         nvarchar2(30)         not null     -- 게시글분류번호
,fk_employee_no       number(6)             not null     -- 사원번호  
,name_kr              varchar2(40)          not null     -- 작성자명
,position             varchar2(100)         not null     -- 직위
,subject              Nvarchar2(200)        not null     -- 글제목
,content              clob                  not null     -- 글내용
,readcnt              number default 0      not null     -- 글조회수
,writedate            date default sysdate  not null     -- 작성일자
,status               number(1) default 1   not null     -- 글삭제여부
,nb_systemfilename    varchar2(200)                      -- 저장될 파일명                        
,nb_originfilename    varchar2(200)                       -- 오리지널파일명
,file_size            number                             -- 파일크기 

,constraint PK_tbl_notice_board_nbno primary key(nbno)
,constraint FK_tbl_notice_board_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
,constraint FK_tbl_notice_board_fk_sm_nbc_no foreign key(fk_sm_nbc_no) references tbl_nb_smcategory(sm_nbc_no)
,constraint CK_tbl_notice_board_status check( status in(0,1) )
);

-- 공지게시물번호
create sequence seq_tbl_nboard
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 자유게시판(예전버전)
create table tbl_free_board
(fbno                 varchar2(30)          not null     -- 자유게시물번호
,fk_employee_no       number(6)             not null     -- 사원번호  
,name_kr              varchar2(40)          not null     -- 작성자명
,position             varchar2(100)         not null     -- 직위
,subject              Nvarchar2(200)        not null     -- 글제목
,content              clob                  not null     -- 글내용   
,readcnt              number default 0      not null     -- 글조회수
,writedate            date default sysdate  not null     -- 작성일자
,status               number(1) default 1   not null     -- 글삭제여부  
,commentCount         number default 0      not null     -- 댓글개수 
,fb_systemfilename    varchar2(200)                      -- 저장될 파일명                             
,fb_originfilename    varchar2(200)                      -- 오리지널파일명
,file_size            number                             -- 파일크기 

,constraint PK_tbl_free_board_fbno primary key(fbno)
,constraint FK_tbl_free_board_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
,constraint CK_tbl_free_board_status check( status in(0,1) )
);

-- 자유게시물번호
create sequence seq_tbl_fboard
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 자유게시판 댓글 테이블
create table tbl_fb_comment
(cno              number                not null    -- 댓글번호
,fk_employee_no   number(6)             not null    -- 사원번호
,name_kr          varchar2(40)          not null    -- 작성자명
,position         varchar2(100)         not null    -- 직위
,content          varchar2(1000)        not null    -- 댓글내용
,writedate        date default sysdate  not null    -- 작성일자
,fk_fbno          varchar2(30)          not null    -- 자유게시물번호
,status           number(1) default 1   not null    -- 글삭제여부
,groupno          number                not null    -- 대슬 그룹번호 
,fk_cno           number default 0      not null    -- 대댓글이라면 댓글(부모글)의 seq 컬럼의 값, 대댓글이 아닌 댓글일 경우 0
,depthno          number default 0      not null    -- 댓글(부모글)의 depthno + 1, 대댓글 아닌 댓글일 경우 0 을 가
,constraint PK_tbl_fb_comment_cno primary key(cno)
,constraint FK_tbl_fb_comment_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
,constraint FK_tbl_fb_comment_fk_fbno foreign key(fk_fbno) references tbl_free_board(fbno) on delete cascade
,constraint CK_tbl_fb_comment_status check( status in(1,0) ) 
);

-- 자유게시물 댓글번호
create sequence seq_tbl_fbcomment
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 스크랩 tbl_board_scrap 
create table tbl_board_scrap
(sno            varchar2(50)  not null   -- 스크랩번호
,fk_bno         varchar2(50)  not null   -- 스크랩한 게시물번호(공지, 자유)
,btype          number(1)     not null   -- 스크랩한 게시판 분류  0:공지, 1:자유
,fk_employee_no number        not null   -- 스크랩한 사원번호
,constraint PK_tbl_board_scrap_sno  primary key(sno)
,constraint CK_tbl_board_scrap_btype check( btype in(0,1) )
,constraint FK_tbl_board_scrap_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no) on delete cascade -- 사원번호 삭제되면 북마크도 삭제
);

-- 좋아요
create table tbl_heart
(hno            varchar2(50)    not null    -- 좋아요번호
,fk_bno         varchar2(50)    not null    -- 게시판번호
,btype          number(1)       not null    -- 좋아요한 게시판 분류  0:공지, 1:자유
,fk_employee_no number          not null    -- 좋아요한 사원번호
,constraint PK_tbl_heart_hno primary key(hno)
,constraint CK_tbl_heart_btype check( btype in(0,1) )
,constraint FK_tbl_heart_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
);

-- 좋아요 번호
create sequence seq_tbl_heart
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from tbl_heart;

delete from tbl_heart
where hno = 'ht-21';

select count(*)
from tbl_heart
where fk_bno = 12 and fk_employee_no = 100016


select count(*)
from tbl_board_scrap
where fk_employee_no = 100016 and fk_bno = 16


-----------------------------------------------------------------------------------------------

drop table tbl_dayoff purge;
drop sequence commentseq;
drop table tbl_attendance purge;
drop sequence boardseq;
drop table tbl_attendance_catgo purge;

-- 연차
create table tbl_dayoff
(dono           varchar2(50)          not null -- 연차번호
,fk_employee_no number(6)             not null -- 사원번호
,fk_ano         varchar2(50)          not null -- 결재문서번호  --> 결재문서 insert할때 채번해서 한번에 넣기
,docatgo        varchar2(50)                   -- 연차유형
,startdate      date                           -- 연차시작일
,enddate        date                           -- 연차종료일
,constraint pk_tbl_dayoff_dono primary key(dono)
,constraint fk_tbl_dayoff_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
);
-- Table TBL_DAYOFF이(가) 생성되었습니다.

-- 연차번호
create sequence seq_dayoff_no
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_DAYOFF_NO이(가) 생성되었습니다.

alter table tbl_attendance rename column startdate to startTime;
alter table tbl_attendance rename column enddate to endTime;
commit;

-- 근태
create table tbl_attendance
(adno           varchar2(50)    not null   -- 근태번호
,fk_employee_no number(6)       not null   -- 사원번호
,adcatgo        varchar2(50)               -- 근태유형
,startTime      date                       -- 시작시간
,endTime        date                       -- 종료시간
,constraint pk_tbl_attendance_adno primary key(adno)
,constraint fk_tbl_attendance_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
);
-- Table TBL_ATTENDANCE이(가) 생성되었습니다.

ALTER TABLE tbl_attendance ADD adImg varchar2(100);
desc tbl_attendance

-- 근태번호
create sequence seq_attendance_no
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_ATTENDANCE_NO이(가) 생성되었습니다.

select adno, fk_employee_no, adcatgo, 
       to_char(startTime, 'yyyy-mm-dd hh24:mi') AS startTime, to_char(endTime, 'yyyy-mm-dd hh24:mi') AS endTime,
       (to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') - to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi')) *24*60 AS totalTime
from tbl_attendance



SELECT 
     TRUNC(((endTime - startTime) - TRUNC(endTime - startTime)) * 24) as "시간", 
     FLOOR(((((endTime - startTime) -TRUNC(endTime - startTime)) * 24) 
     - TRUNC(((endTime - startTime)-TRUNC(endTime - startTime)) * 24)) * 60) as "분"
FROM (              
    SELECT to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as startTime,  -- 시작일
           to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as endTime    -- 종료일
    from tbl_attendance
    )

with B as
(select
     adno, fk_employee_no, adcatgo, adImg,
     to_char(startTime, 'yyyy-mm-dd hh24:mi') AS startTime, to_char(endTime, 'yyyy-mm-dd hh24:mi') AS endTime,
     TRUNC(((enddate - startdate) - TRUNC(enddate - startdate)) * 24) as workTime, 
     FLOOR(((((enddate - startdate) -TRUNC(enddate - startdate)) * 24) 
     - TRUNC(((enddate - startdate)-TRUNC(enddate - startdate)) * 24)) * 60) as workMin
from 
(select adno, fk_employee_no, adcatgo, adImg, startTime, endTime,
        to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as startdate,  
        to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as enddate 
 from tbl_attendance) v)
select workTime, workMin, adno, fk_employee_no, adcatgo, startTime, endTime
from B

-- 특정날짜 근무내역보기
select
     adno, fk_employee_no, adcatgo,
     substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate, 
     substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 12) AS startTime, 
     substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 12) AS endTime,
     TRUNC(((enddate - startdate) - TRUNC(enddate - startdate)) * 24) as workTime, 
     FLOOR(((((enddate - startdate) -TRUNC(enddate - startdate)) * 24) 
     - TRUNC(((enddate - startdate)-TRUNC(enddate - startdate)) * 24)) * 60) as workMin
from 
(select adno, fk_employee_no, adcatgo, startTime, endTime,
        to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as startdate,  
        to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as enddate 
 from tbl_attendance) v
where fk_employee_no = 100016 and to_char(startTime, 'yyyy-mm-dd') = '2022-12-06'
order by startTime asc


-- 특정날짜 근무내역보기(최종본)
with B as
(select
     adno, fk_employee_no, adcatgo,
     substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate,
     substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 12) AS startTime, 
     substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 12) AS endTime,
     ROUND((enddate-startdate)*24*60) AS total,
     trim(trunc(ROUND((enddate-startdate)*24*60) / 60)) AS workTime,
     trim(trunc(mod(abs(ROUND((enddate-startdate)*24*60)), 60))) AS workMin
from 
(select adno, fk_employee_no, adcatgo, startTime, endTime,
        to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as startdate,  
        to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as enddate 
 from tbl_attendance) v)
select adno, fk_employee_no, adcatgo, seldate, startTime, endTime, workTime, workMin, total
from B
where fk_employee_no = 100016 and seldate = '2022-12-09'
order by startTime asc









-- 총근무시간 조회하기
with B as
(select
     adno, fk_employee_no, adcatgo,
     substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 12) AS startTime, 
     substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 12) AS endTime,
     ROUND((enddate-startdate)*24*60) AS total,
     trim(trunc(ROUND((enddate-startdate)*24*60) / 60)) AS workTime,
     trim(trunc(mod(abs(ROUND((enddate-startdate)*24*60)), 60))) AS workMin
from 
(select adno, fk_employee_no, adcatgo, startTime, endTime,
    substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate,
        to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as startdate,  
        to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as enddate 
 from tbl_attendance
) v
group by seldate)
select adno, fk_employee_no, adcatgo, seldate, startTime, endTime, workTime, workMin, total
from B
where fk_employee_no = 100016 and seldate = '2022-12-10'

order by startTime asc



-- 하루치 총 근무시간 조회하기(최종본)
select NVL(MAX(seldate), '0') AS seldate,
       NVL(MAX(trim(trunc(total / 60))), '0') AS workTime,
       NVL(MAX(trim(trunc(mod(abs(total), 60)))), '0') AS workMin
from 
(
    select seldate, sum(total) AS total
    from
    (
      select adno, fk_employee_no, adcatgo,
            substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 12) AS startTime, 
            substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 12) AS endTime,
            substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate,
            ROUND((to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi')-to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi'))*24*60) AS total
      from tbl_attendance 
      where fk_employee_no = 100016 and to_char(startTime, 'yyyy-mm-dd') = '2022-12-09'
    ) V
    group by seldate 
)b

-- 또는
select NVL(MAX(seldate), '0') AS seldate,
       NVL(MAX(trim(trunc(total / 60))), '0') AS workTime,
       NVL(MAX(trim(trunc(mod(abs(total), 60)))), '0') AS workMin
from 
(
    select seldate, sum(total) AS total
    from
    (
      select adno, fk_employee_no, adcatgo,
            substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 12) AS startTime, 
            substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 12) AS endTime,
            substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate,
            ROUND((to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi')-to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi'))*24*60) AS total
      from tbl_attendance
      where fk_employee_no = 100016
    ) V
    group by seldate 
)b
where seldate = '2022-12-06'



-- 하루치 총 근무시간 조회하기(최최종본)  --> 시/분 쪼개기는 자바(Controller)에서 처리해줄 것임.
select NVL(MAX(seldate), '0') AS seldate,
       NVL(MAX(totalTime), '0') AS totalTime
from 
(
    select seldate, sum(total) AS totalTime
    from
    (
      select adno, fk_employee_no, adcatgo,
            substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 12) AS startTime, 
            substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 12) AS endTime,
            substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate,
            ROUND((to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi')-to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi'))*24*60) AS total
      from tbl_attendance 
      where fk_employee_no = 100016 and to_char(startTime, 'yyyy-mm-dd') = '2022-12-10'
    ) V
    group by seldate 
)b




-- 문법
WITH c AS 
(SELECT 492 AS MINUTES 
 FROM DUAL)
SELECT trim(to_char(trunc(MINUTES / 60), '09')) || ':' ||
       trim(to_char(trunc(mod(abs(MINUTES), 60)), '09')) AS HHMM
FROM c;	

NVL(MAX(seldate), '0') AS seldate,



-- 전체 근무목록 보여주기(최종본)
with B as
(select
     adno, fk_employee_no, adcatgo,
     substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate,
     substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 12) AS startTime, 
     substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 12) AS endTime,
     trim(trunc(ROUND((enddate-startdate)*24*60) / 60)) AS workTime,
     trim(trunc(mod(abs(ROUND((enddate-startdate)*24*60)), 60))) AS workMin
from 
(select adno, fk_employee_no, adcatgo, startTime, endTime,
        to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as startdate,  
        to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as enddate 
 from tbl_attendance) v)
select adno, fk_employee_no, adcatgo, seldate, startTime, endTime, workTime, workMin
from B
where fk_employee_no = 100016 and seldate = '2022-12-16'
order by startTime asc



-- 최종1
with B as
(select
     adno, fk_employee_no, adcatgo,
     substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate,
     startTime_t + startTime_m  AS startTime,
     endTime_t + endTime_m  AS endTime,
     trim(trunc(ROUND((enddate-startdate)*24*60) / 60)) AS workTime,
     trim(trunc(mod(abs(ROUND((enddate-startdate)*24*60)), 60))) AS workMin
from 
(select adno, fk_employee_no, adcatgo, startTime, endTime,
        substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 12) AS start_Time,
        to_number(substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 12, 2)) AS startTime_t,
        to_number(round(substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 15)/60, 1)) AS startTime_m,
        substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 12) AS end_Time,
        to_number(substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 12, 2)) AS endTime_t,
        to_number(round(substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 15)/60, 1)) AS endTime_m,
        to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as startdate,  
        to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as enddate 
 from tbl_attendance) v)
select adno, fk_employee_no, adcatgo, seldate, startTime, endTime, workTime, workMin
from B
where fk_employee_no = 100016 and seldate = '2022-12-09'
order by startTime asc


-- 최종1 수정본
with B as
(select
     adno, fk_employee_no, adcatgo,
     substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate,
     startTime_t + startTime_m  AS startTime,
     endTime_t + endTime_m  AS endTime,
     trim(trunc(ROUND((enddate-startdate)*24*60) / 60)) AS workTime,
     trim(trunc(mod(abs(ROUND((enddate-startdate)*24*60)), 60))) AS workMin,
     totalTime
from 
(select adno, fk_employee_no, adcatgo, startTime, endTime,
        substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 12) AS start_Time,
        to_number(substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 12, 2)) AS startTime_t,
        to_number(round(substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 15)/60, 1)) AS startTime_m,
        substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 12) AS end_Time,
        to_number(substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 12, 2)) AS endTime_t,
        to_number(round(substr(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 15)/60, 1)) AS endTime_m,
        to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as startdate,  
        to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi') as enddate,
        ROUND((to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi')-to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi'))*24*60) AS totalTime
 from tbl_attendance) v)
select adno, fk_employee_no, adcatgo, seldate, startTime, endTime, workTime, workMin, totalTime
from B
where fk_employee_no = 100016 and seldate = '2022-12-09'
order by startTime asc



-- 최종1 수정본2
select seldate, startTime, endTime
from 
(
select seldate,
       substr(to_char(min(startTime), 'yyyy-mm-dd hh24:mi'), 12) AS startTime,
       substr(to_char(max(endTime), 'yyyy-mm-dd hh24:mi'), 12) AS endTime
from
(
  select adno, fk_employee_no, startTime, endTime,
        substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate
  from tbl_attendance 
  where fk_employee_no = 100016 and to_char(startTime, 'yyyy-mm-dd') = '2022-12-09'    
) V
group by seldate
)b

-- 또는

select seldate,
       substr(to_char(min(startTime), 'yyyy-mm-dd hh24:mi'), 12) AS startTime,
       substr(to_char(max(endTime), 'yyyy-mm-dd hh24:mi'), 12) AS endTime
from
(
  select adno, fk_employee_no, startTime, endTime,
        substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate
  from tbl_attendance 
  where fk_employee_no = 100016 and to_char(startTime, 'yyyy-mm-dd') = '2022-12-09'    
) V
group by seldate 



-- 최종1 수정본2(최최최종본!!! 이거!!!!!)
select seldate,
       startTime_t + startTime_m  AS startTime,
       endTime_t + endTime_m  AS endTime
from 
(
select seldate,
       to_number(substr(to_char(min(startTime), 'yyyy-mm-dd hh24:mi'), 12, 2)) AS startTime_t,
       to_number(round(substr(to_char(min(startTime), 'yyyy-mm-dd hh24:mi'), 15)/60, 1)) AS startTime_m,

       to_number(substr(to_char(max(endTime), 'yyyy-mm-dd hh24:mi'), 12, 2)) AS endTime_t,
       to_number(round(substr(to_char(max(endTime), 'yyyy-mm-dd hh24:mi'), 15)/60, 1)) AS endTime_m    
from
(
  select adno, fk_employee_no, startTime, endTime,
        substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate
  from tbl_attendance 
  where fk_employee_no = 100016 and to_char(startTime, 'yyyy-mm-dd') = '2022-12-14'    
) V
group by seldate
)b




-- 일주일치 총 근무시간 구하기
with B as
(select
     fk_employee_no,
     substr(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 0, 10) AS seldate,
     totalTime
from 
(select adno, fk_employee_no, startTime, endTime,
        ROUND((to_date(to_char(endTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi')-to_date(to_char(startTime, 'yyyy-mm-dd hh24:mi'), 'yyyy-mm-dd hh24:mi'))*24*60) AS totalTime
 from tbl_attendance) v)
select fk_employee_no, seldate, totalTime
from B
where fk_employee_no = 100016 and seldate = '2022-12-09'









MERGE INTO tbl_attendance -- 삽입/수정의 대상이 될 테이블
USING DUAL -- 원본 데이터가 있는 테이블
   ON (adno == '' or adno == null)
WHEN NOT MATCHED THEN
    insert into tbl_attendance(adno, fk_employee_no, adcatgo, startTime, endTime)
    values(seq_attendance_no.nextval, 100016, '근무', to_date('2022-11-01 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-11-01 18:00', 'yyyy-mm-dd hh24:mi'))



select *
from tbl_employee
where employee_no = '100016';

update tbl_employee set dayoff_cnt = 3 
where employee_no = '100016';
commit;

delete from tbl_attendance
where adno = 57

delete from tbl_attendance
where fk_employee_no = 100016 and to_char(startTime, 'yyyy-mm-dd') = '2022-12-06'

rollback;
commit;

insert into tbl_attendance(adno, fk_employee_no, adcatgo, adImg, startTime, endTime)
values(seq_attendance_no.nextval, #{fk_employee_no}, #{adcatgo}, #{adImg}, to_date(#{startTime}, 'yyyy-mm-dd hh24:mi'), to_date(#{endTime}, 'yyyy-mm-dd hh24:mi'))

update tbl_attendance set logindate = add_months(logindate, -13)  -- leess 계정의 로그인날짜를 21/08/19 로 변경함. -- add_months()의 숫자 단위는 개월수이다.
where fk_userid = 'leess';

delete from tbl_attendance
where fk_employee_no = 100016 and to_char(startTime, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd')


MERGE INTO tbl_attendance
USING DUAL
   ON (adno = 'ad-51')
WHEN NOT MATCHED THEN  -- 동일한 시퀀스가 없다면
    insert into tbl_attendance(adno, fk_employee_no, adcatgo, adImg, startTime, endTime)
    values(seq_attendance_no.nextval, 100016, '근무', d, to_date('2022-12-07 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-07 18:00', 'yyyy-mm-dd hh24:mi'))


-- 문법
MERGE 
 INTO tbl_attendance
USING dual
   ON (adno = 'ad-51')
 WHEN NOT MATCHED THEN
    insert into tbl_attendance(adno, fk_employee_no, adcatgo, startTime, endTime)
    values('ad-51', 100016, '근무', to_date('2022-12-07 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-07 18:00', 'yyyy-mm-dd hh24:mi'))

    




-- 근태종류
create table tbl_attendance_catgo
(adcatgono  number        not null -- 근태종류번호
,adcatgo    varchar2(50)           -- 근태종류
,constraint pk_tbl_attendance_catgo_adcatgono primary key(adcatgono)
);
-- Table TBL_ATTENDANCE_CATGO이(가) 생성되었습니다.

select *
from tbl_attendance_catgo

insert into tbl_attendance_catgo(adcatgono, adcatgo)
values(1, '근무')

insert into tbl_attendance_catgo(adcatgono, adcatgo)
values(2, '원격근무')

insert into tbl_attendance_catgo(adcatgono, adcatgo)
values(3, '외근')

insert into tbl_attendance_catgo(adcatgono, adcatgo)
values(4, '출장')


-----------------------------------------------------------------------------------------------

select * from tab;

select *
from tbl_approval

select *
from tbl_attendance

select fk_employee_no
     , adcatgo
     , to_char(startTime, 'yyyy-mm-dd hh24:mi')
     , to_char(endTime, 'yyyy-mm-dd hh24:mi')   
from tbl_attendance


insert into tbl_attendance(adno, fk_employee_no, adcatgo, startTime, endTime)
values('ad-'||seq_attendance_no.nextval, 100016, '근무', to_date('2022-11-01 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-11-01 18:00', 'yyyy-mm-dd hh24:mi'))

commit;


delete from tbl_attendance
where adno = 1;

insert into tbl_attendance(adno, fk_employee_no, adcatgo, startTime, endTime)
values('ad-'||seq_attendance_no.nextval, 100016,'근무', to_date('2022-12-02 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-02 18:00', 'yyyy-mm-dd hh24:mi'))

insert into tbl_attendance(adno, fk_employee_no, adcatgo, startTime, endTime)
values('ad-'||seq_attendance_no.nextval, #{fk_employee_no}, #{adcatgo}, to_date(#{startTime}, 'yyyy-mm-dd hh24:mi'), to_date(#{endTime}, 'yyyy-mm-dd hh24:mi'))

to_date(#{startTime}, 'yyyy-mm-dd hh24:mi')
to_date(#{endTime}, 'yyyy-mm-dd hh24:mi')

-- 연차조회
select dono, fk_employee_no, fk_ano, halfoff, docatgo, 
       to_char(startdate, 'yyyy.mm.dd') AS startdate, to_char(startdate, 'dy') AS startday,
       to_char(enddate, 'yyyy.mm.dd') AS enddate, to_char(enddate, 'dy') AS endday,
       enddate - startdate +1 AS usedays,

from tbl_dayoff
where fk_employee_no = 100016
order by startdate desc;

-- 내것1
with 
A as 
(select dono, fk_employee_no, fk_ano, docatgo, 
 to_char(startdate, 'yyyy.mm.dd') AS startdate, to_char(startdate, 'dy') AS startday,
 to_char(enddate, 'yyyy.mm.dd') AS enddate, to_char(enddate, 'dy') AS endday
 from tbl_dayoff
),
B as
(select dono, startdate, enddate, round(cnt,0)as n, 
        case when round(cnt,1)-trunc(cnt,0) > 0 and round(cnt,1)-trunc(cnt,0) < 0.3 then 0.5 
             when round(cnt,1)-trunc(cnt,0) > 0.3 and round(cnt,1)-trunc(cnt,0) < 0.5 then 1
             else 0 end as r 
from 
(select dono, to_char(startdate,'yyyy-mm-dd hh24:mi') as startdate, to_char(enddate,'yyyy-mm-dd hh24:mi') as enddate,
       to_date(to_char(enddate,'yyyy-mm-dd hh24:mi') , 'yyyy-mm-dd hh24:mi') - to_date(to_char(startdate,'yyyy-mm-dd hh24:mi'),'yyyy-mm-dd hh24:mi') as cnt
from tbl_dayoff) v)
select A.dono, A.fk_employee_no, A.fk_ano, A.docatgo, A.startdate, A.startday, A.enddate, A.endday,
       n+r as usedays
FROM A JOIN B
ON A.dono = B.dono
where fk_employee_no = #{fk_employee_no} and substr(A.startdate, 0,4) = to_char(sysdate,'yyyy')
order by startdate desc

-- 테스트(작년기준)
with 
A as 
(select dono, fk_employee_no, fk_ano, docatgo, 
 to_char(startdate, 'yyyy.mm.dd') AS startdate, to_char(startdate, 'dy') AS startday,
 to_char(enddate, 'yyyy.mm.dd') AS enddate, to_char(enddate, 'dy') AS endday
 from tbl_dayoff
),
B as
(select dono, startdate, enddate, round(cnt,0)as n, 
        case when round(cnt,1)-trunc(cnt,0) > 0 and round(cnt,1)-trunc(cnt,0) < 0.3 then 0.5 
             when round(cnt,1)-trunc(cnt,0) > 0.3 and round(cnt,1)-trunc(cnt,0) < 0.5 then 1
             else 0 end as r 
from 
(select dono, to_char(startdate,'yyyy-mm-dd hh24:mi') as startdate, to_char(enddate,'yyyy-mm-dd hh24:mi') as enddate,
       to_date(to_char(enddate,'yyyy-mm-dd hh24:mi') , 'yyyy-mm-dd hh24:mi') - to_date(to_char(startdate,'yyyy-mm-dd hh24:mi'),'yyyy-mm-dd hh24:mi') as cnt
from tbl_dayoff) v)
select A.dono, A.fk_employee_no, A.fk_ano, A.docatgo, A.startdate, A.startday, A.enddate, A.endday,
       n+r as usedays
FROM A JOIN B
ON A.dono = B.dono
where fk_employee_no = 100016 and substr(A.startdate, 0,4) = to_char(add_months(sysdate, -12), 'yyyy')
order by startdate desc


-- 내것2
with 
A as 
(select dono, fk_employee_no, fk_ano, docatgo, 
 to_char(startdate, 'yyyy.mm.dd') AS startdate, to_char(startdate, 'dy') AS startday,
 to_char(enddate, 'yyyy.mm.dd') AS enddate, to_char(enddate, 'dy') AS endday
 from tbl_dayoff
),
B as
(select dono, startdate, enddate, round(cnt,0)as n, 
        case when round(cnt,1)-trunc(cnt,0) > 0 and round(cnt,1)-trunc(cnt,0) < 0.3 then 0.5 
             when round(cnt,1)-trunc(cnt,0) > 0.3 and round(cnt,1)-trunc(cnt,0) < 0.5 then 1
             else 0 end as r 
from 
(select dono, to_char(startdate,'yyyy-mm-dd hh24:mi') as startdate, to_char(enddate,'yyyy-mm-dd hh24:mi') as enddate,
       to_date(to_char(enddate,'yyyy-mm-dd hh24:mi') , 'yyyy-mm-dd hh24:mi') - to_date(to_char(startdate,'yyyy-mm-dd hh24:mi'),'yyyy-mm-dd hh24:mi') as cnt
from tbl_dayoff) v)
select A.dono, A.fk_employee_no, A.fk_ano, A.docatgo, A.startdate, A.startday, A.enddate, A.endday,
       n+r as usedays
FROM A JOIN B
ON A.dono = B.dono
where fk_employee_no = 100016 and substr(A.startdate, 0,4) = '2021' 
      and to_date(A.startdate,'yyyy-mm-dd') <= to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd')
order by startdate desc


-- 연습용
select 
  count(*) as count, 
  to_char(to_date(appdate), 'YYYY-MM') as monthlydata,
from
  tbl_dayoff 
where 1=1
  and appdate>=202212 and appdate<202301
group by to_char(to_date(appdate), 'YYYY-MM')
order by monthlydata;



SELECT 
    TO_CHAR(purchased_at, 'yyyy-mm'),
    user_idx,
    COUNT(*)
FROM tbl_dayoff
GROUP BY 
TO_CHAR(startdate, 'yyyy-mm'), 
user_idx

select dono, fk_ano, docatgo, startdate, enddate, startdate
from tbl_dayoff
where fk_employee_no = 100016 and substr(startdate, 0,4) = '2022' 


-- 연습용 끝



update tbl_employee set dayoff_cnt = dayoff_cnt+1
where employee_no != 99

 


----
with B as
(select dono, startdate, enddate, round(cnt,0)as n, 
        case when round(cnt,1)-trunc(cnt,0) > 0 and round(cnt,1)-trunc(cnt,0) < 0.3 then 0.5 
             when round(cnt,1)-trunc(cnt,0) > 0.3 and round(cnt,1)-trunc(cnt,0) < 0.5 then 1
             else 0 end as r 
from 
(select dono, to_char(startdate,'yyyy-mm-dd hh24:mi') as startdate, to_char(enddate,'yyyy-mm-dd hh24:mi') as enddate,
       to_date(to_char(enddate,'yyyy-mm-dd hh24:mi') , 'yyyy-mm-dd hh24:mi') - to_date(to_char(startdate,'yyyy-mm-dd hh24:mi'),'yyyy-mm-dd hh24:mi') as cnt
from tbl_dayoff) v)
select dono, startdate, enddate, n+r as usedays 
from B



delete from tbl_dayoff;
commit;

-- 연차데이터
insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-12-03 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-04 13:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-10-03 14:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-10-03 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-12-03 14:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-04 13:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-11-15 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-11-15 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-11-08 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-11-10 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-12-18 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-20 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-12-15 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-15 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2021-12-01 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2021-12-01 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2020-09-01 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2020-09-01 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-12-05 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-05 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-02-05 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-02-05 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-04-30 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-04-30 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-05-09 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-05-10 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-04-02 14:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-04-02 18:00', 'yyyy-mm-dd hh24:mi'));


insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-07-20 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-07-22 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-08-05 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-08-05 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-09-15 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-09-15 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-09-16 14:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-09-16 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-12-11 14:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-11 18:00', 'yyyy-mm-dd hh24:mi'));


insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2020-07-20 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2020-07-21 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2020-04-12 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2020-04-12 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2020-01-27 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2020-01-29 18:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2020-10-20 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2020-10-20 18:00', 'yyyy-mm-dd hh24:mi'));

commit;
-- 1 행 이(가) 삽입되었습니다.


desc tbl_dayoff;

select *
from tbl_dayoff;

delete from tbl_dayoff
where dono='do-134';
commit;

-- to_char(sysdate, 'dy')    AS 줄인요일명
select to_char(to_date('2022.12.01', 'yyyy.mm.dd'), 'dy')    AS 줄인요일명  -- 월(Windows) , Mon(Linux)
from dual;
-- 목

select employee_no, dayoff_cnt, position
from tbl_employee
where position = '사원'

select employee_no, dayoff_cnt, position
from tbl_employee
where position = '대리'

select employee_no, dayoff_cnt, position
from tbl_employee
where position = '과장'

select employee_no, dayoff_cnt, position, name_kr
from tbl_employee
where position = '부장'

select employee_no, dayoff_cnt, position
from tbl_employee
where position = '대표'


select employee_no, dayoff_cnt, position
from tbl_employee
where employee_no = 100016


update tbl_employee set dayoff_cnt = 0
where employee_no != 99;
commit;

update tbl_employee set dayoff_cnt = dayoff_cnt-1
where employee_no != 99;
commit;


update tbl_employee set dayoff_cnt = dayoff_cnt+1
where employee_no != 99

update tbl_employee set dayoff_cnt = dayoff_cnt+1
where position = '사원'

select *
from tbl_employee;
desc tbl_employee;
-- 사원, 대리, 과장, 부장, 대표
-----------------------------------------------------------------------------------------
게시판

desc tbl_notice_board;
desc tbl_employee;
drop table tbl_scrap purge;
drop table tbl_nb_smcategory purge;
drop table tbl_scrap purge;
drop table tbl_board_scrap purge;
drop table tbl_notice_board purge;

-- 공지게시판(최종)
create table tbl_notice_board
(nbno                 varchar2(30)          not null     -- 공지게시물번호
-- ,nb_tpye             varchar2(30)          not null    -- 공지사항분류
,fk_employee_no       number(6)             not null     -- 사원번호  
,name_kr              varchar2(40)          not null     -- 작성자명
--,position             varchar2(100)         not null   -- 직위
,categoryTag          nvarchar2(30)         not null      -- 게시글분류번호
,subject              Nvarchar2(200)        not null     -- 글제목
,content              clob                  not null     -- 글내용
,priority             number default 0      not null     -- 상단고정   1:상단고정,  0:고정안함
,writedate            date default sysdate  not null     -- 작성일자
--,bookmark             number default 0      not null     -- 북마크     1:북마크,    0:북마크안함
,readcnt              number default 0      not null     -- 글조회수    
,status               number(1) default 1   not null     -- 글삭제여부  1:사용가능한 글,  0:삭제된글
,nb_fileName          varchar2(255)                      -- 저장될 파일명    => WAS(톰캣)에 저장될 파일명(2022103109271535243254235235234.png)                    
,nb_orgFilename       varchar2(255)                      -- 오리지널파일명    => 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
,fileSize             number                              -- 파일크기 

,constraint PK_tbl_notice_board_nbno primary key(nbno)
,constraint FK_tbl_notice_board_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
,constraint CK_tbl_notice_board_status check( status in(0,1) )
--,constraint CK_tbl_notice_board_bookmark check( status in(0,1) )
);


insert into tbl_notice_board(sno, tno, fk_employee_no)
values(sc||seq_tbl_scrap.nextval, '99', '관리자');
commit;

-- 스크랩 tbl_board_scrap 
create table tbl_board_scrap
(sno            varchar2(50)  not null   -- 스크랩번호
,fk_bno         varchar2(50)  not null   -- 스크랩한 게시물번호(공지, 자유)
,btype          number(1)     not null   -- 스크랩한 게시판 분류  0:공지, 1:자유
,fk_employee_no number        not null   -- 스크랩한 사원번호
,constraint PK_tbl_board_scrap_sno  primary key(sno)
,constraint CK_tbl_board_scrap_btype check( btype in(0,1) )
,constraint FK_tbl_board_scrap_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no) on delete cascade -- 사원번호 삭제되면 북마크도 삭제
);

-- seq_board_scrap 시퀀스 생성
create sequence seq_board_scrap
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into tbl_board_scrap
values(sc||seq_board_scrap.nextval, #{tno}, #{fk_employee_no})

insert into tbl_board_scrap(sno, fk_bno, btype, fk_employee_no)
values('sc-'||seq_board_scrap.nextval, '11', 0, 99) -- 공지


delete from tbl_board_scrap
where fk_bno = '11' and fk_employee_no = 99;
commit;
rollback;

select sno, fk_bno, btype, fk_employee_no
from tbl_board_scrap
where fk_employee_no = 99; 

select sno, fk_bno, btype, fk_employee_no
from tbl_board_scrap
where fk_employee_no = 100016; 

select sno, fk_bno, btype, fk_employee_no
from tbl_board_scrap
where fk_employee_no = 99 and fk_bno =10


select *
from tbl_notice_board;


-- 게시글 분류(공지게시판)
create table tbl_nb_smcategory
(sm_nbc_no         nvarchar2(30)  not null     -- 게시글분류번호
,sm_nbc_name       varchar2(50)   not null     -- 게시글분류명
,constraint PK_tbl_nb_smcategory primary key(sm_nbc_no)
);

insert into tbl_nb_smcategory(sm_nbc_no, sm_nbc_name)
values(1, '인사');

insert into tbl_nb_smcategory(sm_nbc_no, sm_nbc_name)
values(2, '경조사');

insert into tbl_nb_smcategory(sm_nbc_no, sm_nbc_name)
values(3, '행사');

insert into tbl_nb_smcategory(sm_nbc_no, sm_nbc_name)
values(4, '일반');
commit;


select *
from tbl_notice_board;

delete from tbl_notice_board;
commit;

insert into tbl_notice_board(nbno, fk_employee_no, name_kr, categoryTag, subject, content, priority, writedate, readcnt, status, nb_fileName, nb_orgFilename, fileSize) 
values(seq_tbl_nboard.nextval, #{fk_employee_no}, #{name_kr}, #{categoryTag}, #{subject}, #{content}, #{priority}, default, default, default, #{nb_fileName}, #{nb_orgFilename}, #{fileSize}) 

insert into tbl_notice_board(nbno, fk_employee_no, name_kr, categoryTag, subject, content, priority, writedate, readcnt, status)
values(seq_tbl_nboard.nextval, '99', '관리자', '일반', '[전원필독] ★퇴근 시 유의사항★', '해당 사항을 주의해주세요.', default, default, default, default);

insert into tbl_notice_board(nbno, fk_employee_no, name_kr, categoryTag, subject, content, priority, writedate, readcnt, status, nb_fileName, nb_orgFilename, fileSize)
values(seq_tbl_nboard.nextval, '99', '관리자', '일반', '[전원필독] ★퇴근 시 유의사항★', '해당 사항을 주의해주세요.', default, default, default, default);

-- 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기
select nbno, fk_employee_no, name_kr, categoryTag, subject, content, priority, 
       to_char(writedate, 'yyyy-mm-dd')as writedate, readcnt, status, nb_fileName
from tbl_notice_board
where status = 1
order by priority desc, nbno desc; 


-- 페이징 처리를 안한 검색어가 있는 전체 글목록 보여주기
select nbno, fk_employee_no, name_kr, categoryTag, subject, priority, 
       to_char(writedate, 'yyyy. mm. dd')as writedate, readcnt, status, nb_fileName
from tbl_notice_board
where status = 1
<if test='searchCondition != "" and searchVal != ""'>   <!-- 3. if test="key명"> <when test="key명"> 인 경우 "key명" -->
and lower(${searchCondition}) like '%'||lower(#{searchVal})||'%'   <!-- 2. 식별자(테이블명, 컬럼명)로 사용할때는 ${key명} -->  <!-- 1. HashMap 에 있는 데이터인 검색어는  #{key명} -->
</if>
order by priority desc, nbno desc; 

-- 총 게시물 건수(totalCount) 구하기
select count(*)
from tbl_notice_board
where status = 1  <!-- 검색이 없을때 -->
<if test='searchCondition != "" and searchVal != "" '>  <!-- 검색이 있을때 --> <!-- 또는 searchWord neq "" -->
and lower(${searchCondition}) like '%'||lower(#{searchVal})||'%'
</if>

-- 파일첨부가 있는 답변형 게시판의 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한 것)
select nbno, fk_employee_no, name_kr, categoryTag, subject, priority, 
       writedate, readcnt, status, nb_fileName
from 
(
    select rownum AS rno,
          nbno, fk_employee_no, name_kr, categoryTag, subject, priority, 
          writedate, readcnt, status, nb_fileName
    from 
    (
        select nbno, fk_employee_no, name_kr, categoryTag, subject, priority,
               to_char(writedate, 'yyyy. mm. dd')as writedate, readcnt, status, nb_fileName
        from tbl_notice_board
        where status = 1
--        <if test='searchCondition != "" and searchVal != "" '>     <!-- 또는 searchVal neq "" -->
--        and lower(${searchCondition}) like '%'||lower(#{searchVal})||'%' 
--        </if>
        order by priority desc, nbno desc
    ) V
)T
where rno between #{startRno} and #{endRno}
-- where rno between 1 and 10;


-- 게시물 1개 조회하기
select previousseq, previoussubject,
      nbno, fk_employee_no, name_kr, categoryTag, subject, content, priority, 
      writedate, readcnt, status, nb_fileName, nb_orgFilename, fileSize,
      nextseq, nextsubject
from 
(
   select lag(nbno, 1) over(order by nbno desc) AS previousseq,
          lag(subject, 1) over(order by nbno desc) AS previoussubject,
          nbno, fk_employee_no, name_kr, categoryTag, subject, content, priority,
          to_char(writedate, 'yyyy. mm. dd')as writedate,
          readcnt, status, nb_fileName, nb_orgFilename, TO_CHAR(fileSize, 'FM999,999,999') AS fileSize,
          lead(nbno, 1) over(order by nbno desc) AS nextseq,
          lead(subject, 1) over(order by nbno desc) AS nextsubject
   from tbl_notice_board
   where status = 1 
   <if test='searchCondition != "" and searchVal != ""'>
   and lower(${searchCondition}) like '%'|| lower(#{searchVal}) ||'%'
   </if>
) V
where V.nbno = #{nbno}


-- (파일첨부가 있는 댓글 및 답변글쓰기 게시판에서) 글 1개 조회하기 ==> 수정필요
select previousseq, previoussubject
     , seq, fk_userid, name, subject, content, readcount, regdate, pw
     , nextseq, nextsubject
     , groupno, fk_seq, depthno
     , fileName, orgFilename, fileSize
from 
(
   select lag(seq, 1) over(order by seq desc) AS previousseq
            , lag(subject, 1) over(order by seq desc) AS previoussubject
            , seq, fk_userid, name, subject, content, readcount
            , to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') AS regdate
            , pw
            , lead(seq, 1) over(order by seq desc) AS nextseq
            , lead(subject, 1) over(order by seq desc) AS nextsubject
            , groupno, fk_seq, depthno
            , fileName, orgFilename, fileSize
   from tbl_board
   where status = 1 
   <if test='searchType != "" and searchWord != ""'>  <!-- 검색어가 있다면 -->
   and lower(${searchType}) like '%'|| lower(#{searchWord}) ||'%'
   </if>
) V
where V.seq = #{seq}


delete from tbl_notice_board
where nbno = 14
commit;



select *
from tbl_notice_board;

categoryTag, subject, content, priority

update tbl_notice_board set categoryTag = '행사',
                            subject = '[전원필독] 유의해주시기 바랍니다.',
                            content = '유의사항 바랍니다',
                            priority = '1'
where nbno = 17




---------------------- 자유게시판 ----------------------

drop sequence commentSeq;
drop table tbl_free_board purge;
drop sequence boardSeq;
drop table tbl_fb_comment purge;

select * from tab;
select * from user_sequences;

-- 자유게시판(최종)
create table tbl_free_board
(fbno                 varchar2(30)          not null     -- 자유게시물번호
,fk_employee_no       number(6)             not null     -- 사원번호  
,name_kr              varchar2(40)          not null     -- 작성자명
,position             varchar2(100)         not null     -- 직위
,subject              Nvarchar2(200)        not null     -- 글제목
,content              clob                  not null     -- 글내용  
,commentCheck         number default 0      not null     -- 댓글허용여부     1:댓글허용,  0:댓글불가
,commentCount         number default 0      not null     -- 댓글개수
,writedate            date default sysdate  not null     -- 작성일자
,readcnt              number default 0      not null     -- 글조회수    
,status               number(1) default 1   not null     -- 글삭제여부  1:사용가능한 글,  0:삭제된글
,fb_fileName          varchar2(255)                      -- 저장될 파일명     => WAS(톰캣)에 저장될 파일명(2022103109271535243254235235234.png)                    
,fb_orgFilename       varchar2(255)                      -- 오리지널파일명    => 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
,fileSize             number                             -- 파일크기 
,constraint PK_tbl_free_board_fbno primary key(fbno)
,constraint FK_tbl_free_board_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
,constraint CK_tbl_free_board_status check( status in(0,1) )
);

-- 자유게시물번호
create sequence seq_tbl_fboard
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 자유게시판 댓글
create table tbl_fb_comment
(cno              number                not null     -- 댓글번호
,fk_employee_no   number(6)             not null     -- 사원번호
,name_kr          varchar2(40)          not null     -- 작성자명
,content          varchar2(1000)        not null     -- 댓글내용
,writedate        date default sysdate  not null     -- 작성일자
,status           number(1) default 1   not null     -- 글삭제여부
,fk_fbno          varchar2(30)          not null     -- 자유게시물번호
,groupno          number                not null     -- 대슬 그룹번호 
,fk_cno           number default 0      not null     -- 대댓글이라면 댓글(부모글)의 seq 컬럼의 값, 대댓글이 아닌 댓글일 경우 0
,depthno        number default 0        not null     -- 댓글(부모글)의 depthno + 1, 대댓글 아닌 댓글일 경우 0 을 가
,constraint PK_tbl_fb_comment_cno primary key(cno)
,constraint FK_tbl_fb_comment_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
,constraint FK_tbl_fb_comment_fk_fbno foreign key(fk_fbno) references tbl_free_board(fbno) on delete cascade -- 원글을 삭제하면 거기에 달린 댓글도 함께 삭제된다.
,constraint CK_tbl_fb_comment_status check( status in(1,0) ) 
);

-- 자유게시물 댓글번호
create sequence seq_tbl_fbcomment
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 스크랩 tbl_board_scrap 
create table tbl_board_scrap
(sno            varchar2(50)  not null   -- 스크랩번호
,fk_bno         varchar2(50)  not null   -- 스크랩한 게시물번호(공지, 자유)
,btype          number(1)     not null   -- 스크랩한 게시판 분류  0:공지, 1:자유
,fk_employee_no number        not null   -- 스크랩한 사원번호
,constraint PK_tbl_board_scrap_sno  primary key(sno)
,constraint CK_tbl_board_scrap_btype check( btype in(0,1) )
,constraint FK_tbl_board_scrap_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no) on delete cascade -- 사원번호 삭제되면 북마크도 삭제
);

-- 좋아요
create table tbl_heart
(hno            varchar2(50)    not null    -- 좋아요번호
,fk_bno         varchar2(50)    not null    -- 게시판번호
,btype          number(1)       not null    -- 좋아요한 게시판 분류  0:공지, 1:자유
,fk_employee_no number          not null    -- 좋아요한 사원번호
,constraint PK_tbl_heart_hno primary key(hno)
,constraint CK_tbl_heart_btype check( btype in(0,1) )
,constraint FK_tbl_heart_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
);

-- 좋아요 번호
create sequence seq_tbl_heart
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


insert into tbl_free_board(fbno, fk_employee_no, name_kr, position, subject, content, commentCheck, commentCount, writedate, readcnt, status) 
values(seq_tbl_fboard.nextval, #{fk_employee_no}, #{name_kr}, #{position}, #{subject}, #{content}, #{commentCheck}, default, default, default, default) 

insert into tbl_free_board(fbno, fk_employee_no, name_kr, position, subject, content, commentCheck, commentCount, writedate, readcnt, status, fb_fileName, fb_orgFilename, fileSize) 
values(seq_tbl_fboard.nextval, #{fk_employee_no}, #{name_kr}, #{position}, #{subject}, #{content}, #{commentCheck}, default, default, default, default, #{fb_fileName}, #{fb_orgFilename}, #{fileSize}) 

insert into tbl_free_board(fbno, fk_employee_no, name_kr, position, subject, content, commentCheck, commentCount, writedate, readcnt, status) 
values(seq_tbl_fboard.nextval, '100016', '이예은', '과장', '화이팅!', '화이팅입니다.', '1', default, default, default, default) 

select *
from tbl_free_board;



-- 파일첨부가 있는 답변형 게시판의 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한 것)
select fbno, fk_employee_no, name_kr, position, subject, commentCheck,
       commentCount, writedate, readcnt, status, fb_fileName
from 
(
    select rownum AS rno,
           fbno, fk_employee_no, name_kr, position, subject, commentCheck,
           commentCount, writedate, readcnt, status, fb_fileName
    from 
    (
        select fbno, fk_employee_no, name_kr, position, subject, commentCheck, commentCount,
               to_char(writedate, 'yyyy. mm. dd AM hh24:mi')as writedate, readcnt, status, fb_fileName
        from tbl_free_board
        where status = 1
--        <if test='searchCondition != "" and searchVal != "" '>     <!-- 또는 searchVal neq "" -->
--        and lower(${searchCondition}) like '%'||lower(#{searchVal})||'%' 
--        </if>
        order by fbno desc
    ) V
)T
where rno between #{startRno} and #{endRno}
--where rno between 1 and 10;


 
-- 게시물 1개 조회하기
select previousseq, previoussubject,
       fbno, fk_employee_no, name_kr, position, subject, content, commentCheck,
       commentCount, writedate, readcnt, status, fb_fileName, fb_orgFilename, fileSize,
       nextseq, nextsubject
from 
(
   select lag(fbno, 1) over(order by fbno desc) AS previousseq,
          lag(subject, 1) over(order by fbno desc) AS previoussubject,
          fbno, fk_employee_no, name_kr, position, subject, content, commentCheck,
          commentCount, to_char(writedate, 'yyyy. mm. dd')as writedate,
          readcnt, status, fb_fileName, fb_orgFilename, TO_CHAR(fileSize, 'FM999,999,999') AS fileSize,
          lead(fbno, 1) over(order by fbno desc) AS nextseq,
          lead(subject, 1) over(order by fbno desc) AS nextsubject
   from tbl_free_board
   where status = 1 
   <if test='searchCondition != "" and searchVal != ""'>
   and lower(${searchCondition}) like '%'|| lower(#{searchVal}) ||'%'
   </if>
) V
where V.fbno = #{fbno}


update tbl_free_board set subject = '요즘 너무 피곤합니다.',
                          content = '요즘 너무 피곤합니다.. 다들 영양제 챙겨드세요.',
                          commentCheck = '1'
where fbno = 13
commit;

select *
from tbl_employee





insert into tbl_fb_comment(cno, fk_employee_no, name_kr, position, content, writedate, fk_fbno, status)
values(seq_tbl_fbcomment.nextval, #{fk_employee_no}, #{name_kr}, #{position}, #{content}, default, #{fk_fbno}, default)

-- 자유게시판 댓글 테이블
create table tbl_fb_comment
(cno              number                not null    -- 댓글번호
,fk_employee_no   number(6)             not null    -- 사원번호
,name_kr          varchar2(40)          not null    -- 작성자명
,position         varchar2(100)         not null    -- 직위
,content          varchar2(1000)        not null    -- 댓글내용
,writedate        date default sysdate  not null    -- 작성일자
,fk_fbno          varchar2(30)          not null    -- 자유게시물번호
,status           number(1) default 1   not null    -- 글삭제여부  1:사용가능한 글,  0:삭제된글

--,groupno          number                not null    -- 댓글 그룹번호 
--,fk_cno           number default 0      not null    -- 대댓글이라면 댓글(부모글)의 seq 컬럼의 값, 대댓글이 아닌 댓글일 경우 0
--,depthno          number default 0      not null    -- 댓글(부모글)의 depthno + 1, 대댓글 아닌 댓글일 경우 0
,constraint PK_tbl_fb_comment_cno primary key(cno)
,constraint FK_tbl_fb_comment_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
,constraint FK_tbl_fb_comment_fk_fbno foreign key(fk_fbno) references tbl_free_board(fbno) on delete cascade
,constraint CK_tbl_fb_comment_status check( status in(1,0) ) 
);

-- 자유게시물 댓글번호
create sequence seq_tbl_fbcomment
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


select *
from tbl_fb_comment;

select *
from tbl_free_board;


update tbl_free_board set commentCount = commentCount + 1
where fbno = 14;
commit;

insert into tbl_fb_comment(cno, fk_employee_no, name_kr, position, content, writedate, fk_fbno, status, groupno, fk_cno ,depthno)
values(seq_tbl_fbcomment.nextval, #{fk_employee_no}, #{name_kr}, #{position}, #{content}, default, #{fk_fbno}, default)

insert into tbl_fb_comment(cno, fk_employee_no, name_kr, position, content, writedate, fk_fbno, status)
values(seq_tbl_fbcomment.nextval, '100016', '이예은1', '과장', '화이팅!', default, '13', default)


select name_kr, position, content, writedate
from
(
    select row_number() over(order by cno desc) AS rno, name_kr, position, content  
         , to_char(writedate, 'yyyy-mm-dd hh24:mi') AS writedate, fk_fbno, status 
    from tbl_fb_comment
    where status = 1 and fk_fbno = #{fk_fbno}
) V
where rno between #{startRno} and #{endRno}


select name_kr, position, content, writedate
from
(
    select row_number() over(order by cno desc) AS rno, name_kr, position, content  
         , to_char(writedate, 'yyyy.mm.dd hh24:mi') AS writedate, fk_fbno, status 
    from tbl_fb_comment
    where status = 1 and fk_fbno = 12
) V
where rno between #{startRno} and #{endRno}



SELECT TO_CHAR(SYSDATE-(3/(24*60)), 'HH24MISS') FROM DUAL


select count(*)
from tbl_fb_comment
where fk_bno = #{fk_bno}








































