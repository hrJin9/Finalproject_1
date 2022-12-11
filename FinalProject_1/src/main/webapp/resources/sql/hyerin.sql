show user;

drop table tbl_message purge;
drop table tbl_message_send purge;
drop table tbl_scrap purge;
drop table tbl_authority purge;

PURGE RECYCLEBIN;   

-- tbl_message 테이블 생성
create table tbl_message
(mno    varchar2(50)    not null   -- 메시지번호
,writer  number  not null   -- 작성자
,mgroup  varchar2(50)    not null   -- 원메시지번호
,reno    varchar2(50)               -- 답메시지번호
,subject varchar2(50)    not null   -- 제목
,content clob            not null   -- 내용
,m_systemfilename    varchar2(200)  -- 오리지널파일명
,m_originfilename  varchar2(200)    -- 파일명
,file_size   number                 -- 파일크기
,status     number      default 1   -- 삭제여부

,constraint PK_tbl_message_mno primary key(mno)
,constraint CK_tbl_message_status check (status in (0,1))
--constraint FK_tbl_message_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
);

-- tbl_message 제약조건 추가
ALTER TABLE tbl_message ADD CONSTRAINT fk_tbl_message_mgroup foreign key(mgroup) references tbl_message(mno);
ALTER TABLE tbl_message ADD CONSTRAINT fk_tbl_message_reno foreign key(reno) references tbl_message(mno);


-- seq_tbl_message 시퀀스 생성
create sequence seq_tbl_message
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- tbl_message_file 테이블  생성
create table tbl_message_file
(mfno   varchar2(50)    not null --메시지파일번호
,fk_mno varchar2(50)    not null --메시지번호
,m_systemfilename    varchar2(200)  -- 오리지널파일명
,m_originfilename  varchar2(200)    -- 파일명
,file_size   number                 -- 파일크기

,constraint PK_tbl_message_file_mfno primary key(mfno)
,constraint FK_tbl_message_file_fk_mno foreign key(fk_mno) references tbl_message(mno) on delete cascade
);


-- tbl_message_file 시퀀스 생성
create sequence seq_tbl_message_file
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- tbl_message_send 테이블 생성
create table tbl_message_send
(msno           varchar2(50)    not null    -- 메시지전송번호
,fk_mno         varchar2(50)    not null    -- 메시지번호
,receiver number          not null    -- 수신자
,ms_sendtime        date default sysdate        -- 보낸시간
,ms_checktime   date
,constraint PK_tbl_message_send_msno primary key(msno)
,constraint fk_tbl_message_send_fk_mno foreign key(fk_mno) references tbl_message(mno)
--,constraint fk_tbl_message_send_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
);

alter table tbl_message_send rename column fk_employee_no to receiver;



-- seq_tbl_message_send 시퀀스 생성
create sequence seq_tbl_message_send
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



-- tbl_scrap 생성
create table tbl_scrap
(sno    varchar2(50)    not null    -- 스크랩번호
,tno    varchar2(50)    not null    -- 참조테이블번호
,fk_employee_no number  not null    -- 스크랩한 사원번호

,constraint PK_tbl_scrap_sno   primary key(sno)
--,constraint FK_tbl_scrap_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
);

-- seq_tbl_scrap 시퀀스 생성
create sequence seq_tbl_scrap
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- tbl_authority 생성
create table tbl_authority
(atno    number   not null    -- 권한번호
,atname  varchar2(50)   not null    -- 권한이름

,constraint PK_tbl_authority_atno   primary key(atno)
,constraint CK_tbl_authority_atno check (atno in (1,2,3,4,5))
);



-- tbl_dayoff 테이블 생성
create table tbl_dayoff
(dono   varchar2(50)    not null -- 연차번호
,fk_employee_no number(6)    not null -- 사원번호
,docnt  number(10) --연차수
,docatgo    varchar2(50)
,startdate  date
,enddate    date

,constraint PK_tbl_dayoff_dono primary key(dono)
,constraint fk_tbl_dayoff_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
);


-- tbl_attendance 테이블 생성
create table tbl_attendance
(adno   varchar2(50)    not null -- 근태번호
,fk_employee_no number(6)    not null -- 사원번호
,adcatgo    varchar2(50)
,startdate  date
,enddate    date

,constraint PK_tbl_dayoff_adno primary key(adno)
,constraint fk_tbl_attendance_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)
);

-- tbl_attendance_catgo 테이블 생성
create table tbl_attendance_catgo
(adcatgono  number    not null -- 근태종류번호
,adcatgo    varchar2(50)

,constraint PK_tbl_dayoff_adcatgono primary key(adcatgono)
);



-------------------------------------------------------------------------------
-- tbl_message에 데이터 넣기

insert into tbl_message
values('m-'||seq_tbl_message.nextval, 101, 'm-'||seq_tbl_message.currval, null, '이 안건 얼른 처리해주세요1','제발빨리용엥엥엥저진짜배고프거든요....',null,null,null,default);

insert into tbl_message
values('m-'||seq_tbl_message.nextval, 102, 'm-'||seq_tbl_message.currval, null, '이 안건 얼른 처리해주세요2','제발빨리용엥엥엥저진짜배고프거든요....',null,null,null,default);

insert into tbl_message
values('m-'||seq_tbl_message.nextval, 103, 'm-'||seq_tbl_message.currval, null, '이 안건 얼른 처리해주세요3','제발빨리용엥엥엥저진짜배고프거든요....',null,null,null,default);

insert into tbl_message
values('m-'||seq_tbl_message.nextval, 104, 'm-'||seq_tbl_message.currval, null, '이 안건 얼른 처리해주세요4','제발빨리용엥엥엥저진짜배고프거든요....',null,null,null,default);

insert into tbl_message
values('m-'||seq_tbl_message.nextval, 105, 'm-'||seq_tbl_message.currval, null, '이 안건 얼른 처리해주세요5','제발빨리용엥엥엥저진짜배고프거든요....',null,null,null,default);



insert into tbl_message
values('m-'||seq_tbl_message.nextval, 106, 'm-'||seq_tbl_message.currval, 'm-'||seq_tbl_message.currval, '오늘 점심뭐먹어요','마라탕도 먹고싶고...뭐.......',null,null,null,default);

