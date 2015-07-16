create table member (
	id varchar2(50) primary key,
	pw varchar2(50) not null,
	name varchar2(20),
	birth Date,
	job varchar2(20),
	gen varchar2(20),
	memNo number	
);
select * from member;
delete from member where memNo=;
drop table member;
select * from intable;
create table intable (
	inNo number primary key,
	imtNo number,
	inDate Date,
	inSum number,
	inCon varchar2(50),
	inEtc varchar2(50),
	memNo number
);

drop table intable;

insert into intable values ('1','1','2015.04.14','30000','회비','회식 회비','1');
update intable set inCon = '월급', inEtc = '좋아요';
select * from intable;

create table inmet (
	imtNo number primary key,
	imtName varchar2(50),
	memNo number
);

drop table inmet;

insert into inmet values ('1','현금','1');
insert into inmet values ('2','우리은행','1');
insert into inmet values ('3','하나은행','1');
insert into inmet values ('4','국민은행','1');

select * from inmet;

select count(inDate) from intable where memNo = 1 and inDate between '2015-02-01' and '2015-02-28'

--------------------------------------------------

drop table memo;

create sequence memo_seq start with 1 increment by 1 nocycle nocache;

create table memo(
	MemoNo number primary key,
	regdate varchar2(20),
	content varchar2(4000),
	memoDate varchar2(20),
	memNo number
	
);

select * from memo;

drop table qna;

create sequence qna_seq start with 1 increment by 1 nocycle nocache;

create table qna(
	qnaNo number	primary key,
	qnaWriter varchar2(50),
	qnaTitle varchar2(50),
	qnaRegdate varchar2(20),
	qnaHit number,
	qnaContent varchar2(4000)
);
insert into qna values ('0','test','테스트중입니다','2015-06-29','1','test test');
select * from qna;

create sequence re_seq start with 1 increment by 1 nocycle nocache;

create table qnaRe(
	reNo number primary key,
	reRegdate varchar2(20),
	reContent varchar2(2000)
);
select * from qnaRe;

---------------------------------------------------------------

create table extable (
	exNo number primary key,
	emtNo number,
	exDate date,
	exSum number,
	exCon varchar2(50),
	exEtc varchar2(50),
	memNo number
);
drop table extable;
drop table exmet;

select * from intable;

select * from extable;

insert into extable values ('1','1','2015.04.14','30000','회비','회식 회비','1');

select * from exmet;
select * from inmet;

select * from extable;

insert into extable values ('1','1','2015.04.14','30000','회비','회식 회비','1');

create table exmet (
	emtNo number primary key,
	emtName varchar2(50),
	memNo number
);


insert into exmet values ('1','현금','1');
insert into exmet values ('2','우리은행','1');
insert into exmet values ('3','하나은행','1');
insert into exmet values ('4','국민은행','1');

select * from exmet;

