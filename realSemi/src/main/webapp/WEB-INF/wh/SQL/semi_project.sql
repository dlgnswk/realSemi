
show user;
-- USER이(가) "SEMI_ORAUSER2"입니다.

create table tbl_최우현
(no     number
,name   varchar2(20)
);
-- Table TBL_최우현이(가) 생성되었습니다.





select*from tab;




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


-- 제품사진 테이블
create table tbl_img
(img_seq_no      number(6)     not null -- 사진 일련번호
,fk_it_seq_no    number(6)     not null -- 제품 일련번호
,img_file        varchar2(30)  not null -- 파일이름
,constraint FK_tbl_img_fk_it_seq_no foreign key(fk_it_seq_no) references tbl_item(it_seq_no)
,constraint UQ_tbl_img_img_file  unique(img_file)
);
-- Table TBL_IMG이(가) 생성되었습니다.


-- 공지사항 테이블
create table tbl_board
(seq_no         number(3)             not null -- 글번호
,title          Nvarchar2(50)         not null -- 글제목
,content        Nvarchar2(1000)                -- 글내용
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



select * 
from user_sequences;

select it_seq_no
from tbl_item;


-- tbl_item insert
insert into tbl_item(it_seq_no, fk_ca_id, it_name, it_price, it_ingredient, it_describe, it_create_date, it_update_date, it_stock, it_volume, it_status) 
            values(SEQ_ITEM.nextval, 'bw', 'BIGALICO', 52000, '씁쓸한 오렌지 | 시더우드 | 달콤한 리코라이스', '초여름 한바탕 시원한 소나기를 겪어 물기를 머금은 비가라드 오렌지의 씁쓸한 시트러스로 시작되는 이 향은, 진한 녹색의 껍질을 벗겨낼 때 툭 터지듯 쏟아지는 달콤한 과육의 느낌을 머금고 공기중에 가득히 퍼져나갑니다. 이어지는 차분하고 향긋한 아로마 노트의 시더우드가 리코라이스의 달콤한 잔향과 어우러져 편안하고 진한 여운을 남깁니다.
샤워리바디 워시.
4가지 비의 이야기를 담고 있는 샤워리 바디 워시는 물에 닿는 순간 풍성한 거품으로 변해 피부를 부드럽게 씻어내어 자연의 향으로 감싸줍니다.

일상의 자극으로 지친 몸과 마음을 편안한 수분감으로 진정시키는 병풀 성분이 함유되어 촉촉하게 빛나는 피부를 유지하는 데에 도움을 줍니다. <br>
						<br> 샤워리바디 워시. <br> 4가지 비의 이야기를 담고 있는 샤워리 바디 워시는 물에 닿는
						순간 풍성한 거품으로 변해 피부를 부드럽게 씻어내어 자연의 향으로 감싸줍니다. <br>
						<br> 일상의 자극으로 지친 몸과 마음을 편안한 수분감으로 진정시키는 병풀 성분이 함유되어 촉촉하게 빛나는
						피부를 유지하는 데에 도움을 줍니다.', default, null, 1000, '470ml', 1  );
commit;
-- 1 행 이(가) 삽입되었습니다.
-- 커밋 완료.

-- tbl_img insert
insert into tbl_img(img_seq_no, fk_it_seq_no, img_file) 
            values(SEQ_IMG.nextval, 14, 'bw_bodywash_nimbus_02.jpg');
commit;


select *
from tbl_img
where FK_IT_SEQ_NO = 14;

update tbl_img set img_file='bw_nimbus_04.jpg'
where img_seq_no = 9;
commit;
select *
from tbl_img


String sql = "select img_file\n"+
"from tbl_img\n"+
"where FK_IT_SEQ_NO = 14;";


create table tbl_img
(img_seq_no      number(6)     not null -- 사진 일련번호
,fk_it_seq_no    number(6)     not null -- 제품 일련번호
,img_file        varchar2(30)  not null -- 파일이름
,constraint FK_tbl_img_fk_it_seq_no foreign key(fk_it_seq_no) references tbl_item(it_seq_no)
,constraint UQ_tbl_img_img_file  unique(img_file)
);




-- tbl_category insert
insert into tbl_category(ca_id , ca_name, ca_how_to_use, ca_caution, ca_expired) 
            values('bw', 'bodywash', '<span>사용방법</span><br> 적당량을 손 또는 샤워타월 등 도구에 묻혀 충분히 거품을 낸 다음
                    전신에 마사지하듯 문지른 후 물로 깨끗이 씻어내세요. 사용 시 스토퍼 제거 후 펌프에 표시된 방향으로 회전하여
                    사용하세요. (오픈 후 펌프가 헛도는 경우가 있으나, 제품 불량이 아닙니다.)', 
                    '<span>사용할 때의 주의사항</span><br> 1) 화장품 사용 시 또는 사용 후 직사광선에 의하여
                    사용부위가 붉은 반점, 부어오름 또는 가려움증 등의 이상 증상이나 부작용이 있는 경우 전문의 등과 상담할 것.<br>
                    2) 상처가 있는 부위 등에는 사용을 자제할 것. <br> 3) 보관 및 취급 시의 주의사항. <br>
                    가) 어린이의 손이 닿지 않는 곳에 보관할 것 <br> 나) 직사광선을 피해서 보관할 것<br>
                    *본 제품은 공정거래위원회 고시 소비자 분쟁 해결기준에 의해 보상받으실 수 있습니다.',
                    '<span>사용기한</span><br> 사용기한 30개월(상품 발송일 기준으로 사용기한이 12개월 이상
					남은 상품만을 판매합니다.)' );