insert into tbl_message
values('m-'||seq_tbl_message.nextval, 107, 'm-'||seq_tbl_message.currval, null, '파이널끝나고 곱창 조지자','헤헤헤 빨리 끝났으면....곱창 맛있다던 거기 너무 궁금행',null,null,null,default);

insert into tbl_message
values('m-'||seq_tbl_message.nextval, 108, 'm-'||seq_tbl_message.currval, 'm-12', '오늘 점심으로 마라탕 괜찮당','괜찮은듯 ㄹㅇ....츄베릅',null,null,null,default);

insert into tbl_message
values('m-'||seq_tbl_message.nextval, 109, 'm-'||seq_tbl_message.currval, 'm-12', '나는 점심으루 피자먹고싶은뎅','어때...피맥도 괜찮아...일단 한잔하고 들어가자..',null,null,null,default);

insert into tbl_message
values('m-'||seq_tbl_message.nextval, 110, 'm-'||seq_tbl_message.currval, 'm-12', '피자는 저녁에먹고 점심 마라탕먹자','피맥 나중에 ㄱㄱㄱ....',null,null,null,default);

commit;

rollback;


-- 시퀀스 초기화
select seq_tbl_message.currval from dual;

ALTER SEQUENCE seq_tbl_message INCREMENT BY -6;

SELECT seq_tbl_message.NEXTVAL FROM DUAL;

ALTER SEQUENCE seq_tbl_message INCREMENT BY 1;

commit;

--------------------------------------------------------------------------------
-- tbl_message_send 에 데이터 넣기
insert into tbl_message_send
values('ms-'||seq_tbl_message_send.nextval, 'm-2', 106, sysdate-5);

insert into tbl_message_send
values('ms-'||seq_tbl_message_send.nextval, 'm-3', 106, sysdate-4);

insert into tbl_message_send
values('ms-'||seq_tbl_message_send.nextval, 'm-4', 106, sysdate-3);

insert into tbl_message_send
values('ms-'||seq_tbl_message_send.nextval, 'm-5', 106, sysdate-2);

insert into tbl_message_send
values('ms-'||seq_tbl_message_send.nextval, 'm-6', 106, sysdate-1);

insert into tbl_message_send
values('ms-'||seq_tbl_message_send.nextval, 'm-16', 106, sysdate-1);

insert into tbl_message_send
values('ms-'||seq_tbl_message_send.nextval, 'm-16', 107, sysdate-1);

insert into tbl_message_send
values('ms-'||seq_tbl_message_send.nextval, 'm-16', 108, sysdate-1);

insert into tbl_message_send
values('ms-'||seq_tbl_message_send.nextval, 'm-16', 109, sysdate-1);


commit;

--------------------------------------------------------------------------------
-- tbl_scrap 테이블에 데이터 넣어주기

insert into tbl_scrap
values('sc-'||seq_tbl_scrap.nextval, 'm-13', 106);

insert into tbl_scrap
values('sc-'||seq_tbl_scrap.nextval, 'm-14', 106);

insert into tbl_scrap
values('sc-'||seq_tbl_scrap.nextval, 'm-15', 106);

commit;


------------------------------------------------------------
-- tbl_employee에 데이터 넣기
desc tbl_employee
select * from tbl_employee

insert into tbl_employee
values(106, 100, 46, '진혜린', 'Hyerin Jin', 'qwer1234$', '신입', null, sysdate-30, 3000, null, '010-8828-4730', '21105', null, null,null, 'hyerin25@naver.com', 2, null, null, null, null, null, null, null, null, null, null, null, 1);

insert into tbl_employee
values(107, 10, 5, '이예은', 'Yeeun Lee', 'qwer1234$', '경력', null, sysdate-15, 5000, null, '010-3329-8922', '21105', null, null,null, 'yeeun@naver.com', 2, null, null, null, null, null, null, null, null, null, null, null, 1);

insert into tbl_employee
values(108, 20, 7, '강채영', 'Chaeyoung Kang', 'qwer1234$', '경력', null, sysdate-25, 5000, null, '010-9936-1158', '21105', null, null,null, 'chaeyoung@naver.com', 2, null, null, null, null, null, null, null, null, null, null, null, 1);

insert into tbl_employee
values(109, 30, 13, '김지은', 'Jieun Kim', 'qwer1234$', '경력', null, sysdate-5, 5000, null, '010-2559-6210', '21105', null, null,null, 'jieun@naver.com', 2, null, null, null, null, null, null, null, null, null, null, null, 1);

select * from tbl_employee




-- tbl_team 테이블에 데이터 넣기
create or replace procedure pcd_tbl_team_insert
(p_team_name  IN  varchar2
,p_deptno  IN  number
)
is
begin
for i in 1..5 loop
insert into tbl_team
values(seq_tbl_team.nextval, p_team_name||i||'팀',p_deptno,null,default);
end loop;
end pcd_tbl_team_insert;
--Procedure PCD_TBL_TEAM_INSERT이(가) 컴파일되었습니다.

exec pcd_tbl_team_insert('경영',10);
exec pcd_tbl_team_insert('마케팅',20);
exec pcd_tbl_team_insert('구매',30);
exec pcd_tbl_team_insert('인사',40);
exec pcd_tbl_team_insert('물류',50);
exec pcd_tbl_team_insert('영업',60);
exec pcd_tbl_team_insert('재무',70);
exec pcd_tbl_team_insert('회계',80);
exec pcd_tbl_team_insert('제조',90);
exec pcd_tbl_team_insert('IT',100);

---------------------------------------------------------------------------------
-- 사원 관련 테이블 조인한 뷰

create or replace view v_employee
as
select employee_no, A.fk_department_no, department_name, fk_team_no, team_name, name_kr, name_en, passwd, jointype, hire_date, salary, commission_pct, mobile, postcode, address, detail_address, extra_address, email, gender, profile_systemfilename, profile_orginfilename, academic_ability, major, militaryservice, bank, accountnumber, status, role, position, authority, birthday, dayoff_cnt, employmenttype
from
    (
    select employee_no, fk_department_no, department_name, fk_team_no, name_kr, name_en, passwd, jointype, hire_date, salary, commission_pct, mobile, postcode, address, detail_address, extra_address, email, gender, profile_systemfilename, profile_orginfilename, academic_ability, major, militaryservice, bank, accountnumber, status, role, position, authority, birthday, dayoff_cnt, employmenttype
    from tbl_employee E
    left join tbl_departments D
    on fk_department_no = department_no
    )A
