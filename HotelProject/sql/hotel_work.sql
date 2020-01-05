drop table member;
drop table room;
drop table reservation;
drop sequence seq_resv_no;
drop table booked_room;
drop sequence seq_booked_no;
drop table review;
drop table coupon_kind;
drop table coupon;

--멤버 테이블 생성
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

commit; 

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
insert into room values(61, '디럭스', 'ㅎ', 'ㅎ', 2, 'ㅎ', 'ㅎ', 300000, 123, 3, 123, 'ㅎ', 'ㅎ');
--commit;
select * from room;

SELECT * FROM ROOM order by room_no desc;
--room_no 시퀀스 생성
create sequence seq_room_no;

--seq_room_no.nextval
--SELECT * FROM( SELECT RANK() OVER(ORDER BY room_name DESC) RNUM, R.* FROM room R) V WHERE RNUM BETWEEN ? AND ?


------------------------------------------
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
--SELECT * FROM( SELECT RANK() OVER(ORDER BY  RV.BOOKED_NO ASC) RNUM, RV.* FROM (SELECT B.*, R.RESV_MEMBER, R.RESV_DATE FROM MEMBER M JOIN RESERVATION R ON M.MEMBER_ID = R.RESV_MEMBER JOIN BOOKED_ROOM B ON R.RESV_NO = B.RESV_NO) RV) V WHERE RNUM BETWEEN ? AND ?
create sequence seq_resv_no start with 1000;

insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'admin',2,0,0,default,350000,'N','2019-12-29','2019-12-30',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'qwerty',1,0,0,default,450000,'N','2019-12-25','2019-12-29',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'qwerty',2,0,0,default,550000,'N','2019-12-30','2019-12-31',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'qwerty',2,0,0,default,350000,'N','2019-12-31','2020-1-1',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'qwerty',2,0,0,default,450000,'N','2019-12-27','2019-12-28',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'qwerty',2,0,0,default,450000,'N','2019-12-01','2019-12-02',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'qwerty',2,0,0,default,450000,'N','2019-12-12','2019-12-17',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'qwerty',2,0,0,default,450000,'N','2019-12-12','2019-12-31',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'qwerty',2,0,0,default,450000,'N','2019-12-12','2020-01-17',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'qwerty',2,0,0,default,450000,'N','2019-12-12','2020-01-01',0);​

select * from reservation;
commit;

--오늘보다 이전날짜의 체크아웃날짜인 예약테이블의 행 가져오기
select m.member_id, rm.room_name,  r.resv_in, r.resv_out, resv_people, rm.room_no, rm.room_renamed_filename, rv.review_no
from member m join reservation r on m.member_id = r.resv_member
                            join booked_room b on r.resv_no = b.resv_no
                            join room rm on b.room_no = rm.room_no
                            left join review rv on r.resv_no = rv.resv_no
where r.resv_out < sysdate and m.member_id = 'qwerty';

--리뷰쓴것
select m.member_id, rm.room_name,  r.resv_in, r.resv_out, resv_people, rm.room_no, rm.room_renamed_filename, rv.review_no, rv.review_content, rv.review_starclean, rv.review_starcomm, rv.review_starcheckin, rv.review_starlocation, rv.review_starvalue
from member m join reservation r on m.member_id = r.resv_member
                            join booked_room b on r.resv_no = b.resv_no
                            join room rm on b.room_no = rm.room_no
                            left join review rv on r.resv_no = rv.resv_no
where r.resv_out < sysdate and rv.review_no is not null and m.member_id = 'qwerty';

--select m.member_id, rm.room_name,  r.resv_in, r.resv_out, resv_people, rm.room_no, rm.room_renamed_filename, rv.review_no, rv.review_content, rv.review_starclean, rv.review_starcomm, rv.review_starcheckin, rv.review_starlocation, rv.review_starvalue from member m join reservation r on m.member_id = r.resv_member join booked_room b on r.resv_no = b.resv_no join room rm on b.room_no = rm.room_no left join review rv on r.resv_no = rv.resv_no where r.resv_out < sysdate and rv.review_no is not null and m.member_id = ?

--리뷰안쓴것
select m.member_id, rm.room_name,  r.resv_in, r.resv_out, resv_people, rm.room_no, r.resv_no, rm.room_renamed_filename
from member m join reservation r on m.member_id = r.resv_member
                            join booked_room b on r.resv_no = b.resv_no
                            join room rm on b.room_no = rm.room_no
                            left join review rv on r.resv_no = rv.resv_no
where r.resv_out < sysdate and rv.review_no is null and m.member_id = 'qwerty'
order by r.resv_out;

--select m.member_id, rm.room_name,  r.resv_in, r.resv_out, resv_people, rm.room_no, r.resv_no, rm.room_renamed_filename from member m join reservation r on m.member_id = r.resv_member join booked_room b on r.resv_no = b.resv_no join room rm on b.room_no = rm.room_no left join review rv on r.resv_no = rv.resv_no where r.resv_out < sysdate and rv.review_no is null and m.member_id = ? order by r.resv_out

--리뷰쓸때 외래키 값을 가져와서 포함시켜되야할것
review_writer varchar2(20) not null,
    resv_no number not null,
    room_no number not null,


--리뷰 작성
insert into review values();

