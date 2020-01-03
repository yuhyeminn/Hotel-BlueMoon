
--=======================================================
--member
--회원 테이블 생성
--=======================================================
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
alter table member add unique(member_email);
alter table member modify (member_id default 3000);

--insert
--admin 비밀번호 : adminadmin++00
--기본사용자 비밀번호 : aaaaaaaa++00
insert into member values('admin','G4CJdaNMtbDDJtlWNmOKPWL3VN57PT3gGI9GHlZU43JPOYTZqefwWDsxDYUrMbyFKvNk00M2CglNUAciScMJPw==','관리자','19900204','admin@bluemoon.com','0101111234',default,default);​
insert into member values('qwerty','VWMd9qoj+9c69+lGrn2fDND2RUHg5DdJYbd+qSqxBFXuqgJnxQzivFRAC1p42wbxLOBuzKpVU50OvfTatNh0aA==','쿼티','19990101','qwerty@naver.com','01012341234',default,default);
insert into member values('abcde','VWMd9qoj+9c69+lGrn2fDND2RUHg5DdJYbd+qSqxBFXuqgJnxQzivFRAC1p42wbxLOBuzKpVU50OvfTatNh0aA==','김말숙','19800110','kms@gmail.com','0101111234',default,default);
insert into member values('korea','VWMd9qoj+9c69+lGrn2fDND2RUHg5DdJYbd+qSqxBFXuqgJnxQzivFRAC1p42wbxLOBuzKpVU50OvfTatNh0aA==','김한국','19900204','korea@korea.com','0101111234',default,default);​

--commit;
--=======================================================
--탈퇴한 회원 테이블 생성
--=======================================================
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
--=======================================================
--탈퇴 회원 트리거
--=======================================================
--quit member trigger
create or replace trigger tri_member_del
    before
    delete on member
    for each row
begin
    insert into member_quit values(:old.member_id, :old.member_password, :old.member_name, :old.member_birth, :old.member_email, :old.member_phone, :old.member_points, :old.member_enrolldate, sysdate);
end;
/
--=======================================================
--notice board
--공지사항 게시판 테이블 생성
--=======================================================
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
                                on delete set null,
    constraint check_notice_available check (notice_available in ('Y','N'))
);
​
select * from notice;
​
--notice_no 시퀀스 생성
create sequence seq_notice_no;

​--공지사항 테이블 notice_available 컬럼에 check제약 조건 추가(Y,N)
alter table notice add constraint notice_available_check check(notice_available in ('Y','N'));

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

--=======================================================
--room테이블 생성
--=======================================================
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

--=======================================================
--reservation (예약)테이블 생성
--=======================================================
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
constraint fk_resv_member foreign key(resv_member) references member(member_id),
constraint check_resv_iscancel check (resv_iscancel in ('N','Y'))
);

--시퀀스 생성
create sequence seq_resv_no start with 1001;
--drop sequence seq_resv_no;

--예약 테이블 resv_iscancel 컬럼에 check제약조건 추가(Y,N)
alter table reservation add constraint resv_iscancel_check check(resv_iscancel in ('Y','N'));
select to_char(sysdate,'YYYYMMDD')||seq_resv_no.currval currval from dual;
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'hyemin',2,0,0,default,350000,'N','2019-12-29','2019-12-30',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'hyemin',1,0,0,default,450000,'N','2019-12-25','2019-12-29',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'hyemin',2,0,0,default,550000,'N','2019-12-30','2019-12-31',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'hyemin',2,0,0,default,350000,'N','2019-12-31','2020-1-1',0);
insert into reservation values(to_char(sysdate,'YYYYMMDD')||seq_resv_no.nextval,'hyemin',2,0,0,default,450000,'N','2019-12-29','2019-12-30',0);

select * from reservation;

--drop table reservation;
--=======================================================
--booked_room 예약된 객실 테이블 생성
--=======================================================
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

--booked_no 시퀀스 생성
create sequence seq_booked_no;


commit;

--drop table booked_room;
--drop sequence seq_booked_no;

--select trunc(to_date('2020-1-1','YYYY-MM-DD')) - trunc(notice_date) from notice;

--select room_no, count(*) reservedcnt from booked_room where (booked_checkin >= '2019-12-28' and booked_checkin < '2019-12-31') or (booked_checkout > '2019-12-28' and booked_checkout <= '2019-12-31') group by room_no;
--select room_no from booked_room where (booked_checkin >= ? and booked_checkin < ? ) or (booked_checkout > ? and booked_checkout <= ? )
--select r.room_no, count(*) reservedcnt from room r left join booked_room br on r.room_no = br.room_no where (br.booked_checkin >= '2019-12-28' and br.booked_checkin < '2019-12-31') or (br.booked_checkout > '2019-12-28' and br.booked_checkout <= '2019-12-31') group by r.room_no;

--select * from room r left join (select room_no from booked_room where (booked_checkin >= '2019-12-28' and booked_checkin < '2019-12-31') or (booked_checkout > '2019-12-28' and booked_checkout <= '2019-12-31')) br on r.room_no = br.room_no;

