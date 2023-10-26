show user;
-- USER이(가) "SEMI_ORAUSER2"입니다.

create table tbl_최원석
(no     number
,name   varchar2(20)
);
-- Table tbl_최원석(가) 생성되었습니다.

insert into tbl_이재훈(no, name) values(111, '동빈쿤');
-- 1 행 이(가) 삽입되었습니다.

commit;
-- 커밋 완료.

select * from tabs;

select * from tbl_이재훈;
select * from tbl_정지연;
select * from tbl_최원석;
select * from tbl_최우현;

drop table tbl_이재훈 purge;

------------------------------------------------------



drop table TBL_LOGIN_LOG purge;
drop table TBL_USER purge;
drop table TBL_CATEGORY purge;
drop table TBL_IMG purge;
drop table TBL_ITEM purge;
drop table TBL_BOARD purge;
drop table TBL_QNA purge;
drop table tbl_detail purge;

-- 회원 테이블
create table tbl_user
(userid             varchar2(60)   not null  -- 회원아이디
,pwd                varchar2(200)  not null  -- 비밀번호 (SHA-256 암호화 대상)
,name               varchar2(30)   not null  -- 회원명
,birthday           varchar2(10)             -- 생년월일   
,email              varchar2(200)  not null  -- 이메일 (AES-256 암호화/복호화 대상)
,mobile             varchar2(200)            -- 연락처 (AES-256 암호화/복호화 대상)
,gender             varchar2(1)              -- 성별   남자:1  / 여자:2 
,postcode           varchar2(5)              -- 우편번호
,address            varchar2(200)            -- 주소
,detailaddress      varchar2(200)            -- 상세주소
,extraaddress       varchar2(200)            -- 참고항목
,registerdate        date default sysdate     -- 가입일자
,last_pwd_changedate  date default sysdate    -- 마지막으로 암호를 변경한 날짜  
,status             number(1) default 1 not null     -- 회원상태  0: 관리자 / 2: 휴면중 / 1: 사용가능(가입중, 활동중)
,constraint PK_tbl_member_userid primary key(userid)
,constraint UQ_tbl_member_email  unique(email)
,constraint CK_tbl_member_gender check( gender in('1','2') )
,constraint CK_tbl_member_status check( status in(0,1,2) )
);
-- Table TBL_USER이(가) 생성되었습니다.


-- 로그인기록 테이블
create table tbl_login_log
(fk_userid      varchar2(60)         not null  -- 회원아이디
,login_date     date default sysdate not null  -- 로그인 되어진 접속날짜 및 시간
,login_ip       varchar2(20)         not null
,constraint FK_tbl_login_log_fk_userid foreign key(fk_userid) references tbl_user(userid)
);
-- Table TBL_LOGIN_LOG이(가) 생성되었습니다.


-- 카테고리 테이블
create table tbl_category
(ca_id            varchar2(60)        not null  -- 카테고리 아이디
,ca_name          varchar2(60)        not null  -- 카테고리 이름
,ca_how_to_use    Nvarchar2(1000)     not null  -- 사용방법
,ca_caution       Nvarchar2(1000)     not null  -- 주의사항
,ca_expired       Nvarchar2(100)      not null  -- 사용기한
,constraint PK_tbl_category_ca_id primary key(ca_id)
);
-- Table TBL_CATEGORY이(가) 생성되었습니다.




-- 제품 테이블
create table tbl_item
(it_seq_no       number(6)            not null  -- 제품일련번호
,fk_ca_id        varchar2(60)         not null  -- 카테고리 아이디
,it_name         Nvarchar2(100)       not null  -- 상품명
,it_price        number(10)           not null  -- 가격
,it_ingredient   Nvarchar2(1000)                -- 성분
,it_describe     Nvarchar2(1000)                -- 설명
,it_create_date  date default sysdate not null  -- 제품생성일
,it_update_date  date                           -- 제품수정일
,it_stock        number(10)                     -- 재고
,it_volume       varchar2(10)                   -- 용량
,it_status       number(1)                      -- 단종여부(0 : 단종 / 1 : 판매중)
,constraint PK_tbl_item_it_seq_no primary key(it_seq_no)
,constraint FK_tbl_item_fk_ca_id foreign key(fk_ca_id) references tbl_category(ca_id)
,constraint CK_tbl_item_it_status check( it_status in(0,1) )
);
-- Table TBL_ITEM이(가) 생성되었습니다.

