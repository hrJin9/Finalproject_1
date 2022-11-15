------------ **** spring 기초 **** ----------

show user;
--USER이(가) "MYMVC_USER"입니다.

create table spring_test
(no         number
,name       varchar2(100)
,writeday   date default sysdate
);
--Table SPRING_TEST이(가) 생성되었습니다.

select no, name, to_char(writeday,'yyyy-mm-dd hh24:mi:ss') as writeday
from spring_test
order by writeday desc


select imgfilename
from tbl_main_image
order by imgno desc

select * from tbl_member


SELECT userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, 
birthyyyy, birthmm, birthdd, coin, point, registerday, pwdchangegap,
nvl(lastlogingap, trunc( months_between(sysdate, registerday) ) ) AS lastlogingap 
FROM 
(
    select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender 
    , substr(birthday,1,4) AS birthyyyy, substr(birthday,6,2) AS birthmm, substr(birthday,9) AS birthdd 
    , coin, point, to_char(registerday, 'yyyy-mm-dd') AS registerday 
    , trunc( months_between(sysdate, lastpwdchangedate) ) AS pwdchangegap 
    from tbl_member 
    where status = 1 and userid = 'hyerin25' and pwd = '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382'
) M
CROSS JOIN 
(
    select trunc( months_between(sysdate, max(logindate)) ) as lastlogingap
    from tbl_login_history 
    where fk_userid = 'hyerin25'
) H

update tbl_member set pwd = '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382'

commit;

SELECT userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, 
birthyyyy, birthmm, birthdd, coin, point, registerday, pwdchangegap,
nvl(lastlogingap, trunc( months_between(sysdate, registerday) ) ) AS lastlogingap 
FROM 
(
    select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender 
    , substr(birthday,1,4) AS birthyyyy, substr(birthday,6,2) AS birthmm, substr(birthday,9) AS birthdd 
    , coin, point, to_char(registerday, 'yyyy-mm-dd') AS registerday 
    , trunc( months_between(sysdate, lastpwdchangedate) ) AS pwdchangegap 
    from tbl_member 
    where status = 1 and userid = 'kangkc' and pwd = '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382'
) M
CROSS JOIN 
(
    select trunc( months_between(sysdate, max(logindate)) ) as lastlogingap
    from tbl_login_history 
    where fk_userid = 'kangkc'
) H

select * from tbl_login_history






    ------- **** spring 게시판(답변글쓰기가 없고, 파일첨부도 없는) 글쓰기 **** -------

show user;
-- USER이(가) "MYMVC_USER"입니다.    
    
    
desc tbl_member;

create table tbl_board
(seq         number                not null    -- 글번호
,fk_userid   varchar2(20)          not null    -- 사용자ID
,name        varchar2(20)          not null    -- 글쓴이 
,subject     Nvarchar2(200)        not null    -- 글제목
,content     Nvarchar2(2000)       not null    -- 글내용   -- clob (최대 4GB까지 허용) 
,pw          varchar2(20)          not null    -- 글암호
,readCount   number default 0      not null    -- 글조회수
,regDate     date default sysdate  not null    -- 글쓴시간
,status      number(1) default 1   not null    -- 글삭제여부   1:사용가능한 글,  0:삭제된글
,constraint PK_tbl_board_seq primary key(seq)
,constraint FK_tbl_board_fk_userid foreign key(fk_userid) references tbl_member(userid)
,constraint CK_tbl_board_status check( status in(0,1) )
);

create sequence boardSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from tbl_board
order by seq desc;

select seq, fk_userid, name, subject,readCount, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regdate
from tbl_board
where status = 1
order by seq desc


select * from tbl_member




select lag(seq, 1) over(order by seq desc) as previousseq
      ,lag(subject, 1) over(order by seq desc) as previoussubject
      ,seq, fk_userid, name, subject, content, readcount
      ,to_char(regdate,'yyyy-mm-dd hh24:mi:ss') as regdate
      ,pw
      ,lead(seq, 1) over(order by seq desc) as nextseq
      ,lead(subject, 1) over(order by seq desc) as nextsubject
