--hotel 계정생성
create user hotel identified by hotel
default tablespace users;
grant connect , resource to hotel;