select *
from tbl_img
-- is_main_img가 0 이면 img_file 만

-- 제품사진 테이블
create table tbl_img
(img_seq_no      number(6)     not null -- 사진 일련번호
,fk_it_seq_no    number(6)     not null -- 제품아이디
,img_file        varchar2(30)  not null -- 파일이름
,constraint FK_tbl_img_fk_it_seq_no foreign key(fk_it_seq_no) references tbl_item(it_seq_no)
,constraint UQ_tbl_img_img_file  unique(img_file)
);
-- Table TBL_IMG이(가) 생성되었습니다.


-- 공지사항 테이블
create table tbl_board
(seq_no         number(3)             not null -- 글번호
,title          Nvarchar2(50)         not null -- 글제목
,content        Nvarchar2(2000)                -- 글내용
,register_date  date default sysdate  not null -- 글등록일
,update_date    date                           -- 글수정일
,constraint PK_tbl_board_seq_no primary key(seq_no)
);
--Table TBL_BOARD이(가) 생성되었습니다.


-- 자주묻는 질문 테이블
create table tbl_qna
(q_seq_no          number(3)             not null -- 질문번호
,q_category        Nvarchar2(10)         not null -- 질문카테고리
,q_title           Nvarchar2(50)                  -- 질문제목
,q_content         Nvarchar2(500)                 -- 답변내용
,q_register_date   date default sysdate  not null -- 답변등록일
,q_update_date     date                           -- 답변수정일
,constraint PK_tbl_qna_q_seq_no primary key(q_seq_no)
);
-- Table TBL_QNA이(가) 생성되었습니다.


-- 리뷰 테이블
create table tbl_review
(re_seq_no     number(3)            not null -- 리뷰번호
,fk_userid     varchar2(60)         not null -- 회원아이디
,fk_it_seq_no  number(6)            not null -- 제품아이디
,re_content    Nvarchar2(200)                -- 리뷰내용
,re_date       date default sysdate not null -- 작성일자
,constraint PK_tbl_review_re_seq_no primary key(re_seq_no)
,constraint FK_tbl_review_fk_userid foreign key(fk_userid) references tbl_user(userid)
,constraint FK_tbl_review_fk_it_seq_no foreign key(fk_it_seq_no) references tbl_item(it_seq_no)
);
-- Table TBL_REVIEW이(가) 생성되었습니다.


-- 장바구니 테이블
create table tbl_cart
(ct_seq_no     number(3)     not null -- 장바구니일련번호
,fk_userid     varchar2(60)  not null -- 회원아이디
,fk_it_seq_no  number(6)     not null -- 제품아이디
,order_qty     number(3)     not null -- 주문수량
,constraint PK_tbl_cart_ct_seq_no primary key(ct_seq_no)
,constraint FK_tbl_cart_fk_userid foreign key(fk_userid) references tbl_user(userid)
,constraint FK_tbl_cart_fk_it_seq_no foreign key(fk_it_seq_no) references tbl_item(it_seq_no)
);
-- Table TBL_CART이(가) 생성되었습니다.


-- 좋아요 테이블
create table tbl_heart
(fk_userid     varchar2(60)  not null -- 회원아이디
,fk_it_seq_no  number(6)     not null -- 제품아이디
,heart         varchar2(1)            -- 좋아요
,constraint FK_tbl_heart_fk_userid foreign key(fk_userid) references tbl_user(userid)
,constraint FK_tbl_heart_fk_it_seq_no foreign key(fk_it_seq_no) references tbl_item(it_seq_no)
);
-- Table TBL_HEART이(가) 생성되었습니다.