left join tbl_team
on fk_team_no = team_no;





--------------------------------------------------------------------------------
-- tbl_employee 시퀀스 만들기
create sequence seq_tbl_employee
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- tbl_employee에 데이터 넣기
create or replace procedure pcd_tbl_employee_insert
(p_deptno  IN  number
,p_teamno  in number
,p_name_kr in varchar2
,p_name_en in varchar2
,p_pwd in varchar2
,p_salary in number
,p_jointype in varchar2
,p_mobile in varchar2
,p_email in varchar2
,p_major in varchar2
,p_role in varchar2 -- 직무
,p_position in varchar2 --직위
)
is
begin
for i in 1..5 loop
insert into tbl_employee
values(p_deptno||lpad(seq_tbl_employee.nextval,4,0), p_deptno, p_teamno, p_name_kr||i, p_name_en||i, p_pwd, p_jointype, null, sysdate-300,  p_salary, null, p_mobile||i, '21105'
,null, null, null, p_email||i||'@naver.com', 2, null, null, '대졸', p_major, null, null, null, 1, p_role, p_position, 1, 1);
end loop;
end pcd_tbl_employee_insert;

rollback;

exec pcd_tbl_employee_insert(10, 1, '진혜린','Hyerin Jin', 'qwer1234$', 3000, '신입', '010-8828-471','hyerin1','경영학과','경영관리','사원');
exec pcd_tbl_employee_insert(10, 2, '강채영','Chaeyoung Kang', 'qwer1234$', 3000, '신입', '010-9936-111','chaeyoung1','경영학과','경영기획','사원');
exec pcd_tbl_employee_insert(10, 3, '이예은','Yeeun Lee', 'qwer1234$', 3000, '신입', '010-3329-891','yeeun1','경영학과','경영지원','사원');
exec pcd_tbl_employee_insert(10, 4, '김지은','Jieun Kim', 'qwer1234$', 3000, '신입', '010-2559-621','jieun1','경영학과','경영평가','사원');
exec pcd_tbl_employee_insert(10, 5, '서영학','Younghak Seo', 'qwer1234$', 3000, '신입', '010-8828-473','younghak1','경영학과','경영관리','사원');

exec pcd_tbl_employee_insert(20, 6, '진혜린','Hyerin Jin', 'qwer1234$', 3100, '신입', '010-8828-472','hyerin2','경영학과','브랜드기획','사원');
exec pcd_tbl_employee_insert(20, 7, '강채영','Chaeyoung Kang', 'qwer1234$', 3100, '신입', '010-9936-112','chaeyoung2','경영학과','콘텐츠기획','사원');
exec pcd_tbl_employee_insert(20, 8, '이예은','Yeeun Lee', 'qwer1234$', 3100, '신입', '010-3329-892','yeeun2','산업디자인','서비스기획','사원');
exec pcd_tbl_employee_insert(20, 9, '김지은','Jieun Kim', 'qwer1234$', 3100, '신입', '010-2559-622','jieun2','산업디자인','마케팅전략','사원');
exec pcd_tbl_employee_insert(20, 10, '서영학','Younghak Seo', 'qwer1234$', 3100, '신입', '010-8828-472','younghak2','경영학과','마케팅퍼포먼스','사원');

exec pcd_tbl_employee_insert(30, 11, '진혜린','Hyerin Jin', 'qwer1234$', 3200, '신입', '010-8828-473','hyerin3','경영학과','구매기획','사원');
exec pcd_tbl_employee_insert(30, 12, '강채영','Chaeyoung Kang', 'qwer1234$', 3200, '신입', '010-9936-113','chaeyoung3','경영학과','구매관리','사원');
exec pcd_tbl_employee_insert(30, 13, '이예은','Yeeun Lee', 'qwer1234$', 3200, '신입', '010-3329-893','yeeun3','산업디자인','전략구매','사원');
exec pcd_tbl_employee_insert(30, 14, '김지은','Jieun Kim', 'qwer1234$', 3200, '신입', '010-2559-623','jieun3','산업디자인','구매지원','사원');
exec pcd_tbl_employee_insert(30, 15, '서영학','Younghak Seo', 'qwer1234$', 3200, '신입', '010-8828-471','younghak3','경영학과','구매거래','사원');

exec pcd_tbl_employee_insert(40, 16, '진혜린','Hyerin Jin', 'qwer1234$', 2900, '신입', '010-8828-474','hyerin4','경영학과','인사관리','사원');
exec pcd_tbl_employee_insert(40, 17, '강채영','Chaeyoung Kang', 'qwer1234$', 2900, '신입', '010-9936-114','chaeyoung4','경영학과','채용','사원');
exec pcd_tbl_employee_insert(40, 18, '이예은','Yeeun Lee', 'qwer1234$', 2900, '신입', '010-3329-894','yeeun4','경영학과','배치','사원');
exec pcd_tbl_employee_insert(40, 19, '김지은','Jieun Kim', 'qwer1234$', 2900, '신입', '010-2559-624','jieun4','경영학과','급여','사원');
exec pcd_tbl_employee_insert(40, 20, '서영학','Younghak Seo', 'qwer1234$', 2900, '신입', '010-8828-474','younghak4','경영학과','노무','사원');


exec pcd_tbl_employee_insert(50, 21, '진혜린','Hyerin Jin', 'qwer1234$', 3000, '신입', '010-8828-475','hyerin5','물류학과','재고관리','사원');
exec pcd_tbl_employee_insert(50, 22, '강채영','Chaeyoung Kang', 'qwer1234$', 3000, '신입', '010-9936-115','chaeyoung5','경영학과','창고관리','사원');
exec pcd_tbl_employee_insert(50, 23, '이예은','Yeeun Lee', 'qwer1234$', 3000, '신입', '010-3329-895','yeeun5','경영학과','배송관리','사원');
exec pcd_tbl_employee_insert(50, 24, '김지은','Jieun Kim', 'qwer1234$', 3000, '신입', '010-2559-625','jieun5','경영학과','물류관리','사원');
exec pcd_tbl_employee_insert(50, 25, '서영학','Younghak Seo', 'qwer1234$', 3000, '신입', '010-8828-475','younghak5','경영학과','물류기획','사원');