from tbl_board
where status = 1;



select previousseq, previoussubject, seq, fk_userid, name, subject, content, readcount, regdate, pw, nextseq, nextsubject
from 
(
    select lag(seq, 1) over(order by seq desc) as previousseq
          ,lag(subject, 1) over(order by seq desc) as previoussubject
          ,seq, fk_userid, name, subject, content, readcount
          ,to_char(regdate,'yyyy-mm-dd hh24:mi:ss') as regdate
          ,pw
          ,lead(seq, 1) over(order by seq desc) as nextseq
          ,lead(subject, 1) over(order by seq desc) as nextsubject
    from tbl_board
    where status = 1
)V
where seq = 1



update tbl_board set subject='글제목 변경', content = '글내용 변경'
where seq = '2' and pw = '1234';




--------------------------------------------------------------------------------

----- ***  댓글 게시판 *** -----
/* 
  댓글쓰기(tbl_comment 테이블)를 성공하면 원게시물(tbl_board 테이블)에
  댓글의 갯수(1씩 증가)를 알려주는 컬럼 commentCount 을 추가하겠다. 
*/

drop table tbl_board purge;

create table tbl_board
(seq         number                not null    -- 글번호
,fk_userid   varchar2(20)          not null    -- 사용자ID
,name        varchar2(20)          not null    -- 글쓴이 
,subject     Nvarchar2(200)        not null    -- 글제목
,content     Nvarchar2(2000)       not null    -- 글내용   -- clob (최대 4GB까지 허용) 
,pw          varchar2(20)          not null    -- 글암호
,readCount   number default 0      not null    -- 글조회수
,regDate     date default sysdate  not null    -- 글쓴시간
,status      number(1) default 1   not null    -- 글삭제여부   1:사용가능한 글,  0:삭제된글
,commentCount number default 0     not null    -- 댓글 개수
,constraint PK_tbl_board_seq primary key(seq)
,constraint FK_tbl_board_fk_userid foreign key(fk_userid) references tbl_member(userid)
,constraint CK_tbl_board_status check( status in(0,1) )
);

drop sequence boardSeq;


create sequence boardSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



----- **** 댓글 테이블 생성 **** -----
create table tbl_comment
(seq           number               not null   -- 댓글번호
,fk_userid     varchar2(20)         not null   -- 사용자ID
,name          varchar2(20)         not null   -- 성명
,content       varchar2(1000)       not null   -- 댓글내용
,regDate       date default sysdate not null   -- 작성일자
,parentSeq     number               not null   -- 원게시물 글번호
,status        number(1) default 1  not null   -- 글삭제여부
                                               -- 1 : 사용가능한 글,  0 : 삭제된 글
                                               -- 댓글은 원글이 삭제되면 자동적으로 삭제되어야 한다.
,constraint PK_tbl_comment_seq primary key(seq)
,constraint FK_tbl_comment_userid foreign key(fk_userid) references tbl_member(userid)
,constraint FK_tbl_comment_parentSeq foreign key(parentSeq) references tbl_board(seq) on delete cascade
,constraint CK_tbl_comment_status check( status in(1,0) ) 
);


create sequence commentSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


select *
from tbl_comment
order by seq desc;


select *
from tbl_board
order by seq desc;



-- ==== Transaction 처리를 위한 시나리오 만들기 ==== --
---- 회원들이 게시판에 글쓰기를 하면 글작성 1건당 POINT 를 100점을 준다.
---- 회원들이 게시판에서 댓글쓰기를 하면 댓글작성 1건당 POINT 를 50점을 준다.
---- 그런데 데이터베이스 오류 발생시 스프링에서 롤백해주는 Transaction 처리를 알아보려고 일부러 POINT 는 300을 초과할 수 없다고 하겠다..


select * from tbl_member

update tbl_member set point=0