-- 주문내역 테이블
create table tbl_order
(order_seq_no  number(6)            not null -- 주문일련번호
,fk_userid     varchar2(60)         not null -- 회원아이디
,fk_it_seq_no  number(6)            not null -- 제품일련번호
,sh_name       varchar2(20)         not null -- 수령인
,sh_mobile     varchar2(11)         not null -- 수령인연락처
,sh_postcode   varchar2(5)          not null -- 우편번호
,sh_address    varchar2(100)        not null -- 배송수령지
,sh_msg        varchar2(100)        not null -- 배송메세지
,order_date    date default sysdate not null -- 주문일자
,constraint PK_tbl_order_order_seq_no primary key(order_seq_no)
,constraint FK_tbl_order_fk_userid foreign key(fk_userid) references tbl_user(userid)
,constraint FK_tbl_order_fk_it_seq_no foreign key(fk_it_seq_no) references tbl_item(it_seq_no)
);
-- Table TBL_ORDER이(가) 생성되었습니다.


-- 주문상세 테이블
create table tbl_detail
(o_detail_seq_no  number(12)           not null -- 주문상세일련번호
,fk_order_seq_no  number(6)            not null -- 주문일련번호
,o_qty            number(3)            not null -- 주문수량
,o_price          number(10)           not null -- 주문금액
,o_status         number(1)            not null -- 주문상태 (0 : 배송준비중 / 1 : 배송중 / 2 : 배송완료)
,deliverd_date    date                          -- 배송완료일자
,constraint PK_tbl_detail_o_detail_seq_no primary key(o_detail_seq_no)
,constraint FK_tbl_detail_fk_order_seq_no foreign key(fk_order_seq_no) references tbl_order(order_seq_no)
,constraint CK_tbl_detail_o_status check( o_status in(0,1,2) )
);
-- Table TBL_DETAIL이(가) 생성되었습니다.

commit;




create table tbl_board
(seq_no         number(3)             not null -- 글번호
,title          Nvarchar2(50)         not null -- 글제목
,content        Nvarchar2(2000)                -- 글내용
,register_date  date default sysdate  not null -- 글등록일
,update_date    date                           -- 글수정일
,constraint PK_tbl_board_seq_no primary key(seq_no)
);




---------------------- 공지사항  ---------------------------------


create sequence seq_board
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