exec pcd_tbl_employee_insert(60, 26, '진혜린','Hyerin Jin', 'qwer1234$', 3100, '신입', '010-8828-476','hyerin6','경영학과','일반영업','사원');
exec pcd_tbl_employee_insert(60, 27, '강채영','Chaeyoung Kang', 'qwer1234$', 3100, '신입', '010-9936-116','chaeyoung6','경영학과','매장관리','사원');
exec pcd_tbl_employee_insert(60, 28, '이예은','Yeeun Lee', 'qwer1234$', 3100, '신입', '010-3329-896','yeeun6','경영학과','해외영업','사원');
exec pcd_tbl_employee_insert(60, 29, '김지은','Jieun Kim', 'qwer1234$', 3100, '신입', '010-2559-626','jieun6','경영학과','영업기획','사원');
exec pcd_tbl_employee_insert(60, 30, '서영학','Younghak Seo', 'qwer1234$', 3100, '신입', '010-8828-476','younghak6','경영학과','기술영업','사원');

exec pcd_tbl_employee_insert(70, 31, '진혜린','Hyerin Jin', 'qwer1234$', 3100, '신입', '010-8828-477','hyerin7','경영학과','재무기획','사원');
exec pcd_tbl_employee_insert(70, 32, '강채영','Chaeyoung Kang', 'qwer1234$', 3100, '신입', '010-9936-117','chaeyoung7','회계학과','자금운용','사원');
exec pcd_tbl_employee_insert(70, 33, '이예은','Yeeun Lee', 'qwer1234$', 3100, '신입', '010-3329-897','yeeun7','세무회계학과','세무','사원');
exec pcd_tbl_employee_insert(70, 34, '김지은','Jieun Kim', 'qwer1234$', 3100, '신입', '010-2559-627','jieun7','경영학과','IR','사원');
exec pcd_tbl_employee_insert(70, 35, '서영학','Younghak Seo', 'qwer1234$', 3100, '신입', '010-8828-477','younghak7','세무회계학과','자금운용','사원');


exec pcd_tbl_employee_insert(80, 36, '진혜린','Hyerin Jin', 'qwer1234$', 3200, '신입', '010-8828-478','hyerin8','경영학과','웹서비스','사원');
exec pcd_tbl_employee_insert(80, 37, '강채영','Chaeyoung Kang', 'qwer1234$', 3200, '신입', '010-9936-118','chaeyoung8','컴퓨터공학과','앱서비스','사원');
exec pcd_tbl_employee_insert(80, 38, '이예은','Yeeun Lee', 'qwer1234$', 3200, '신입', '010-3329-898','yeeun8','컴퓨터공학과','시스템소프트웨어','사원');
exec pcd_tbl_employee_insert(80, 39, '김지은','Jieun Kim', 'qwer1234$', 3200, '신입', '010-2559-628','jieun8','경영학과','응용소프트웨어','사원');
exec pcd_tbl_employee_insert(80, 40, '서영학','Younghak Seo', 'qwer1234$', 3200, '신입', '010-8828-478','younghak8','컴퓨터공학과','IT기획','사원');

exec pcd_tbl_employee_insert(90, 41, '진혜린','Hyerin Jin', 'qwer1234$', 3300, '신입', '010-8828-479','hyerin9','기계공학과','생산기획','사원');
exec pcd_tbl_employee_insert(90, 42, '강채영','Chaeyoung Kang', 'qwer1234$', 3300, '신입', '010-9936-119','chaeyoung9','전자공학과','설비기획','사원');
exec pcd_tbl_employee_insert(90, 43, '이예은','Yeeun Lee', 'qwer1234$', 3300, '신입', '010-3329-899','yeeun9','기계공학과','공정관리','사원');
exec pcd_tbl_employee_insert(90, 44, '김지은','Jieun Kim', 'qwer1234$', 3300, '신입', '010-2559-629','jieun9','전자공학과','설비관리','사원');
exec pcd_tbl_employee_insert(90, 45, '서영학','Younghak Seo', 'qwer1234$', 3300, '신입', '010-8828-479','younghak9','기계공학과','생산관리','사원');

commit;








--------------------------------------------------------------------------------
---------------------------------------------------------------------------------









-- 스크랩한거 보여주는거
select mno, writer, w_name, w_deptname, receiver, name_kr as r_name, department_name as r_deptname, mgroup, reno, subject, content, to_char(ms_sendtime,'yy. mm. dd') as ms_sendtime, to_char(ms_checktime,'yy. mm. dd') as ms_checktime, TMM.status, filecnt
from
(
    select mno, writer, name_kr as w_name, department_name as w_deptname, receiver, mgroup, reno, subject, content,ms_sendtime, ms_checktime, TM.status
    from
    (
        select mno, writer, receiver, mgroup, reno, subject, content, status, ms_sendtime, ms_checktime
        from tbl_message M
        join tbl_message_send MS
        on M.mno = MS.fk_mno
    ) TM
    left join v_employee E
    on E.employee_no = writer
    order by ms_sendtime desc
) TMM
left join v_employee
on employee_no = receiver
left join
(select distinct fk_mno, count(*) as filecnt from tbl_message_file group by fk_mno)
on mno = fk_mno
where receiver = '100006' and TMM.status = 1

select * from tbl_message_file

-- 메시지목록 전체개수 구하기
select ceil(count(*)/10)
from
(
    select rno, mno, writer, name_kr as w_name, department_name as w_deptname, receiver, mgroup, reno, subject, content, m_systemfilename, m_originfilename, file_size, ms_sendtime, ms_checktime, TM.status
    from
    (
        select row_number() over(order by ms_sendtime desc) as rno, mno, writer, receiver, mgroup, reno, subject, content, m_systemfilename, m_originfilename, file_size, status, ms_sendtime, ms_checktime
        from tbl_message M
        join tbl_message_send MS
        on M.mno = MS.fk_mno
          join tbl_scrap S
        on S.tno = mno
        where receiver = 100006 and status = 1
    ) TM
    left join v_employee E
    on E.employee_no = writer
    order by ms_sendtime desc
) TMM
left join v_employee
on employee_no = receiver

