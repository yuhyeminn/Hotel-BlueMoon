--member
--회원 테이블 생성
--drop table member;
create table member(
    member_id varchar2(20) not null,
    member_password varchar2(300) not null,
    member_name varchar2(30) not null,
    member_birth varchar2(8) not null,
    member_email varchar2(50) not null,
    member_phone char(11) not null,
    member_points number default 0,
    member_enrolldate date default sysdate,
    constraint pk_member_id primary key(member_id)
);
select * from member;
--insert
--admin 비밀번호 : adminadmin++00
--기본사용자 비밀번호 : aaaaaaaa++00
insert into member values('admin','G4CJdaNMtbDDJtlWNmOKPWL3VN57PT3gGI9GHlZU43JPOYTZqefwWDsxDYUrMbyFKvNk00M2CglNUAciScMJPw==','관리자','19900204','admin@bluemoon.com','0101111234',default,default);​
insert into member values('qwerty','VWMd9qoj+9c69+lGrn2fDND2RUHg5DdJYbd+qSqxBFXuqgJnxQzivFRAC1p42wbxLOBuzKpVU50OvfTatNh0aA==','쿼티','19990101','qwerty@naver.com','01012341234',default,default);
insert into member values('abcde','VWMd9qoj+9c69+lGrn2fDND2RUHg5DdJYbd+qSqxBFXuqgJnxQzivFRAC1p42wbxLOBuzKpVU50OvfTatNh0aA==','김말숙','19800110','kms@gmail.com','0101111234',default,default);
insert into member values('korea','VWMd9qoj+9c69+lGrn2fDND2RUHg5DdJYbd+qSqxBFXuqgJnxQzivFRAC1p42wbxLOBuzKpVU50OvfTatNh0aA==','김한국','19900204','korea@korea.com','0101111234',default,default);​

--commit;

--탈퇴한 회원 테이블 생성
--quit member
--drop table member_quit
create table member_quit(
    member_id varchar2(20) not null,
    member_password varchar2(300) not null,
    member_name varchar2(30) not null,
    member_birth varchar2(8) not null,
    member_email varchar2(50) not null,
    member_phone char(15) not null,
    member_points number default 0,
    member_enrolldate date default sysdate,
    member_quitdate date default sysdate,
    constraint pk_quit_member_id primary key(member_id)
);

select * from member_quit;

--탈퇴 회원 트리거
--quit member trigger
create or replace trigger tri_member_del
    before
    delete on member
    for each row
begin
    insert into member_quit values(:old.member_id, :old.member_password, :old.member_name, :old.member_birth, :old.member_email, :old.member_phone, :old.member_points, :old.member_enrolldate, sysdate);
end;
/

--notice board
--공지사항 게시판 테이블 생성
create table notice(
    notice_no number not null,
    notice_writer varchar2(20) not null,
    notice_title varchar2(60) not null,
    notice_content varchar2(4000),
    notice_date date default sysdate,
    notice_readcount number default 0,
    notice_original_filename varchar2(100),
    notice_renamed_filename varchar2(100),
    notice_available char(1) default 'Y',
    constraint pk_notice_no primary key(notice_no),
    constraint fk_notice_writer foreign key(notice_writer)
                                references member(member_id)
                                on delete set null
);
​
select * from notice;
​
--notice_no 시퀀스 생성
create sequence seq_notice_no;

​
--조회(페이징 포함)
--SELECT * FROM(SELECT RANK() OVER(ORDER BY NOTICE_NO DESC) RNUM, N.* FROM NOTICE N WHERE NOTICE_AVAILABLE = 'Y')V WHERE RNUM BETWEEN ? AND ?
​
insert into notice values(seq_notice_no.nextval,'admin','크리스마스 이벤트 안내','크리스마스 이벤트 안내 입니다요',default,default,'gg','gg',default);
insert into notice values(seq_notice_no.nextval,'admin','홈페이지 리뉴얼 안내','홈페이지 리뉴얼 안내입니다요',default,default,null,null,default);
​
commit;
​
--drop table notice;
--drop sequence seq_notice_no;

--room테이블 생성
create table room(
    room_no number,
    room_name varchar2(300) not null,
    room_describe varchar2(300) not null,
    room_describe2 varchar2(300) not null,
    room_people number not null,
    room_bed varchar2(100) not null,
    room_view varchar2(300) not null,
    room_price number not null,
    room_bfPrice number not null,
    room_amount number not null,
    room_size number not null,
    room_original_filename varchar2(100) not null,
    room_renamed_filename varchar2(100) not null,
    constraint pk_room_no primary key(room_no),
    constraint uq_room_name unique(room_name)
);

--room_no 시퀀스 생성
create sequence seq_room_no;