insert into tbl_board(seq_no,title,content,register_date,update_date)
values(seq_board.nextval,'개인정보처리방침 개정 내용 안내 (2022.12.02~)', '<br><br><br>
					2022.12.02(금)부터 개인정보처리방침이 일부 변경됩니다. <br> 탬버린즈는 회원님의 개인정보를 안전하게
					활용, 보호하기 위한 노력과 관련 법규 준수에 최선을 다하고 있습니다.<br> <br> <br>
					1. 주요 개정 내용<br> <br> (1) 제 4 조(개인정보의 처리위탁)<br> *처리
					위탁 받는 자(수탁자) : 우체국 → LF logistics로 변경<br> <br> (2) 제 6
					조(개인정보 보호업무 및 관련 고충사항 처리 부서)<br> *개인정보관리책임자 이메일 :
					privacy@gentlemonster.com → privacy@tamburins.com로 변경<br> <br>
					(3) 제 6조 (개인정보 보호업무 및 관련 고충사항 처리 부서)<br> <br> A. 기존<br>
					- 개인정보침해신고센터 전화 : (국번없이)118 / URL : http://privacy.kisa.or.kr<br>
					- 대검찰청 사이버수사과 전화 :(국번없이)1301 / URL : http://www.spo.go.kr<br>
					- 경찰청 사이버안전국 전화 : 182 / URL : http://cyberbureau.police.go.kr<br>
					<br> B. 변경<br> - 개인정보침해신고센터 전화 : (국번없이)118 / URL :
					http://privacy.kisa.or.kr<br> - 개인정보보호 포털 전화 : (국번없이)118 / URL
					: https://www.privacy.go.kr/<br> - 경찰청 사이버수사국 전화 : (국번없이)182 /
					URL : http://cyberbureau.police.go.kr<br> <br> (4) 제 2조
					(개인정보의 수집항목 및 수집 • 이용 목적)<br> <br> A. 기존<br> * 필수항목
					: 성명, 본인확인 값(CI), 이메일, 주소, 생년월일, 성별, 휴대전화번호, 온라인 회원의 아이디(ID) 및
					비밀번호, 휴대전화번호, 구매거래 내역, 누적금액 내역<br> * 선택항목 : 정보 수신 동의 여부
					(이메일TM, 우편물)<br> <br> B. 변경 <br> * 필수항목 : [직접 가입]
					이메일, 비밀번호, 이름, 전화번호, 생년월일, 본인확인기관에서 제공하는 본인인증결과값(CI) [카카오로 가입하기]
					카카오 이용자 식별ID, 이름, 전화번호, 이메일, 본인확인기관에서 제공하는 본인인증결과값(CI),생년월일<br>
					[네이버로 가입하기] 네이버 이용자 식별ID, 이름, 전화번호, 이메일, 본인확인기관에서 제공하는
					본인인증결과값(CI),생년월일<br> * 선택항목 : [직접 가입] 성별, [마케팅 및 광고에의 활용] 이름,
					이메일, 전화번호, 생년월일, 쿠키, 접속IP정보, 본인확인기관에서 제공하는 본인인증결과값(CI)<br> <br>
					<br> 2. 시행 일정<br> 시행일 : 2022. 12. 2. (개인정보처리방침 공고일: 2022.
					11. 23)<br> <br> <br> <br> 감사합니다.
					<br><br><br>', sysdate, sysdate);



insert into tbl_board(seq_no,title,content,register_date,update_date)
values(seq_board.nextval,'개인정보처리방침 개정 내용 안내 (2022.01.30~)', '<br><br><br>
					2023.01.30(월)부터 개인정보처리방침이 일부 변경됩니다. <br> 탬버린즈는 회원님의 개인정보를 안전하게
					활용, 보호하기 위한 노력과 관련 법규 준수에 최선을 다하고 있습니다. <br>
					<br> 1. 주요 개정 내용 <br>
					<br> (1) 제 4 조(개인정보의 처리위탁) <br> - 기존 <br> ① LF
					logistics - 배송 <br> ② 엔에치엔한국사이버결제㈜ - 결제대행 <br> ③ ㈜아이코드,
					㈜다우기술 - SMS, MMS 등 문자메세지 발송 <br> ④ 주식회사 컴홈 - 카카오톡 메세지 발송 <br>
					⑤ ㈜진승정보기술 - POS <br>
					<br>
					<br> - 변경* <br> ① NAVER PAY - 결제 <br> ② KCP - 결제 및
					현금영수증 발행 <br> ③ 카카오페이 - 결제 <br> ④ CJ대한통운 - 배송 <br> ⑤
					LF Logistics Korea.LTD - 배송 <br> ⑥ 팝빌 - 카카오톡 메시지 발송 <br>
					⑦ ㈜ 아이코드, ㈜다우기술 - 문자 메시지 발송 <br> ⑧ ㈜ 채널코퍼레이션 - 고객 통화 및 챗 상담,
					챗봇 서비스 제공 <br> ⑨ ㈜ 신세계아이앤씨 - 매장 POS 결제 서비스 제공 <br>
					<br>
					<br> 2. 시행 일정 <br>
					<br> 시행일 : 2023. 1. 30. (개인정보처리방침 공고일: 2022. 1. 23.)
					<br><br><br>', sysdate, sysdate);
                    
                    
insert into tbl_board(seq_no,title,content,register_date,update_date)
values(seq_board.nextval,'멤버십 적립금 사용 정책 변경 안내(2023.07.22~)', '<br><br><br>
				2023년 7월 22일부터 적립금 사용 정책이 변경되어 아래와 같이 안내 드립니다. <br>
				<br> (1) 변경 전 (2023년 7월 21일까지) <br> - 적립 가능처 : 플래그십
				스토어(신사, 삼청), 하우스 도산, 스타필드 하남점, 신세계 백화점 (강남/센텀시티점), 롯데백화점 본점(명동),
				현대백화점 판교점<br> - 사용 가능처 : 플래그십 스토어(신사, 삼청), 하우스 도산, 스타필드 하남점,
				신세계 백화점 (강남/센텀시티점), 현대백화점 판교점<br>
				<br> (2) 변경 후 (2023년 7월 22일부터) <br> - 적립 가능처 : 플래그십
				스토어(신사, 삼청), 하우스 도산, 스타필드 하남점, 신세계 백화점 (강남/센텀시티점), 롯데백화점 본점(명동),
				현대백화점 판교점<br> - 사용 가능처 : 플래그십 스토어(신사, 삼청), 하우스 도산 <br> <br>
				<br> *이외 스토어에서의 적립금 사용 및 적립은 불가합니다.<br> *취소 및 환불 시, 유효기간이
				남아있는 경우에만 자동 환급됩니다.<br> *멤버십 적립금은 탬버린즈 정책에 따라 변경될 수 있습니다.<br>
				<br><br><br>', sysdate, sysdate);
                
                
insert into tbl_board(seq_no,title,content,register_date,update_date)
values(seq_board.nextval,'공식 온오프라인 스토어 교환/반품 정책 변경 안내 (2023.08.05~)', '<br><br><br>
				2023년 8월 5일부터 공식 온오프라인 스토어 교환 및 반품 정책이 변경되어 아래와 같이 안내 드립니다. <br>
				<br> (1) 변경 전 (2023년 8월 4일까지) <br>
				<br> ① 교환 규정 : 제품 구매일로부터 14일 이내 가능 *단순 변심 교환의 경우, 오프라인 스토어만 가능함
				<br> ② 반품 규정 : 제품을 개봉하거나 파손 및 오염으로 정상 판매가 불가한 경우 불가 <br> ③
				선물 구매 : 반품 불가, 교환 가능 *오프라인 스토어에 한하여 가능함. <br>
				<br> (2) 변경 후 (2023년 8월 5일부터) <br>
				<br> ① 교환 규정 : 제품 구매일 후 7일 이내 가능 (구매일은 7일 내 포함하지 않음) *단순 변심 교환의
				경우, 오프라인 스토어만 가능함 <br> ② 반품 규정 : 제품을 개봉하거나 개봉 스티커를 제거한 경우 불가,
				파손 및 오염으로 정상 판매가 불가한 경우 불가 (겉박스 포함) <br> ③ 선물 구매 : 반품 불가, 교환 가능
				*오프라인 스토어에 한하여 가능함 (하액 제품 교환 불가) <br> <br> *해당 정책 내 사유 또는
				절차 외의 방법으로 반품 및 교환 진행은 불가합니다.<br> *탬버린즈의 교환 및 반품 정책은 변경될 수
				있습니다.<br>
				<br>
				<br><br><br>', sysdate, sysdate); 
                
                
insert into tbl_board(seq_no,title,content,register_date,update_date)
values(seq_board.nextval,'탬버린즈 사칭 메일 주의 안내 (2023-08-02~)', '<br><br><br>
					최근 탬버린즈 브랜드 명칭이 포함된 메일 주소를 통해 SNS 게시물 포스팅 또는 태그를 제안하는 명목으로, 특정 링크를
					클릭하여 개인정보 입력을 유도하는 사칭 메일이 무작위로 발송되고 있습니다. <br> <br>

					탬버린즈에서는 메일을 통해 고객님께 대가성 SNS 게시물 포스팅 협업 제안이나 개인정보를 요구하지 않습니다. 당사를
					사칭한 이메일로 인해 고객님의 피해가 발생하지 않도록 각별히 주의하여 주시길 바랍니다. <br> <br>

					1. 예시 - 사칭 메일 사례  ※ 제목과 내용은 변경될 수 있음 <br>
					<br> (1) 메일 제목 : Collaboration <br>
					<br> (2) 보낸 사람 : TAMBURINS OFFICIAL :
					tamburinsmanagement@gmail.com <br>
					<br> (3) 메일 내용 <br> ① 개인 SNS 내 제품 포스팅 또는 태그 시, 대가를 지급한다는
					내용 (할인코드, 제품 제공, 현금성 입금) <br> ②
					https://t.me/tamburinsmanagement 링크로 접속하여 고객 정보 기입 요구 <br> ③
					탬버린즈 제품 이미지가 노출되는 허위 사이트 이미지, 계약서 파일 첨부되어 있음 <br> <br>

					*(4) 피싱 메일 대응 방법 및 주의사항 <br> ① 피싱 메일 계정과 제목, 내용이 (3)내용과 다를 수
					있으며 수시로 변경될 수 있습니다. <br> ② 탬버린즈 공식 메일은 @tamburins.com으로 발송됩니다.
					<br> 발송 메일이 이와 다를 경우, 수신하신 메일은 열람하지 마시고 즉시 삭제 또는 신고처리를 위해 탬버린즈
					대표메일 (cs@tamburins.com)로 전달해주세요.
					<br> <br> <br>', sysdate, sysdate);   
                    
commit;

select seq_no, title, content, register_date, update_date
from tbl_board
order by seq_no desc;





-----------------------------------------------------------------------------------

select userid as 주문자
     , email as 주문자이메일
     , it_name as 제품명
     , it_volume as 용량
     , it_price as 단가
     , sh_name as 수령인
     , sh_mobile as 수령인_전화번호
     , sh_postcode as 수령인_우편번호
     , sh_address as 수령인_주소
     , to_char(order_date,'yyyy-mm-dd') as 주문일자
     , o_price as 주문금액
     , o_qty as 주문수량
from tbl_order O
join
tbl_user U
on O.fk_userid = U.userid
join tbl_item I
on I.it_seq_no = O.fk_it_seq_no
join tbl_detail D
on O.order_seq_no = D.fk_order_seq_no
where fk_userid = 'arcnet5';



select *
from tbl_category;

select *
from tbl_item;

--제품일련번호	카테고리 이름(join 해서 가져오기)	상품명	가격	성분	제품생성일	제품수정일	재고	용량	단종여부
--		사용방법,주의사항,사용기간은 자동으로 가져오기

select it_seq_no as 제품일련번호
      ,fk_ca_id as 카테고리아이디
      ,it_nam as 상품명
      ,it_price as 가격
      ,it_ingredient as  성분
      ,it_describe as 설명
      ,it_create_date as 제품생성일
      ,it_update_date as 제품수정일
      ,it_stock as 재고
      ,it_volume as 용량
      ,ca_name as 카테고리 이름
      ,
from tbl_category C
JOIN tbl_item I
on C.ca_id = I.fk_ca_id;


create table tbl_category
(ca_id            varchar2(60)        not null  -- 카테고리 아이디
,ca_name          varchar2(60)        not null  -- 카테고리 이름
,ca_how_to_use    Nvarchar2(1000)     not null  -- 사용방법
,ca_caution       Nvarchar2(1000)     not null  -- 주의사항
,ca_expired       Nvarchar2(100)      not null  -- 사용기한
,constraint PK_tbl_category_ca_id primary key(ca_id)
);


select ca_id, ca_name, ca_how_to_use, ca_caution, ca_expired
from tbl_category

commit;