100006
-------------------------------------------------------------------------------

-- tbl_message 에서 해당 메시지 하나 내용을 알아오기
select mno, reno, writer, name_kr as w_name, department_name as w_dept, subject, content
from tbl_message join v_employee on employee_no = writer

select * from tbl_message

select * from v_employee
-- 받는사람 정보

select fk_mno, receiver, name_kr as r_name, department_name as r_dept,
from tbl_message_send join v_employee on receiver = employee_no
where fk_mno = 'm-12'


select distinct to_char(ms_sendtime, 'yyyy. mm. dd AM hh:mi') as ms_sendtime
from tbl_message_send
where fk_mno = 'm-12'

select * from tbl_message_send


-----------------------------------

-- 파일 불러오기

select *
from tbl_message_file


---------------------------------------------------------------
-- message_write

-- 부서, 팀 알아오기
select department_no, department_name, listagg(team_no, ',') within group (order by team_no) as togroup,listagg(team_name, ',') within group (order by team_name) as tngroup, listagg(total,',') within group (order by team_no) as tcnt
from
(
    select department_no, department_name, team_no, team_name, total
    from
    (
        select T.fk_department_no, TC.team_no, TC.team_name, TC.total
        from
        (
            select team_no, team_name, count(employee_no) as total
            from tbl_team
            left outer join tbl_employee
            on fk_team_no = team_no
            where delete_status = 1
            group by (team_no, team_name)
        ) TC
        join tbl_team T
        on TC.team_no = T.team_no
    ) T
    join tbl_departments D
    on D.department_no = T.fk_department_no
    where delete_status = 1
)
group by (department_no,department_name)


select department_no, department_name
from tbl_departments




-- 팀의 구성원수 구하기
select department_no, department_name, team_no, team_name, total
from
(
    select T.fk_department_no, TC.team_no, TC.team_name, TC.total
    from
    (
        select team_no, team_name, count(employee_no) as total
        from tbl_team
        left outer join tbl_employee
        on fk_team_no = team_no
        where delete_status = 1
        group by (team_no, team_name)
    ) TC
    join tbl_team T
    on TC.team_no = T.team_no
) T
join tbl_departments D
on D.department_no = T.fk_department_no
where delete_status = 1

select * from v_employee


-- 구성원목록 가져오기
select fk_department_no, department_name, fk_team_no, team_name, employee_no, name_kr, role, position, profile_systemfilename
from v_employee
where status = 1
and name_kr like '%'||'강'||'%'


select fk_department_no, department_name, fk_team_no, team_name, employee_no, name_kr, role, position, profile_systemfilename
from v_employee
where status = 1
and name_kr like '%' || '강' || '%'

select * from tbl_employee

select * from tbl_message

delete from tbl_message where mno = 'm-21'


commit;
------------------------------------------------

