show user; 
-- USER이(가) "FINAL_ORAUSER1"입니다.

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