commit;

-- tbl_member 테이블에 point 컬럼에 check 제약을 추가
alter table tbl_member
add constraint CK_tbl_member_point check(point between 0 and 300);

update tbl_member set point = point + 100
where userid = 'hyerin25'

rollback;

select userid, name, point
from tbl_member
where userid = 'hyerin25';


commit;




select * from tbl_comment
order by seq desc;

select seq, subject, commentcount
from tbl_board
order by seq desc

select userid, name, point
from tbl_member
where userid = 'hyerin25'


select name, content, to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') as regDate
from tbl_comment
where status = 1 and parentseq = 4
order by seq desc




select seq, fk_userid, name, subject, readCount, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regdate, commentCount
from tbl_board
where status = 1
order by seq desc






--- *** transaction 처리를 위해서 만들었던 포인트체크제약 없앰

alter table tbl_member
drop constraint CK_tbl_member_point;
--Table TBL_MEMBER이(가) 변경되었습니다.


select subject
from tbl_board
where lower(subject) like '%'||lower('JavA')||'%'
order by seq desc



select distinct name
from tbl_board
where lower(name) like '%'||lower('정')||'%'
order by name asc


select *
from tbl_board
order by seq desc


insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'hyerin25', '진혜린', 'java 안녕1', '자바에 대해 알아봅니다 1', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'hyerin25', '진혜린', 'java 안녕2', '자바에 대해 알아봅니다 2', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'hyerin25', '진혜린', 'java 안녕3', '자바에 대해 알아봅니다 3', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'hyerin25', '진혜린', 'java 안녕4', '자바에 대해 알아봅니다 4', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'hyerin25', '진혜린', 'java 안녕5', '자바에 대해 알아봅니다 5', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'hyerin25', '진혜린', 'java 안녕6', '자바에 대해 알아봅니다 6', '1234', default, default, default);
insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'hyerin25', '진혜린', 'java 안녕7', '자바에 대해 알아봅니다 7', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'hyerin25', '진혜린', 'java 안녕8', '자바에 대해 알아봅니다 8', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'hyerin25', '진혜린', 'java 안녕9', '자바에 대해 알아봅니다 9', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'hyerin25', '진혜린', 'java 안녕10', '자바에 대해 알아봅니다 10', '1234', default, default, default);


commit;


-- 1페이지
select seq, fk_userid, name, subject, readcount, regdate, commentcount
from
(
    select row_number() over(order by seq desc) as rno,
           seq, fk_userid, name, subject, readCount, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regdate, commentCount
    from tbl_board
    where status = 1
) V
where rno between 1 and 10

-- 2페이지
select seq, fk_userid, name, subject, readcount, regdate, commentcount
from
(
    select row_number() over(order by seq desc) as rno,
           seq, fk_userid, name, subject, readCount, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regdate, commentCount
    from tbl_board
    where status = 1
) V
where rno between 11 and 20


-- 3페이지
select seq, fk_userid, name, subject, readcount, regdate, commentcount
from
(
    select row_number() over(order by seq desc) as rno,
           seq, fk_userid, name, subject, readCount, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regdate, commentCount
    from tbl_board
    where status = 1
) V
where rno between 21 and 30



-- 검색어가 있는 1페이지
select seq, fk_userid, name, subject, readcount, regdate, commentcount
from
(
    select row_number() over(order by seq desc) as rno,
           seq, fk_userid, name, subject, readCount, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regdate, commentCount
    from tbl_board
    where status = 1
    and lower(subject) like '%'||lower('jaVa')||'%'
) V
where rno between 1 and 10




select *
from tbl_board
where subject like '%'||'java'||'%'
order by seq desc

update tbl_board set status = 0
where seq = 15;

commit;

-- 페이징처리한 댓글내용
select name, content, regdate
from
(
    select row_number() over(order by seq desc) as rno, name, content, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regdate
    from tbl_comment
    where status = 1 and parentSeq = 26
)
where rno between 1 and 5;