select * from reservation;



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

insert into booked_room values(seq_booked_no.nextval,61,'202001031000',2,sysdate,sysdate+1,350000);
insert into booked_room values(seq_booked_no.nextval,61,'201912301069',2,'2019-12-25','2019-12-29',450000);
insert into booked_room values(seq_booked_no.nextval,61,'201912301068',2,'2019-12-30','2019-12-31',550000);
insert into booked_room values(seq_booked_no.nextval,61,'201912301067',2,'2019-12-31','2020-1-1',350000);
insert into booked_room values(seq_booked_no.nextval,61,'201912301066',2,'2019-12-29','2019-12-30',450000);
insert into booked_room values(seq_booked_no.nextval,81,'201912301064',2,'2019-12-28','2019-12-30',450000);
insert into booked_room values(seq_booked_no.nextval,81,'201912301065',2,'2019-12-27','2019-12-30',450000);
insert into booked_room values(seq_booked_no.nextval,82,'201912301062',2,'2019-12-21','2019-12-30',450000);
select * from booked_room;

create sequence seq_booked_no;


commit;




--select trunc(to_date('2020-1-1','YYYY-MM-DD')) - trunc(notice_date) from notice;

select room_no, count(*) reservedcnt from booked_room where (booked_checkin >= '2019-12-28' and booked_checkin < '2019-12-31') or (booked_checkout > '2019-12-28' and booked_checkout <= '2019-12-31') group by room_no;
--select room_no from booked_room where (booked_checkin >= ? and booked_checkin < ? ) or (booked_checkout > ? and booked_checkout <= ? )
select r.room_no, count(*) reservedcnt 
from room r left join booked_room br on r.room_no = br.room_no
where (br.booked_checkin >= '2019-12-28' and br.booked_checkin < '2019-12-31') or (br.booked_checkout > '2019-12-28' and br.booked_checkout <= '2019-12-31') 
group by r.room_no;

select *
from room r left join (select room_no from booked_room where (booked_checkin >= '2019-12-28' and booked_checkin < '2019-12-31') or (booked_checkout > '2019-12-28' and booked_checkout <= '2019-12-31')) br on r.room_no = br.room_no

--날짜타입 수정
create table t1(c1 date);
select sys_context('USERENV','NLS_DATE_FORMAT') ndf from dual;
alter session set nls_date_format='YYYY-MM-DD';
insert into t1 values('2016-04-25');
commit;



----------- 리뷰테이블
create table review(
    review_no number not null,
    review_writer varchar2(20) not null,
    resv_no number not null,
    room_no number not null,
    review_content varchar2(3000) not null,
    review_date date default sysdate,
    review_starClean number not null,
    review_starComm number not null,
    review_starCheckIn number not null,
    review_starLocation number not null,
    review_starValue number not null,
    constraint pk_review_no primary key(review_no),
    constraint fk_review_writer foreign key(review_writer) references member(member_id) on delete cascade,
    constraint fk_rv_resv_no foreign key(resv_no) references reservation(resv_no) on delete cascade,
    constraint fk_rv_room_no foreign key(room_no) references room(room_no) on delete cascade
);

create sequence seq_review_no;
insert into review values(seq_review_no.nextval, 'qwerty', 202001031000, 61, '아오 청소좀 하세요', default, 1,1,1,1,1);
--insert into review values(seq_review_no.nextval, default, default, default, '리뷰테스트', default, 1,1,1,1,1);
select * from review;
commit;
-----
--==========================
--쿠폰 
--==========================

--쿠폰 종류 테이블 생성
create table coupon_kind(
    coupon_code number not null,
    coupon_content varchar2(50) not null,
    coupon_salePercent number not null,
    coupon_min number not null,
    constraint pk_coupon_code primary key(coupon_code)
);
--drop table coupon_kind;
--drop table coupon;
create sequence seq_coupon_kind;
--drop sequence seq_coupon_kind;
insert into coupon_kind values(seq_coupon_kind.nextval, '웰컴쿠폰', 5, 500000);


--쿠폰 테이블 생성
create table coupon(
    coupon_no varchar2(24) not null,
    coupon_code number not null,
    member_id varchar2(20) default null,
    coupon_startDate date default sysdate,
    coupon_endDate date default sysdate+365,
    coupon_used char(1) default 'F',
    constraint pk_coupon_no primary key(coupon_no),
    constraint fk_coupon_code foreign key(coupon_code) references coupon_kind(coupon_code) on delete cascade,
    constraint fk_member_id foreign key(member_id) references member(member_id) on delete cascade,
    constraint ck_coupon_used check(coupon_used in ('T','F'))
);
insert into coupon values(DBMS_RANDOM.STRING('X', 10),'1','qwerty', default, default, default);
select * from coupon_kind;
select * from coupon;

--rollback;
commit;

create or replace trigger trg_coupon
    after
    insert on member
    for each row
begin
        --회원가입한 경우, welcome 쿠폰발급
        insert into coupon values(DBMS_RANDOM.STRING('X', 10), 1, :new.member_id, default, default ,default);
        dbms_output.put_line(:new.member_id || ' 회원에게 WELCOME 쿠폰이 발급되었습니다.');

end;
/
--drop trigger trg_coupon;
--ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