select r.room_no, count(cnt) cnt
from room r left join (select room_no cnt from booked_room where (booked_checkin >= '2019-12-31' and booked_checkin < '2020-1-1') or (booked_checkout > '2019-12-31' and booked_checkout <= '2020-1-1')) br on r.room_no = br.cnt
group by r.room_no;

--select r.room_no, count(cnt) cnt from room r left join (select room_no cnt from booked_room where (booked_checkin >= ? and booked_checkin < ?) or (booked_checkout > ? and booked_checkout <= ?)) br on r.room_no = br.cnt group by r.room_no

--=======================================================
--리뷰테이블
--=======================================================
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
--drop table review;
create sequence seq_review_no;
insert into review values(seq_review_no.nextval, 'qwerty', 201912301069, 61, '아오 청소좀 하세요', default, 1,1,1,1,1);
--insert into review values(seq_review_no.nextval, default, default, default, '리뷰테스트', default, 1,1,1,1,1);
select * from review;
commit;

--=======================================================
-- 쿠폰 테이블
--=======================================================
--쿠폰 종류 테이블 생성
create table coupon_kind(
    coupon_code varchar2(30) not null,
    coupon_content varchar2(50) not null,
    coupon_salePercent number not null,
    coupon_min number not null,
    constraint pk_coupon_code primary key(coupon_code)
);
​
insert into coupon_kind values('1', '웰컴쿠폰', 5, 500000);
​
--쿠폰 테이블 생성
create table coupon(
    coupon_no varchar2(24) not null,
    coupon_code varchar2(30) not null,
    member_id varchar2(20) default null,
    coupon_startDate date default sysdate,
    coupon_endDate date default sysdate+365,
    coupon_used char(1) default 'F',
    constraint pk_coupon_no primary key(coupon_no),
    constraint fk_coupon_code foreign key(coupon_code) references coupon_kind(coupon_code),
    constraint fk_member_id foreign key(member_id) references member(member_id),
    constraint ck_coupon_used check(coupon_used in ('T','F'))
);

insert into coupon values(DBMS_RANDOM.STRING('X', 10),'1','hyeminyu', default, default, default);

--회원이 사용 가능한 쿠폰 리스트 조회
select c.coupon_no, ck.coupon_content, ck.coupon_salepercent
from coupon c left join coupon_kind ck on c.coupon_code = ck.coupon_code 
where member_id ='hyeminyu' and coupon_enddate >= sysdate and coupon_min <=550000;
--select c.coupon_no, ck.coupon_content, ck.coupon_salepercent from coupon c left join coupon_kind ck on c.coupon_code = ck.coupon_code  where member_id = ? and coupon_enddate >= sysdate and coupon_min >= ?



select * from coupon_kind;
select * from coupon;

--=======================================================
-- 포인트 내역 테이블
--=======================================================
create table point_io(
    member_id varchar2(20) not null,
    point number not null,
    update_date date default sysdate,
    point_status char(1) not null,
    constraint fk_point_member_id foreign key (member_id) references member(member_id) on delete cascade,
    constraint check_point_status check (point_status in ('I','O'))
);
--drop table point_io;
--SELECT * FROM ALL_TRIGGERS;
select * from point_io order by update_date;

--회원가입할 경우 point_io에 웰컴 포인트 적립 내역 들어감
create or replace trigger trg_enroll_point
    after
    insert on member
    for each row
begin
        --회원가입한 경우, welcome 포인트 적립
        insert into point_io values(:new.member_id,3000,sysdate,'I');
end;
/

-- 예약 완료 시, 사용 포인트와 적립 포인트내역이 0이 아닐 경우 point_io테이블에 insert
create or replace trigger trg_resv_point_io
    after
    insert on reservation
    for each row
begin
    if :new.resv_usedpoint != 0 then
        insert into point_io values(:new.resv_member,:new.resv_usedpoint,sysdate,'O');
    end if;
    if :new.resv_addpoint != 0 then
        insert into point_io values(:new.resv_member,:new.resv_addpoint,sysdate,'I');
    end if;
end;
/

-- point_io 테이블 내역 따라서 member의 보유 포인트 변경
create trigger trg_member_point_io
    before 
    insert on point_io
    for each row
begin
     -- 입고인 경우
        if :new.point_status = 'I' then
            update member set member_points = member_points + :new.point
            where member_id = :new.member_id;
        -- 출고인 경우
        else
            update member set member_points = member_points - :new.point
            where member_id = :new.member_id;
        end if;
end;
/

--예약 확인하기
select * from reservation order by resv_date;
--delete from reservation
select * from booked_room order by resv_no;
--delete from booked_room
select * from point_io order by update_date;
select * from coupon;
select * from member where member_id='hyeminyu';
commit;

--=======================================================
-- 결제 내역 테이블
--=======================================================
create table payment(
    resv_no number not null,
    pay_date date not null,
    pay_method varchar2(20) not null,
    pay_money number not null,
    constraint fk_payment_resv_no foreign key (resv_no) references reservation(resv_no) on delete cascade
);

--결제 후 예약이 완료되면은 결제 내역 테이블에 자동으로 insert
--create or replace trigger trg_payment
--    after
--    insert on reservation
--    for each row
--begin
--     insert into create table values(:new.resv_no,sysdate,sysdate,'I');
--end;
--/
