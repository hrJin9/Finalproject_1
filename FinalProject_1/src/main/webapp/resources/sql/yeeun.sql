show user; 
-- USER이(가) "FINAL_ORAUSER1"입니다.

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

-- 자유게시판
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


-- 자유게시판 댓글
create table tbl_fb_comment
(cno              number               not null     -- 댓글번호
,fk_employee_no   number(6)            not null     -- 사원번호
,name_kr          varchar2(40)          not null    -- 작성자명
,content          varchar2(1000)       not null     -- 댓글내용
,writedate        date default sysdate  not null    -- 작성일자
,status           number(1) default 1  not null     -- 글삭제여부
,fk_fbno          varchar2(30)          not null    -- 자유게시물번호
,groupno          number                not null    -- 대슬 그룹번호 
,fk_cno           number default 0      not null    -- 대댓글이라면 댓글(부모글)의 seq 컬럼의 값, 대댓글이 아닌 댓글일 경우 0
,depthno        number default 0       not null     -- 댓글(부모글)의 depthno + 1, 대댓글 아닌 댓글일 경우 0 을 가

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

-- 좋아요
create table tbl_heart
(hno    varchar2(50)    not null    -- 좋아요번호
,bno    varchar2(50)    not null    -- 게시판번호
,fk_employee_no number  not null    -- 좋아요한 사원번호

,constraint PK_tbl_heart_hno primary key(hno)
,constraint FK_tbl_heart_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
);

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
where fk_employee_no = 100016 and seldate = '2022-12-06'
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
where fk_employee_no = 100016 and seldate = '2022-12-06'

order by startTime asc



-- 총근무시간 조회하기(최종본)
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



-- 문법
WITH c AS 
(SELECT 492 AS MINUTES 
 FROM DUAL)
SELECT trim(to_char(trunc(MINUTES / 60), '09')) || ':' ||
       trim(to_char(trunc(mod(abs(MINUTES), 60)), '09')) AS HHMM
FROM c;	

NVL(MAX(seldate), '0') AS seldate,


-- 전체 근무목록 보여주기
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
where fk_employee_no = 100016 and seldate = '2022-12-05'
order by startTime desc


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
where fk_employee_no = 100016 and seldate = '2022-12-09'
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


select (300%60)
from dual;





and ROWNUM = 1 -- 한행만 추출







MERGE INTO tbl_attendance -- 삽입/수정의 대상이 될 테이블
USING DUAL -- 원본 데이터가 있는 테이블
   ON (adno == '' or adno == null)
WHEN NOT MATCHED THEN
    insert into tbl_attendance(adno, fk_employee_no, adcatgo, startTime, endTime)
    values(seq_attendance_no.nextval, 100016, '근무', to_date('2022-11-01 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-11-01 18:00', 'yyyy-mm-dd hh24:mi'))








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
where fk_employee_no = 100016 and substr(A.startdate, 0,4) = '2022' 
      and to_date(A.startdate,'yyyy-mm-dd') <= to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd')
order by startdate desc


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
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-12-03 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-04 13:00', 'yyyy-mm-dd hh24:mi'))

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-10-03 14:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-10-03 18:00', 'yyyy-mm-dd hh24:mi'))

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-12-03 14:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-04 13:00', 'yyyy-mm-dd hh24:mi'))

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-11-15 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-11-15 18:00', 'yyyy-mm-dd hh24:mi'))

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-11-08 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-11-10 18:00', 'yyyy-mm-dd hh24:mi'))

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-12-18 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-20 18:00', 'yyyy-mm-dd hh24:mi'))

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-12-15 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-15 18:00', 'yyyy-mm-dd hh24:mi'))

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2021-12-01 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2021-12-01 18:00', 'yyyy-mm-dd hh24:mi'))

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2020-09-01 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2020-09-01 18:00', 'yyyy-mm-dd hh24:mi'))

insert into tbl_dayoff(dono, fk_employee_no, fk_ano, docatgo, startdate, enddate)
values('do-'||seq_dayoff_no.nextval, 100016, 123, '연차', to_date('2022-12-05 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022-12-05 18:00', 'yyyy-mm-dd hh24:mi'))


commit;
-- 1 행 이(가) 삽입되었습니다.


desc tbl_dayoff;

select *
from tbl_dayoff;

delete from tbl_dayoff
where dono='do-82'
commit;

-- to_char(sysdate, 'dy')    AS 줄인요일명
select to_char(to_date('2022.12.01', 'yyyy.mm.dd'), 'dy')    AS 줄인요일명  -- 월(Windows) , Mon(Linux)
from dual;
-- 목