insert into room values(seq_room_no.nextval,'디럭스','편안한 객실','좋은 곳',2,'더블','시티뷰',350000,35000,1,40,'room1.jpg,room2.jpg','20191229.jpg,20191228.jpg');
insert into room values(seq_room_no.nextval,'스위트','편안한 객실','좋은 곳',2,'퀸','리버뷰/시티뷰',550000,35000,1,60,'room2.jpg,room3.jpg','20191229.jpg,20191228.jpg');
insert into room values(seq_room_no.nextval,'트윈','편안한 객실','좋은 곳',2,'트윈','리버뷰',450000,35000,1,50,'room3.jpg,room4.jpg','20191229.jpg,20191228.jpg');
insert into room values(seq_room_no.nextval,'슈퍼스위트','편안한 객실','좋은 곳',2,'킹','리버뷰',1050000,35000,1,50,'room3.jpg,room4.jpg','20191229.jpg,20191228.jpg');

--commit;
--drop table room;
​
select * from room;

​
--SELECT COUNT(*) CNT FROM room;
--insert into room values(?, ?, ?, ?, ?, ?, ?, ?, ?);
--SELECT * FROM( SELECT RANK() OVER(ORDER BY room_name DESC) RNUM, R.* FROM room R) V WHERE RNUM BETWEEN ? AND ?

--reservation (예약)테이블 생성
create table reservation(
    resv_no number not null,
    resv_member varchar2(15),
    resv_people number not null,
    resv_usedpoint number,
    resv_addpoint number,
    resv_date date default sysdate,
    resv_price number not null,
    resv_iscancel char(1) default 'N',
    resv_in date not null,
    resv_out date not null,
    resv_breakfast number default 0,
constraint pk_resv_no primary key(resv_no),
constraint fk_resv_member foreign key(resv_member) references member(member_id)
);

create sequence seq_resv_no start with 1000;
--drop sequence seq_resv_no;

insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'hyemin',2,0,0,default,350000,'N','2019-12-29','2019-12-30',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'hyemin',1,0,0,default,450000,'N','2019-12-25','2019-12-29',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'hyemin',2,0,0,default,550000,'N','2019-12-30','2019-12-31',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'hyemin',2,0,0,default,350000,'N','2019-12-31','2020-1-1',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'hyemin',2,0,0,default,450000,'N','2019-12-29','2019-12-30',0);

select * from reservation;

--drop table reservation;

--booked_room 예약된 객실 테이블 생성
create table booked_room(
    booked_no number not null,
    room_no number not null,
    resv_no number not null,
    booked_people number not null,
    booked_checkin date not null,
    booked_checkout date not null,
    booked_totalprice number not null,
    constraint pk_booked_no primary key(booked_no),
    constraint fk_room_no foreign key(room_no) references room(room_no) on delete set null,
    constraint fk_resv_no foreign key(resv_no) references reservation(resv_no) on delete cascade
);
insert into booked_room values(seq_booked_no.nextval,1,'201912291000',2,sysdate,sysdate+1,350000);
insert into booked_room values(seq_booked_no.nextval,2,'201912291001',2,'2019-12-25','2019-12-29',450000);
insert into booked_room values(seq_booked_no.nextval,3,'201912291002',2,'2019-12-30','2019-12-31',550000);
insert into booked_room values(seq_booked_no.nextval,1,'201912291003',2,'2019-12-31','2020-1-1',350000);
insert into booked_room values(seq_booked_no.nextval,2,'201912291004',2,'2019-12-29','2019-12-30',450000);

select * from booked_room;

create sequence seq_booked_no;


commit;

--drop table booked_room;
--drop sequence seq_booked_no;

--select trunc(to_date('2020-1-1','YYYY-MM-DD')) - trunc(notice_date) from notice;

select room_no, count(*) reservedcnt from booked_room where (booked_checkin >= '2019-12-28' and booked_checkin < '2019-12-31') or (booked_checkout > '2019-12-28' and booked_checkout <= '2019-12-31') group by room_no;
--select room_no from booked_room where (booked_checkin >= ? and booked_checkin < ? ) or (booked_checkout > ? and booked_checkout <= ? )
select r.room_no, count(*) reservedcnt 
from room r left join booked_room br on r.room_no = br.room_no
where (br.booked_checkin >= '2019-12-28' and br.booked_checkin < '2019-12-31') or (br.booked_checkout > '2019-12-28' and br.booked_checkout <= '2019-12-31') 
group by r.room_no;

select *
from room r left join (select room_no from booked_room where (booked_checkin >= '2019-12-28' and booked_checkin < '2019-12-31') or (booked_checkout > '2019-12-28' and booked_checkout <= '2019-12-31')) br on r.room_no = br.room_no;

select r.room_no, count()
from room r left join (select room_no from booked_room where (booked_checkin >= '2019-12-28' and booked_checkin < '2019-12-31') or (booked_checkout > '2019-12-28' and booked_checkout <= '2019-12-31')) br on r.room_no = br.room_no
group by r.room_no;