commit;
-- 1 행 이(가) 삽입되었습니다.


select *
from tbl_item

update tbl_item set IT_DESCRIBE_SIMPLE='도넛피치의 풍성하고 달콤한 향이 포근하고 작은 비구름을 떠오르게 합니다. 어린 코코넛 껍질에서 처음 느껴지는 부드러운 풋내는 도넛 피치 노트의 버터리한 느낌과 만나 고급스러움을 더해주며, 머스크 본연의 깨끗하고 포근한 잔향이 하루의 시작과 마무리를 기분좋게 만들어줍니다.
<br><br>샤워리바디 워시.<br>'
where IT_INGREDIENT = '도넛피치 | 어린 코코넛의 풋내음 | 포근한 머스크';
commit;

update tbl_item set it_ingredient='정제수, 소듐라우레스설페이트, 코카미도프로필베타인, 소듐클로라이드, 향료, 암모늄라우릴설페이트, 소듐벤조에이트, 라우레스-3, 소듐설페이트, 피이지-40하이드로제네이티드캐스터오일, 피피지-26-부테스-26, 소듐코코일애플아미노산, 베타인, 판테놀, 헥실렌글라이콜, 부틸렌글라이콜, 글리세린, 1,2-헥산다이올, 에틸헥산다이올, 병풀추출물, 테트라소듐글루타메이트다이아세테이트, 아시아틱애씨드, 아시아티코사이드, 마데카식애씨드, 황색5호, 적색40호, 파네솔, 리모넨'
where it_price = 52000;
commit;


alter table tbl_category 
drop column ca_ingredient;
commit;

select *
from tbl_category

--컬럼 추가하기 
alter table tbl_category
add ca_ingredient Nvarchar2(1000);
commit;

select ca_name, it_name, it_price, it_ingredient, it_describe, G.img_file
from tbl_category c join tbl_item i
on c.CA_ID = i.FK_CA_ID
join tbl_img G
on i.it_seq_no = G.fk_it_seq_no
where it_seq_no = 14;   


create table tbl_cart
(ct_seq_no     number(3)     not null -- 장바구니일련번호
,fk_userid     varchar2(60)  not null -- 회원아이디
,fk_it_seq_no  number(6)     not null -- 제품아이디
,order_qty     number(3)     not null -- 주문수량

select *
from tbl_cart;

select *
from tbl_item;


select C.fk_it_seq_no, I.it_name, I.it_price
from tbl_cart C join tbl_item I
on C.fk_it_seq_no = I.it_seq_no
where it_seq_no = 14;   




fk_user_id
fk_it_seq_no
order_qty

