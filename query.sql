--게시판 테이블 생성
CREATE TABLE TB_BOARD
(
    IDX NUMBER PRIMARY KEY,
    PARENT_IDX NUMBER,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENTS VARCHAR2(4000) NOT NULL,
    HIT_CNT NUMBER NOT NULL,
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,
    CREA_DTM DATE DEFAULT SYSDATE NOT NULL,
    CREA_ID VARCHAR2(30) NOT NULL
);
  
COMMENT ON TABLE TB_BOARD IS '게시판';
COMMENT ON COLUMN TB_BOARD.IDX IS '인덱스';
COMMENT ON COLUMN TB_BOARD.PARENT_IDX IS '부모글 인덱스';
COMMENT ON COLUMN TB_BOARD.TITLE IS '제목';
COMMENT ON COLUMN TB_BOARD.CONTENTS IS '내용';
COMMENT ON COLUMN TB_BOARD.HIT_CNT IS '조회수';
COMMENT ON COLUMN TB_BOARD.DEL_GB IS '삭제구분';
COMMENT ON COLUMN TB_BOARD.CREA_DTM IS '생성일자';
COMMENT ON COLUMN TB_BOARD.CREA_ID IS '생성자 ID';

--게시판 시퀀스 생성
CREATE SEQUENCE SEQ_TB_BOARD_IDX
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

--파일업로드 테이블 생성
CREATE TABLE TB_FILE
(
  IDX   NUMBER,
  BOARD_IDX NUMBER NOT NULL,
  ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NOT NULL,
  STORED_FILE_NAME VARCHAR2(36 BYTE) NOT NULL,
  FILE_SIZE NUMBER,
  CREA_DTM  DATE DEFAULT SYSDATE NOT NULL,
  CREA_ID   VARCHAR2(30 BYTE) NOT NULL,
  DEL_GB    VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL,
  PRIMARY KEY (IDX)
);

--파일업로드 시퀀스 생성
CREATE SEQUENCE SEQ_TB_FILE_IDX
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCACHE;
