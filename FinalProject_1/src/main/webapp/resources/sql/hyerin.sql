show user;

drop table tbl_message purge;
drop table tbl_message_send purge;
drop table tbl_scrap purge;
drop table tbl_authority purge;


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

alter table tbl_message rename column fk_employee_no to writer;


-- seq_tbl_message 시퀀스 생성
create sequence seq_tbl_message
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


-- 메시지 select

select * from tbl_employee

-- 한 사람의 메시지목록을 보여주는 select
select writer, w_name, w_deptname, receiver, name_kr as r_name, department_name as r_deptname, mgroup, reno, subject, content, m_systemfilename, m_originfilename, file_size, to_char(ms_sendtime,'yy. mm. dd') as ms_sendtime, to_char(ms_checktime,'yy. mm. dd') as ms_checktime
from
(
    select writer, name_kr as w_name, department_name as w_deptname, receiver, mgroup, reno, subject, content, m_systemfilename, m_originfilename, file_size, ms_sendtime, ms_checktime
    from
    (
        select writer, receiver, mgroup, reno, subject, content, m_systemfilename, m_originfilename, file_size, status, ms_sendtime, ms_checktime
        from tbl_message M
        join tbl_message_send MS
        on M.mno = MS.fk_mno
        where receiver = '106' and status = 1 and ms_checktime = null
    )
    left join v_employee E
    on E.employee_no = writer
    order by ms_sendtime desc
)
left join v_employee
on employee_no = receiver



--------------------------------------------------------------------------------
-- 사원 관련 테이블 조인한 뷰

create or replace view v_employee
as
select employee_no, A.fk_department_no, department_name, fk_team_no, team_name, name_kr, name_en, passwd, jointype, hire_date, salary, commission_pct, mobile, postcode, address, detail_address, extra_address, email, gender, profile_systemfilename, profile_orginfilename, academic_ability, major, militaryservice, bank, accountnumber, status, role, position, authority, sidebarsize
from
    (
    select employee_no, fk_department_no, department_name, fk_team_no, name_kr, name_en, passwd, jointype, hire_date, salary, commission_pct, mobile, postcode, address, detail_address, extra_address, email, gender, profile_systemfilename, profile_orginfilename, academic_ability, major, militaryservice, bank, accountnumber, status, role, position, authority, sidebarsize
    from tbl_employee E
    left join tbl_departments D
    on fk_department_no = department_no
    )A
left join tbl_team
on fk_team_no = team_no
;


select to_char(sysdate, 'yy. mm. dd')
from dual;