select ceil(count(*)/5)
from tbl_comment
where status = 1 and parentSeq = 26


select previousseq, previoussubject, seq, fk_userid, name, subject, content, readcount, regdate, pw, nextseq, nextsubject
from 
(
    select lag(seq, 1) over(order by seq desc) as previousseq
          ,lag(subject, 1) over(order by seq desc) as previoussubject
          ,seq, fk_userid, name, subject, content, readcount
          ,to_char(regdate,'yyyy-mm-dd hh24:mi:ss') as regdate
          ,pw
          ,lead(seq, 1) over(order by seq desc) as nextseq
          ,lead(subject, 1) over(order by seq desc) as nextsubject
    from tbl_board
    where status = 1
    and lower(subject) like '%'||lower('jaVa')||'%'
)V
where seq = 13





------------------------------------------------------------------------------
            --- *** 댓글 및 답변글 및 파일첨부가 있는 게시판 *** ---
-- ** 답변 글쓰기는 일반회원은 불가하고 직원(관리파트)들만 답변글쓰기가 가능하도록 한다. ** --

alter table tbl_member
add gradelevel number default 1;
--Table TBL_MEMBER이(가) 변경되었습니다.

-- ** 직원(관리파트)들에게는 gradelevel 컬럼의 값을 10으로 부여.
-- gradelevel 컬럼의 값이 10인 직원들만 답변 글쓰기 가능
update tbl_member set gradelevel = 10
where userid in('admin','hyerin25');

commit;

select *
from tbl_member
roder by gradelevel desc




drop table tbl_comment purge;
drop sequence commentSeq;
drop table tbl_board purge;
drop sequence boardSeq;


create table tbl_board
(seq           number                not null    -- 글번호
,fk_userid     varchar2(20)          not null    -- 사용자ID
,name          varchar2(20)          not null    -- 글쓴이 
,subject       Nvarchar2(200)        not null    -- 글제목
--,content     Nvarchar2(2000)       not null    -- 글내용
,content       clob                  not null    -- 글내용   CLOB(4GB 까지 저장 가능한 데이터 타입) 타입
,pw            varchar2(20)          not null    -- 글암호
,readCount     number default 0      not null    -- 글조회수
,regDate       date default sysdate  not null    -- 글쓴시간
,status        number(1) default 1   not null    -- 글삭제여부   1:사용가능한 글,  0:삭제된글
,commentCount  number default 0      not null    -- 댓글의 개수 

,groupno       number                not null    -- 답변글쓰기에 있어서 그룹번호 
                                                 -- 원글(부모글)과 답변글은 동일한 groupno 를 가진다.
                                                 -- 답변글이 아닌 원글(부모글)인 경우 groupno 의 값은 groupno 컬럼의 최대값(max)+1 로 한다.

,fk_seq         number default 0      not null   -- fk_seq 컬럼은 절대로 foreign key가 아니다.!!!!!!
                                                 -- fk_seq 컬럼은 자신의 글(답변글)에 있어서 
                                                 -- 원글(부모글)이 누구인지에 대한 정보값이다.
                                                 -- 답변글쓰기에 있어서 답변글이라면 fk_seq 컬럼의 값은 
                                                 -- 원글(부모글)의 seq 컬럼의 값을 가지게 되며,
                                                 -- 답변글이 아닌 원글일 경우 0 을 가지도록 한다.

,depthno        number default 0       not null  -- 답변글쓰기에 있어서 답변글 이라면
                                                 -- 원글(부모글)의 depthno + 1 을 가지게 되며,
                                                 -- 답변글이 아닌 원글일 경우 0 을 가지도록 한다.

,fileName       varchar2(255)                    -- WAS(톰캣)에 저장될 파일명(2022103109271535243254235235234.png)                                       
,orgFilename    varchar2(255)                    -- 진짜 파일명(강아지.png)  // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
,fileSize       number                           -- 파일크기  

,constraint PK_tbl_board_seq primary key(seq)
,constraint FK_tbl_board_fk_userid foreign key(fk_userid) references tbl_member(userid)
,constraint CK_tbl_board_status check( status in(0,1) )
);

