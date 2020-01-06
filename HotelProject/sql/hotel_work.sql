--멤버 테이블 생성
create table member(
    member_id varchar2(20) not null,
    member_password varchar2(20) not null,
    member_name varchar2(30) not null,
    member_birth varchar2(8) not null,
    member_gender char(1) not null,
    member_email varchar2(50) not null,
    member_phone char(11) not null,
    member_points number default 0,
    member_enrolldate date default sysdate,
    constraint pk_member_id primary key(member_id),
    constraint ck_member_gender check(member_gender in ('M','F'))
);
​
select * from member;
​
insert into member values('qwerty','1234','쿼티','19990101','M','qwerty@naver.com','01012341234',default,default);
insert into member values('admin','1234','관리자','19900204','M','admin@bluemoon.com','0101111234',default,default);
​
--commit;