show user;
-- USER이(가) "FINAL_ORAUSER1"입니다.

create table tbl_calendar_large_category 
(lgcatgono   number(3) not null      -- 캘린더 대분류 번호
,lgcatgoname varchar2(50) not null   -- 캘린더 대분류 명
,constraint PK_tbl_calendar_large_category primary key(lgcatgono)
);
-- Table TBL_CALENDAR_LARGE_CATEGORY이(가) 생성되었습니다.

insert into tbl_calendar_large_category(lgcatgono, lgcatgoname)
values(1, '나의 캘린더');


commit;
-- 커밋 완료.

select * 
from tbl_calendar_large_category
order by lgcatgono desc;

-- *** 캘린더 소분류 *** 
-- (예: 내캘린더중 점심약속, 내캘린더중 저녁약속, 내캘린더중 운동, 내캘린더중 휴가, 내캘린더중 여행, 내캘린더중 출장 등등) 
-- (예: 사내캘린더중 플젝주제선정, 사내캘린더중 플젝요구사항, 사내캘린더중 DB모델링, 사내캘린더중 플젝코딩, 사내캘린더중 PPT작성, 사내캘린더중 플젝발표 등등) 
create table tbl_calendar_small_category 
(smcatgono         number(8) not null      -- 캘린더 소분류 번호
,fk_lgcatgono      number(3) not null      -- 캘린더 대분류 번호
,smcatgoname       varchar2(400) not null  -- 캘린더 소분류 명
,fk_employee_no    number(6) not null      -- 캘린더 소분류 작성자 유저아이디(사원번호)
,constraint PK_tbl_calendar_small_category primary key(smcatgono)
,constraint FK_small_category_fk_lgcatgono foreign key(fk_lgcatgono) 
            references tbl_calendar_large_category(lgcatgono) on delete cascade
,constraint FK_small_category_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no)            
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

insert into tbl_calendar_small_category(smcatgono, fk_lgcatgono, smcatgoname,fk_employee_no)
values(seq_smcatgono.nextval, 1, '하이', '100011');


select *
from tbl_calendar_small_category
order by smcatgono desc;

create table tbl_calendar_schedule 
(calno           number                 -- 일정관리 번호(캘린더번호)
,startdate       date                   -- 시작일자
,enddate          date                   -- 종료일자
,subject          varchar2(400)          -- 제목
,content          varchar2(4000)         -- 내용
,place            varchar2(200)          -- 장소
,color            varchar2(50)           -- 반복주기
,joinuser         varchar2(4000)         -- 공유자		 
,fk_smcatgono     number(8)              -- 캘린더 소분류 번호
,fk_lgcatgono     number(10)             -- 캘린더 대분류 번호
,fk_employee_no   number(6) not null     -- 캘린더 일정 작성자 유저아이디(사원번호)
,c_authority      number(6)	             -- 권한
,constraint PK_schedule_calno primary key(calno)
,constraint FK_calendar_fk_smcatgono foreign key(fk_smcatgono) 
            references tbl_calendar_small_category(smcatgono) on delete cascade
,constraint FK_schedule_fk_lgcatgono foreign key(fk_lgcatgono) 
            references tbl_calendar_large_category(lgcatgono) on delete cascade	
,constraint FK_schedule_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no) 
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
order by calno desc; 

commit;




select count(*)
from tbl_calendar_small_category
where fk_lgcatgono = 1 and smcatgoname = #{com_smcatgoname}












--- 회의실 ---- 
create table tbl_meetingroom
(roomno            number       not null      -- 회의실 번호
,room_name         varchar2(20) not null      -- 회의실 명
,room_info         varchar2(20) not null      -- 회의실 정보
,room_status       number       not null      -- 회의실 상태 
,constraint PK_roomno_roomno primary key(roomno)
);
-- Table TBL_CONFERENCE이(가) 생성되었습니다.


--- 회의실 예약 ----   
create table tbl_meetingroom_reservation 
(reserno           number         not null      -- 회의실 예약번호
,r_date            date           not null      -- 회의실 예약일
,r_startdate       date           not null      -- 시작일자
,r_enddate         date           not null      -- 종료일자 
,r_content         varchar2(4000) not null      -- 예약내용
,r_status          number         not null      -- 예약상태
,r_application     date           not null      -- 신청일 
,fk_roomno         number         not null      -- 회의실 번호
,fk_employee_no    number(6)      not null      -- 사원번호
,constraint PK_reservation_reserno primary key(reserno) 
,constraint FK_reservation_fk_roomno foreign key(fk_roomno)   
            references tbl_meetingroom(roomno) on delete cascade	
,constraint FK_reservation_fk_employee_no foreign key(fk_employee_no) references tbl_employee(employee_no) 

); 
-- Table TBL_CONFERENCE_RESERVATION이(가) 생성되었습니다.


create sequence seq_reserno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



insert into tbl_meetingroom_reservation(reserno, r_startdate, r_enddate, r_content, fk_employee_no) 
values(seq_reserno.nextval, to_date(#{r_startdate}, 'yyyymmddhh24miss'), to_date(#{r_enddate}, 'yyyymmddhh24miss'), #{r_content}, #{fk_employee_no})
 

insert into tbl_meetingroom_reservation(reserno, r_startdate, r_enddate, r_content, fk_employee_no) 
values(seq_reserno.nextval, to_date(20221212111511, 'yyyymmddhh24miss'), to_date(20221212121511, 'yyyymmddhh24miss'), '예약헙니다', 100011)
         
        
select *
from tbl_meetingroom_reservation;

        

select smcatgono, fk_lgcatgono, smcatgoname
from tbl_calendar_small_category
where fk_lgcatgono = #{fk_lgcatgono} and fk_employee_no= #{fk_employee_no}
order by smcatgono ascselect smcatgono, fk_lgcatgono, smcatgoname
from tbl_calendar_small_category
where fk_lgcatgono = #{fk_lgcatgono} and fk_employee_no= #{fk_employee_no}
order by smcatgono asc





select calno, startdate, enddate, subject, place, joinuser, content, fk_smcatgono, fk_lgcatgono, fk_employee_no 
from tbl_calendar_schedule
where fk_employee_no = 100011 OR 
fk_lgcatgono = 2 OR
(fk_lgcatgono != 2 AND lower(joinuser) like '%'|| lower(100011) ||'%') 
order by calno asc


select smcatgono, fk_lgcatgono, smcatgoname
from tbl_calendar_small_category
where fk_lgcatgono = 1 and fk_employee_no= 100011
order by smcatgono asc