create sequence boardSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


create table tbl_comment
(seq           number               not null   -- 댓글번호
,fk_userid     varchar2(20)         not null   -- 사용자ID
,name          varchar2(20)         not null   -- 성명
,content       varchar2(1000)       not null   -- 댓글내용
,regDate       date default sysdate not null   -- 작성일자
,parentSeq     number               not null   -- 원게시물 글번호
,status        number(1) default 1  not null   -- 글삭제여부
                                               -- 1 : 사용가능한 글,  0 : 삭제된 글
                                               -- 댓글은 원글이 삭제되면 자동적으로 삭제되어야 한다.
,constraint PK_tbl_comment_seq primary key(seq)
,constraint FK_tbl_comment_userid foreign key(fk_userid) references tbl_member(userid)
,constraint FK_tbl_comment_parentSeq foreign key(parentSeq) references tbl_board(seq) on delete cascade
,constraint CK_tbl_comment_status check( status in(1,0) ) 
);

create sequence commentSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


desc tbl_board;



begin
    for i in 1..100 loop
        insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status, groupno)
        values(boardSeq.nextval, 'leess', '이순신', '이순신 입니다'||i, '안녕하세요? 이순신'|| i ||' 입니다.', '1234', default, default, default, i);
    end loop;
end;
--PL/SQL 프로시저가 성공적으로 완료되었습니다.


begin
    for i in 101..200 loop
        insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status, groupno)
        values(boardSeq.nextval, 'eomjh', '엄정화', '엄정화 입니다'||i, '안녕하세요? 엄정화'|| i ||' 입니다.', '1234', default, default, default, i);
    end loop;
end;
--PL/SQL 프로시저가 성공적으로 완료되었습니다.


commit;


select *
from tbl_board
order by seq desc;


----------------------------------------------------------------------------
                -- ** 게시판에서 글 1개 조회하기 ** --

select previousseq, previoussubject, seq, fk_userid, name, subject, content, readcount, regdate, pw, nextseq, nextsubject, groupno, fk_seq, depthno
from 
(
    select lag(seq, 1) over(order by seq desc) as previousseq
          ,lag(subject, 1) over(order by seq desc) as previoussubject
          ,seq, fk_userid, name, subject, content, readcount
          ,to_char(regdate,'yyyy-mm-dd hh24:mi:ss') as regdate
          ,pw
          ,lead(seq, 1) over(order by seq desc) as nextseq
          ,lead(subject, 1) over(order by seq desc) as nextsubject
          ,groupno, fk_seq, depthno
    from tbl_board
    where status = 1
    and lower(subject) like '%'||lower('9')||'%'
)V
where seq = 189


-- *** 답변글쓰기가 있는 게시판 목록 페이징 *** ---

select seq, fk_userid, name, subject, readcount, regdate, commentcount, groupno, fk_seq, depthno
from
(
    select rownum as rno, seq, fk_userid, name, subject, readcount, regdate, commentcount, groupno, fk_seq, depthno
    from
    (
        select seq, fk_userid, name, subject, readCount, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regdate, commentCount,
               groupno, fk_seq, depthno
        from tbl_board
        where status = 1
        --and lower(subject) like '%'||lower('엄')||'%'
        start with fk_seq = 0
        connect by prior seq = fk_seq
        order siblings by groupno desc, seq asc
    ) V
) T
where rno between 1 and 10


--order by 로 정렬할 경우 select 되어진 모든 데이터를 가지고 정렬을 하는 것이고,
--order siblings by 각 계층별로 정렬을 하는 것이다. 
--order by 로만 정렬을 하게 되면 계층구조가 깨질수 있기 때문에 계층구조는 그대로 유지하면서 동일 부모를 가진 자식행들 끼리의 정렬 기준을 주는 것이 order siblings by 이다.


