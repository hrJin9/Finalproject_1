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
select employee_no, A.fk_department_no, department_name, fk_team_no, team_name, name_kr, name_en, passwd, jointype, hire_date, salary, commission_pct, mobile, postcode, address, detail_address, extra_address, email, gender, profile_systemfilename, profile_orginfilename, academic_ability, major, militaryservice, bank, accountnumber, status, role, position, authority
from
    (
    select employee_no, fk_department_no, department_name, fk_team_no, name_kr, name_en, passwd, jointype, hire_date, salary, commission_pct, mobile, postcode, address, detail_address, extra_address, email, gender, profile_systemfilename, profile_orginfilename, academic_ability, major, militaryservice, bank, accountnumber, status, role, position, authority
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
select mno, writer, w_name, w_deptname, receiver, name_kr as r_name, department_name as r_deptname, mgroup, reno, subject, content, m_systemfilename, m_originfilename, file_size, to_char(ms_sendtime,'yy. mm. dd') as ms_sendtime, to_char(ms_checktime,'yy. mm. dd') as ms_checktime, TMM.status
from
(
    select mno, writer, name_kr as w_name, department_name as w_deptname, receiver, mgroup, reno, subject, content, m_systemfilename, m_originfilename, file_size, ms_sendtime, ms_checktime, TM.status
    from
    (
        select mno, writer, receiver, mgroup, reno, subject, content, m_systemfilename, m_originfilename, file_size, status, ms_sendtime, ms_checktime
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
join tbl_scrap S
on S.tno = mno
where receiver = '100006' and TMM.status = 1



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
select mno, reno, writer, name_kr as w_name, department_name as w_dept, subject, content, m_systemfilename, m_originfilename, file_size, profile_orginfilename
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