-- 메시지 insert하기
insert into tbl_message (mno, writer, mgroup, reno, subject, content, status)
values(#{mno}, #{writer}, #{mgroup}, #{reno}, #{subject}, #{content}, default)

select * from tbl_message_file

-- 메시지 파일에 insert하기
insert into tbl_message_file (mfno, fk_mno, m_systemfilename, m_originfilename, file_size)
values('mf-'||seq_tbl_message_file.nextval, #{fk_mno}, #{m_systemfilename}, #{m_originfilename}, #{file_size})

select * from tbl_message_send

-- tbl_message_send 메시지 수신자에 insert하기
insert into tbl_message_send (msno, fk_mno, receiver, ms_sendtime, ms_checktime, scrapstatus)
values('ms-'||seq_tbl_message_send.nextval, #{fk_mno}, #{receiver}, #{ms_sendtime}, null, default)


-------------------------------------------------------------------------------

select * from tbl_message
where mno = 'm-58'

select * from tbl_message_send
where fk_mno = 'm-58'


select * from tbl_message_send

select * from tbl_message_file


--  메시지파일 읽어오기
select mfno, fk_mno, m_systemfilename, m_originfilename, file_size
from tbl_message_file
where fk_mno = #{fk_mno}




select * from tbl_message_send 

select * from tbl_message

-- 관련메시지 현재것과 관련된 이전, 다음글 3개만 가져오기 
select mno, mgroup,name_kr, department_name, subject, to_char(ms_sendtime,'yy. mm. dd') as ms_sendtime, receiverstatus
from
    (select row_number() over(order by ms_sendtime desc) as rno, mno, mgroup, name_kr, department_name, subject, ms_sendtime, receiverstatus
    from
        (
        select distinct mno, mgroup, name_kr, department_name, subject, ms_sendtime ,receiverstatus
        from tbl_message
        left join tbl_message_send
        on mno = fk_mno
        left join v_employee
        on writer = employee_no
        where mgroup = (select mgroup from tbl_message where mno = 'm-12') 
        and mno in (
        select n_mno, mno, b_mno
            from (
                   select LAG(mno) OVER (ORDER BY to_number(substr(mno,3))) as n_mno,
                   mno,
                   LEAD(mno) OVER (ORDER BY to_number(substr(mno,3))) as b_mno
                   from tbl_message
                   where mgroup = (select mgroup from tbl_message where mno = 'm-12')
                 )
            where mno = 'm-12'        
        )        
        order by to_number(substr(mno,3))
        )
    )



-- 관련메시지 3개 읽어오기...ㅜ
select n_mno, n_writer, n_subject,n_sendtime, mno, writer, subject, sendtime, b_mno, name_kr||'·'||department_name as b_writer, b_subject, b_sendtime
from
(
    select n_mno, n_writer, n_subject, n_sendtime, MF.mno, MF.writer, MF.subject, MF.sendtime, b_mno, B.writer as b_writer, B.subject as b_subject, B.sendtime as b_sendtime
    from
    (
        select n_mno, name_kr||'·'||department_name as n_writer, n_subject,n_sendtime, mno, writer, subject, sendtime,b_mno
        from
        (
        select n_mno, N.writer as n_writer, N.subject as n_subject, N.sendtime as n_sendtime, M.mno, M.writer, M.sendtime, M.subject, M.b_mno
        from
        (
           select mgroup, LAG(mno) OVER (ORDER BY to_number(substr(mno,3))) as n_mno, mno, subject, name_kr||'·'||department_name as writer, sendtime, LEAD(mno) OVER (ORDER BY to_number(substr(mno,3))) as b_mno
           from tbl_message
           join v_employee on writer = employee_no
           where mgroup = (select mgroup from tbl_message where mno = 'm-16')
        ) M
        left join tbl_message N
        on N.mno = M.n_mno
        ) 
        left join v_employee on employee_no = n_writer
    ) MF
    left join tbl_message B
    on MF.b_mno = B.mno
)
left join v_employee on employee_no = b_writer
where mno = 'm-16'


select * from tbl_message_send whe

select * from tbl_departments

alter table tbl_message_send add delete_status number default 1

select * from tbl_message_send


alter table tbl_message_send drop column receiverstatus;


-- 메시지 전체 목록 읽어오기
select count(*) from tbl_message_send
where receiver = 100006

--안읽었을때
select count(*) from tbl_message_send
where receiver = 100006
and ms_checktime is null




-------------------------------------

select * from tbl_message_send

update tbl_message_send set ms_checktime = null

update tbl_message_send set ms_checktime = sysdate --모두 읽음 표시

update tbl_message_send set ms_checktime = null -- 모두 안읽음 표시

update tbl_message_send set scrapstatus = 1 -- 스크랩표시

commit;



select mno, writer, w_name, w_deptname, receiver, name_kr as r_name, department_name as r_deptname, mgroup, reno, subject, content, to_char(sendtime,'yy. mm. dd') as sendtime, to_char(ms_checktime,'yy. mm. dd') as ms_checktime, TMM.status, depthno, filecnt, scapstatus, delete_status
from
(
    select rno, mno, writer, name_kr as w_name, department_name as w_deptname, receiver, mgroup, reno, subject, content, sendtime, ms_checktime, TM.status, depthno,  scapstatus, delete_status
    from
    (
        select row_number() over(order by sendtime desc) as rno, mno, writer, receiver, mgroup, reno, subject, content, status, sendtime, ms_checktime, depthno, scrapstatus, delete_status
        from tbl_message M
        join tbl_message_send MS
        on M.mno = MS.fk_mno
        where receiver = 100006 and delete_status = 1
       
    ) TM
    left join v_employee E
    on E.employee_no = writer

    order by sendtime desc
) TMM
left join v_employee
on employee_no = receiver
left join
(select distinct fk_mno, count(*) as filecnt from tbl_message_file group by fk_mno)
on mno = fk_mno
where rno between #{startRno} and #{endRno}


select mno, mgroup,reno, writer, w_name, w_dept, subject, content, sendtime, profile_orginfilename, depthno, scrapstatus
from (
    select mno, mgroup,reno, writer, name_kr as w_name, department_name as w_dept, subject, content, to_char(sendtime, 'yyyy. mm. dd AM hh:mi') as sendtime, profile_orginfilename, depthno
    from tbl_message join v_employee on employee_no = writer
    where mno = 'm-67'
)
join tbl_message_send
on mno = fk_mno
where receiver = 100006

select * from tbl_message_file



select mfno, fk_mno, m_systemfilename, m_originfilename, file_size
from tbl_message_file

select * from tbl_message
order by sendtime desc

select * from tbl_employee


select * from tbl_employee
where fk_team_no = 1


update tbl_employee set position = '부장'
where position = '경력'



update tbl_employee set position = '부장' 
where fk_team_no = 1


update tbl_employee set position = '부장'
where fk_team_no = 41 and position = '과장'


update tbl_employee set position = '사원'
where name_kr like '%2'



update tbl_employee set position = '대리'
where name_kr like '%2'

commit;



update tbl_employee set manager_no = (select employee_no from tbl_employee where fk_team_no = 3 and position = '대리')
where fk_team_no = 3 and position = '사원'


create or replace procedure pcd_update_manager_no
(p_mp IN varchar2
,p_ep IN varchar2
)
is
begin
for i in 1..45 loop
update tbl_employee set manager_no = (select employee_no from tbl_employee where fk_department_no = 10 and position = p_mp)
where fk_department_no = 10 and position = p_ep
end loop;
end pcd_update_manager_no;


exec pcd_update_manager_no('부장','과장');

select * from tbl_employee


select employee_no, name_kr, manager_no, position from tbl_employee
where fk_team_no = 1


select employee_no from tbl_employee where fk_team_no = 1 and position = '대리'



update tbl_employee set manager_no = (select employee_no from tbl_employee where fk_team_no = i and position = p_mp)
where fk_team_no = i and position = p_ep;


update tbl_employee set manager_no = (select employee_no from tbl_employee where fk_department_no = 10 and position = '부장')
where fk_department_no = 90 and position = '대리'


select * from tbl_employee

desc tbl_employee

update tbl_employee set jointype = '경력'
where name_kr like '%3'


-- 사장 넣기

insert into tbl_employee
values(1, null, null, '서영학', 'Younghak seo','9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382', '사장', null, sysdate-365, 10000,null, '010-2341-1231', '21105', null, null, null, 'younghak121@naver.com', 1, null, null, '대졸', '경영학과', null, null, null, 1, 'CEO' , '대표', 1, 0 )


-- 관리자 넣기
insert into tbl_employee
values(99, null, null, '관리자', 'Admin','9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382', '관리자계정', null, sysdate, null,null, null, null, null, null, null, 'younghak121@naver.com', 1, null, null, null, null, null, null, null, 99, null , null, 99, 0, null)

desc tbl_employee

update tbl_employee set jointype = '경력'
where position in ('과장','부장','사장','대리')

commit;



----------------------------------------------------------------------------------
-- 보낸 메시지함 


select rno, writer, mno, mgroup, reno, subject, status, sendtime, depthno, writer_scrapstatus, receiver_name, filecnt
from 
(
    select row_number() over(order by sendtime desc) as rno, writer, mno, mgroup, reno, subject, M.status, sendtime, depthno, writer_scrapstatus, receiver_name, filecnt
    from
    (
        select writer, mno, mgroup, reno, subject, M.status, sendtime, depthno, writer_scrapstatus, 
        --name_kr as receiver_name, 
        LISTAGG(name_kr,',') WITHIN GROUP (ORDER BY name_kr) AS receiver_name
        from tbl_message M
        left join tbl_message_send MS
        on mno = fk_mno
        left join v_employee
        on receiver = employee_no
        group by (writer, mno, mgroup, reno, subject, M.status, sendtime, depthno, writer_scrapstatus)
    ) M
    left join v_employee E
    on E.employee_no = writer
    left join ( select fk_mno, count(*) as filecnt from tbl_message_file group by fk_mno ) F
    on F.fk_mno = mno
    where writer = 100006 and M.status = 1
    --and receiver_name like '%'||'강'||'%'
    --and writer_scrapstatus = 1
)
where rno between 1 and 10


select * from tbl_message

select * from tbl_message_send

select * from tbl_message_file

( select fk_mno, count(*) as filecnt from tbl_message_file group by fk_mno )



-- 총 개수
select ceil(count(*)/10)
from 
(
    select row_number() over(order by sendtime desc) as rno, writer, mno, mgroup, reno, subject, M.status, sendtime, depthno, writer_scrapstatus, receiver_name
    from
    (
        select writer, mno, mgroup, reno, subject, M.status, sendtime, depthno, writer_scrapstatus, 
        --name_kr as receiver_name, 
        LISTAGG(name_kr,',') WITHIN GROUP (ORDER BY name_kr) AS receiver_name
        from tbl_message M
        left join tbl_message_send MS
        on mno = fk_mno
        left join v_employee
        on receiver = employee_no
        group by (writer, mno, mgroup, reno, subject, M.status, sendtime, depthno, writer_scrapstatus)
    ) M
    left join v_employee E
    on E.employee_no = writer
    where writer = 100006 and M.status = 1
    --and receiver_name like '%'||'강'||'%'
    --and writer_scrapstatus = 1
)




-- 보낸  메시지 개수 알아오기
select count(*) from tbl_message_send
where receiver = #{receiver} and delete_status = 1


alter table tbl_message rename column status to delete_status


alter table tbl_message_send rename column scrapstatus to scrap_status


select * from tbl_message
select rno, mno, writer, w_name, w_deptname, receiver, name_kr as r_name, department_name as r_deptname, mgroup, reno, subject, content, to_char(sendtime,'yy. mm. dd AM hh24:mi') as sendtime, to_char(ms_checktime,'yy. mm. dd') as ms_checktime, TMM.delete_status, depthno, filecnt, scrap_status, delete_status
from
(
    select row_number() over(order by sendtime desc) as rno, mno, writer, name_kr as w_name, department_name as w_deptname, receiver, mgroup, reno, subject, content, sendtime, ms_checktime, TM.delete_status, depthno,  scrap_status, delete_status
    from
    (
        select mno, writer, receiver, mgroup, reno, subject, content, M.delete_status, sendtime, ms_checktime, depthno, MS.scrap_status, MS.delete_status
        from tbl_message M
        join tbl_message_send MS
        on M.mno = MS.fk_mno
        where receiver = 100006 and MS.delete_status = 1 and sendtime <= sysdate
        <if test="tab == 'unread'">
            and ms_checktime is null
        </if>
        <if test="tab == 'scrap'">
            and MS.scrap_status = 1
        </if>
        <if test="searchCondition != 'writer' and searchVal != ''">
            and lower(${searchCondition}) like '%'||lower(#{searchVal})||'%'
        </if>
    ) TM
    left join v_employee E
    on E.employee_no = writer
    <if test="searchCondition == 'writer' and serachVal != ''">
        where lower(name_kr) like '%'||lower(#{searchVal})||'%'
    </if>
    order by sendtime desc
) TMM
left join v_employee
on employee_no = receiver
left join
(select distinct fk_mno, count(*) as filecnt from tbl_message_file group by fk_mno)
on mno = fk_mno
where rno between #{startRno} and #{endRno}


select * from tbl_employee

desc tbl_employee


select * from tbl_message_send

select fk_mno, receiver from tbl_message_send
where delete_status = 1 and receiver = 100006
group by (fk_mno, receiver)


select * from tbl_message_send




 select n_mno, N.writer as n_writer, N.subject as n_subject, N.sendtime as n_sendtime, M.mno, M.writer, M.sendtime, M.subject, M.b_mno
from
(
select LAG(mno) OVER (ORDER BY to_number(substr(mno,3))) as n_mno, 
      mno, subject, name_kr||'·'||department_name as writer, sendtime,
      LEAD(mno) OVER (ORDER BY to_number(substr(mno,3))) as b_mno
from tbl_message
join v_employee on writer = employee_no
where mgroup = (select mgroup from tbl_message where mno = 'm-12')




select * from tbl_message
where writer = 100006


select * from tbl_message_send
where fk_mno = 'm-93' and receiver = 100006

select nvl(fk_department_no, 0)
from v_employee

select * from v_employee

select nvl(fk_department_no,) as fk_department_no, nvl(department_name,'없음') as department_name, nvl(fk_team_no,'없음') as fk_team_no, nvl(team_name,'없음') as team_name, employee_no, name_kr, role, position, profile_systemfilename
		from v_employee
		where status = 1

    select employee_no, fk_department_no, department_name, fk_team_no, team_name, name_kr, name_en, passwd, jointype, hire_date, salary, commission_pct, mobile, postcode, address, detail_address, extra_address, email, gender, profile_systemfilename, profile_orginfilename, academic_ability, major, militaryservice, bank, accountnumber, status, role, position, authority
    from v_employee
    where employee_no = 600139


select * from tbl_authority


권한 => 인사팀한테는 급여, 로그, 구성원 정보 볼수 있게 해야될거같고..

인사이트 => 대리부터 다 볼수있게 해보자..


select * from tbl_departments

update tbl_employee set authority = 2
where position in ('대리','과장','부장')

update tbl_employee set authority = 24
where fk_department_no = 40
and position in ('과장','대리','부장')



update tbl_employee set authority = 120
where fk_department_no = 40 and position in ('과장','대리','부장')


select * from tbl_employee
where fk_department_no = 40

select * from tbl_employee
where employee_no =600139

alter table tbl_employee add birthday date;


update tbl_employee set birthday = to_date('1970/01/21')
where name_kr like '%서영학%'

select * from tbl_employee

select * from tbl_authority


insert into tbl_authority
values(6, '근태')

update tbl_authority set atno = 7
where atno = 6

commit;



select * from tbl_team

update tbl_team set team_name = '전산1팀'
where team_no = 38

update tbl_team set team_name = '전산2팀'
where team_no = 39


-- 부서/팀마다 권한주기
인사부서 => 인사이트, 구성원, 근태 : 42 : 부서 40
재무부서 => 인사이트, 급여 : 8 : 부서 70
IT부서 전산팀 => 로그 : 5 : 팀 38, 39

update tbl_employee set authority = 5
where fk_team_no in (38, 39)

commit;


update tbl_employee set authority = 99
where employee_no = 99 or employee_no = 1



select * from tbl_attendance

--근무시간 넣어주기
insert into tbl_attendance
values(seq_attendance_no.nextval, 100006, '근무', to_date('2022/12/08 09:00', 'yyyy-mm-dd hh24:mi'), to_date('2022/12/08 17:30', 'yyyy-mm-dd hh24:mi'))

commit;

desc tbl_attendance




select * from tbl_attendance



-- 오늘 근무시간 구하기
select (endtime - starttime)*24*60 as working_min
from tbl_attendance 
where fk_employee_no = 100006 and to_char(starttime,'yyyy-mm-dd') = to_char(sysdate,'yyyy-mm-dd')



select nvl((endtime - starttime)*24*60,0)
from tbl_attendance 
where fk_employee_no = 100006 and to_char(starttime,'yyyy-mm-dd') = to_char(sysdate,'yyyy-mm-dd')



select * from user_constraints
where table_name = 'TBL_EMPLOYEE'

alter table tbl_employee drop constraint UQ_TBL_EMPLOYEE_EMAIL;

update tbl_employee set mobile = 'tBHQxXVKc8qdSHiZy7TbVA=='

commit;

select * from tbl_employee


alter table tbl_employee modify mobile varchar2(30)

alter table tbl_employee modify 


update tbl_employee set jointype = '대표'
where jointype = '사장'

select * from tbl_employee
where employee_no = 1

commit;

select * from tbl_employee
where fk_team_no = 1



select * from tbl_employee


select * from tbl_employee


select position
from tbl_employee
where position is not null
group by position


select jointype
from tbl_employee
group by jointype



select employee_no, fk_department_no, department_name, fk_team_no, team_name, name_kr, jointype, mobile, status, role, position, authority
from
(
    select row_number() over(order by employee_no desc) as rno, employee_no, fk_department_no, department_name, fk_team_no, team_name, name_kr, jointype, mobile, status, role, position, authority
    from v_employee
    where position = '사원'
    and name_kr like '%'||'진'||'%'
)
where rno between 1 and 10




alter table tbl_employee rename column jointype to employeementtype


alter table tbl_employee add jointype varchar2(10)



update tbl_employee set jointype = '신입'

commit;


select * from tbl_employee


update tbl_employee set jointype='경력'
where position in ('대표','부장','과장','대리')


commit;


select * from tbl_employee
where fk_team_no = 1


update tbl_employee set jointype = '경력'
where name_kr like '%3'

commit;



select ceil(count(*)/20)
from
(
    select row_number() over(order by employee_no desc) as rno, employee_no, fk_department_no, department_name, fk_team_no, team_name, name_kr, jointype, mobile, status, role, position, authority
    from v_employee
    where 1 = 1
    --and ${dropCondition} = #{dropVal}
    --and lower(${serachCondition}) like '%'||lower(#{searchVal})||'%'
)



select * from user_sequences


select * from tbl_departments

create sequence seq_tbl_departments
start with 19
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



select team_no, team_name
from tbl_team
where fk_department_no = 10


select * from tbl_employee



alter table tbl_employee rename column employeementtype to employmenttype


select * from v_employee


select * from tbl_authority

desc tbl_employee


select * from tab;


select * from tbl_employee


select * from tbl_departments

select * from tbl_employee

insert into tbl_employee(employee_no, fk_department_no, fk_team_no, name_kr, name_en, passwd, jointype, manager_no, hire_date, salary, commission_pct, mobile, postcode, address, detail_address, extra_address, email, gender, profile_systemfilename, profile_orginfilename, academic_ability, major, militaryservice, bank, accountnumber, status, role, position, authority, dayoff_cnt, birthday, filesize, employmenttype)
values(10||lpad(seq_tbl_employee.nextval,4,0), #{fk_department_no}, #{fk_team_no}, #{name_kr}, #{name_en}, #{passwd}, #{jointype}, null, #{hire_date}, null, null, #{mobile}, #{postcode}, #{address}, #{detail_address}, #{extra_address}, #{email}, #{gender}, null, null, #{academic_ability}, #{major}, #{militaryservice}, #{bank}, #{accountnumber}, #{status}, #{role}, #{position}, #{authority}, 0, #{birthday}, 0, #{employmenttype})



select * from tbl_team


update tbl_employee set status = '1'

commit;


select * from tbl_employee

desc tbl_employee

alter table tbl_employee drop constraint SYS_

C0030740


select * from tbl_employee

select * from tbl_employee
order by hire_date desc

select * from tbl_departments


insert into tbl_team values(seq_tbl_team.nextval, 'aaa', 90,null,default)


select * from tbl_departments

select * from tbl_team

select team_no
from tbl_team
where team_name = 'aaa'
    rollback;
    
    
    
    select * from tbl_departments
    
update tbl_departm,ents set department_no = 18
where department_no = 90


s

select * from tbl_team

select * from tbl_employee
order by hire_date desc

delete tbl_team
where team_no in (59,58,60,57)


delete tbl_employee
where fk_team_no = 60

select * from tbl_employee

commit;


select * from tbl_departments


commit;

delete tbl_departments
where department_no = 20


delete tbl_team
where fk_department_no = 20

delete tbl_employee
where fk_department_no = 20

sele


select * from tbl_employee
order by hire_date desc

update tbl_employee set militaryservice = null
where militaryservice = '해당사항없음'


update tbl_employee set fk_department_no = null
where employee_no = 170255

commit;

where 

alter table tbl_employee modify status default 1



select row_number() over(order by employee_no desc) as rno, employee_no, fk_department_no, department_name, fk_team_no, team_name, name_kr, jointype, mobile, status, role, position, authority
    from v_employee
    where 1 = 1
    and department_name is null
    