select * from tbl_board
order by seq desc

delete from tbl_board
where seq in (208, 207, 206, 205)

commit;


-- 댓글쓰기에 파일첨부를 위해서 아래와 같이 tbl_comment 테이블에 컬럼을 추가하겠다.
alter table tbl_comment
add fileName varchar2(255);

alter table tbl_comment
add orgFilename varchar2(255);

alter table tbl_comment
add fileSize varchar2(255);


select * from tbl_comment

delete from tbl_comment 
where seq = 3

commit;
select seq, name, content, to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') AS regDate
     , nvl(fileName,' ') AS fileName
     , nvl(orgFilename, ' ') AS orgFilename
     , nvl(to_char(fileSize), ' ') AS fileSize 
from tbl_comment
where parentSeq = 217
order by seq desc

update tbl_board set commentcount = 2
where seq = 217


commit;

select * from tbl_comment

select fileName, orgFilename
from tbl_comment
where seq = 3

---------------------------------------------------------------------------
show user;
-- USER이(가) "HR"입니다.

select distinct nvl(department_id, -9999) as department_id
from employees
order by department_id

select * from employees

select E.department_id, D.department_name, E.employee_id, E.first_name || ' ' || E.last_name as fullname,
       to_char(E.hire_date, 'yyyy-mm-dd') as hire_date,
       nvl(E.salary + E.salary*E.commission_pct, E.salary) as monthsal,
       func_gender(E.jubun) as gender,
       func_age(E.jubun) as age
from employees E left join departments D
on E.department_id = D.department_id
where 1=1
and nvl(E.department_id, -999) in (10,20,50)
and func_gender(E.jubun) = '남'
order by E.department_id, E.employee_id



select nvl(D.department_name, '부서없음')
      ,count(*) as cnt
      ,round(count(*)/(select count(*) from employees)*100, 2) as percentage
from employees E left join departments D
on E.department_id = D.department_id
group by D.department_name
order by cnt desc, department_name asc


select func_gender(jubun) as gender
        , count(*) as cnt
        ,round(count(*)/(select count(*) from employees)*100, 2) as percentage
from employees
group by func_gender(jubun) 
order by cnt desc



-- *** 2001년 ~ 2008년 성별 연도별 입사인원수 ** --
select func_gender(jubun) as gender,
       sum( decode( extract(year from hire_date), 2001, 1, 0 ) ) as y2001,
       sum( decode( extract(year from hire_date), 2002, 1, 0 ) ) as y2002, 
       sum( decode( extract(year from hire_date), 2003, 1, 0 ) ) as y2003, 
       sum( decode( extract(year from hire_date), 2004, 1, 0 ) ) as y2004, 
       sum( decode( extract(year from hire_date), 2005, 1, 0 ) ) as y2005, 
       sum( decode( extract(year from hire_date), 2006, 1, 0 ) ) as y2006, 
       sum( decode( extract(year from hire_date), 2007, 1, 0 ) ) as y2007,
       sum( decode( extract(year from hire_date), 2008, 1, 0 ) ) as y2008  
from employees
group by func_gender(jubun)
order by gender







------------ ==== Spring Scheduler(스프링 스케줄러)를 사용한 email 발송 ==== ------------
show user;

create table tbl_reservation
(reservationSeq     number          not null
,fk_userid          varchar2(40)    not null
,reservationDate    date            not null
,mailSendCheck      number          default 0 not null -- 메일발송했으면 1, 메일발송 안했으면 0
,constraint PK_tbl_reservation_reservationSeq primary key(reservationSeq)
,constraint FK_tbl_reservation_fk_userid foreign key(fk_userid) references tbl_member(userid)
,constraint Ck_tbl_reservation_mailSendCheck check(mailSendCheck in (0,1))
);


create sequence seq_reservation
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


select userid, email
from tbl_member
where userid in('hyerin25','eomjh')


update tbl_member set email = (select email from tbl_member where userid = 'hyerin25')
where userid = 'eomjh';


update tbl_member set email= '2Fdr7UotXJJYqo/gfcP28tOF4V/be3E5TZ0NnEli3eg='
where userid = 'hyerin25'

commit;


select to_char(sysdate, 'yyyy-mm-dd') as 오늘날짜
from dual;



insert into tbl_reservation(reservationSeq, fk_userid, reservationDate)
values(seq_reservation.nextval, 'hyerin25', to_date('2022-11-05 13:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_reservation(reservationSeq, fk_userid, reservationDate)
values(seq_reservation.nextval, 'eomjh', to_date('2022-11-05 14:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_reservation(reservationSeq, fk_userid, reservationDate)
values(seq_reservation.nextval, 'hyerin25', to_date('2022-11-06 11:00', 'yyyy-mm-dd hh24:mi'));

insert into tbl_reservation(reservationSeq, fk_userid, reservationDate)
values(seq_reservation.nextval, 'eomjh', to_date('2022-11-06 15:00', 'yyyy-mm-dd hh24:mi'));


commit;



select reservationSeq, fk_userid,
       to_char(reservationDate, 'yyyy-mm-dd hh24:mi:ss') as reservationDate,
       mailSendCheck
from tbl_reservation
order by reservationSeq desc


-- *** 오늘로부터 2일 뒤에 예약되어진 예약정보 및 이메일주소를 조회 *** ---

select reservationSeq, fk_userid,
       to_char(reservationDate, 'yyyy-mm-dd hh24:mi:ss') as reservationDate,
       mailSendCheck
from tbl_reservation
where mailSendCheck = 0 
and to_char(reservationDate, 'yyyy-mm-dd') = to_char(sysdate+2, 'yyyy-mm-dd')


select R.reservationSeq, M.userid, M.name, M.email, R.reservationDate
from
(
    select reservationSeq, fk_userid,
           to_char(reservationDate, 'yyyy-mm-dd hh24:mi:ss') as reservationDate,
           mailSendCheck
    from tbl_reservation
    where mailSendCheck = 0 
    and to_char(reservationDate, 'yyyy-mm-dd') = to_char(sysdate+2, 'yyyy-mm-dd')
) R join tbl_member M
on R.fk_userid = M.userid

-- update tbl_reservation set mailSendCheck = 1 where reservationSeq
-- where reservationSeq in ('1','2');








------------- >>>>>>>> 일정관리(풀캘린더) 시작 <<<<<<<< -------------
-- *** 캘린더 대분류(내캘린더, 사내캘린더  분류) ***
create table tbl_calendar_large_category 
(lgcatgono   number(3) not null      -- 캘린더 대분류 번호
,lgcatgoname varchar2(50) not null   -- 캘린더 대분류 명
,constraint PK_tbl_calendar_large_category primary key(lgcatgono)
);
-- Table TBL_CALENDAR_LARGE_CATEGORY이(가) 생성되었습니다.

insert into tbl_calendar_large_category(lgcatgono, lgcatgoname)
values(1, '내캘린더');

insert into tbl_calendar_large_category(lgcatgono, lgcatgoname)
values(2, '사내캘린더');

commit;
-- 커밋 완료.

select * 
from tbl_calendar_large_category;


-- *** 캘린더 소분류 *** 
-- (예: 내캘린더중 점심약속, 내캘린더중 저녁약속, 내캘린더중 운동, 내캘린더중 휴가, 내캘린더중 여행, 내캘린더중 출장 등등) 
-- (예: 사내캘린더중 플젝주제선정, 사내캘린더중 플젝요구사항, 사내캘린더중 DB모델링, 사내캘린더중 플젝코딩, 사내캘린더중 PPT작성, 사내캘린더중 플젝발표 등등) 
create table tbl_calendar_small_category 
(smcatgono    number(8) not null      -- 캘린더 소분류 번호
,fk_lgcatgono number(3) not null      -- 캘린더 대분류 번호
,smcatgoname  varchar2(400) not null  -- 캘린더 소분류 명
,fk_userid    varchar2(40) not null   -- 캘린더 소분류 작성자 유저아이디
,constraint PK_tbl_calendar_small_category primary key(smcatgono)
,constraint FK_small_category_fk_lgcatgono foreign key(fk_lgcatgono) 
            references tbl_calendar_large_category(lgcatgono) on delete cascade
,constraint FK_small_category_fk_userid foreign key(fk_userid) references tbl_member(userid)            
);
-- Table TBL_CALENDAR_SMALL_CATEGORY이(가) 생성되었습니다.


create sequence seq_smcatgono
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_SMCATGONO이(가) 생성되었습니다.


select *
from tbl_calendar_small_category
order by smcatgono desc;


-- *** 캘린더 일정 *** 
create table tbl_calendar_schedule 
(scheduleno    number                 -- 일정관리 번호
,startdate     date                   -- 시작일자
,enddate       date                   -- 종료일자
,subject       varchar2(400)          -- 제목
,color         varchar2(50)           -- 색상
,place         varchar2(200)          -- 장소
,joinuser      varchar2(4000)         -- 공유자   
,content       varchar2(4000)         -- 내용   
,fk_smcatgono  number(8)              -- 캘린더 소분류 번호
,fk_lgcatgono  number(3)              -- 캘린더 대분류 번호
,fk_userid     varchar2(40) not null  -- 캘린더 일정 작성자 유저아이디
,constraint PK_schedule_scheduleno primary key(scheduleno)
,constraint FK_schedule_fk_smcatgono foreign key(fk_smcatgono) 
            references tbl_calendar_small_category(smcatgono) on delete cascade
,constraint FK_schedule_fk_lgcatgono foreign key(fk_lgcatgono) 
            references tbl_calendar_large_category(lgcatgono) on delete cascade   
,constraint FK_schedule_fk_userid foreign key(fk_userid) references tbl_member(userid) 
);
-- Table TBL_CALENDAR_SCHEDULE이(가) 생성되었습니다.

create sequence seq_scheduleno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_SCHEDULENO이(가) 생성되었습니다.

select *
from tbl_calendar_schedule 
order by scheduleno desc;


-- 일정 상세 보기
select SD.scheduleno
     , to_char(SD.startdate,'yyyy-mm-dd hh24:mi') as startdate
     , to_char(SD.enddate,'yyyy-mm-dd hh24:mi') as enddate  
     , SD.subject
     , SD.color
     , nvl(SD.place,'-') as place
     , nvl(SD.joinuser,'공유자가 없습니다.') as joinuser
     , nvl(SD.content,'') as content
     , SD.fk_smcatgono
     , SD.fk_lgcatgono
     , SD.fk_userid
     , M.name
     , SC.smcatgoname
from tbl_calendar_schedule SD 
JOIN tbl_member M
ON SD.fk_userid = M.userid
JOIN tbl_calendar_small_category SC
ON SD.fk_smcatgono = SC.smcatgono
where SD.scheduleno = 21;

------------- >>>>>>>> 일정관리(풀캘린더) 끝 <<<<<<<< -------------







-- *** Arround Advice 를 위해서 만든 테이블임 *** --
create table tbl_empManger_accessTime
(seqAccessTime   number
,pageUrl         varchar2(150) not null
,fk_userid       varchar2(40) not null
,clientIP        varchar2(30) not null
,accessTime      varchar2(20) default sysdate not null
,constraint PK_tbl_empManger_accessTime primary key(seqAccessTime)
,constraint FK_tbl_empManger_accessTime foreign key(fk_userid) references tbl_member(userid)
);
-- Table TBL_EMPMANGER_ACCESSTIME이(가) 생성되었습니다.

create sequence seq_seqAccessTime
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_SEQACCESSTIME이(가) 생성되었습니다.

select * 
from tbl_empManger_accessTime
order by seqAccessTime desc;