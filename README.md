# FinalProject
## 프로젝트 개요
> 코로나19로 인해 재택 근무가 증가하여 재택 근무 시 활용 가능한 툴에 대한 수요가 증가하였습니다. 또한 글로벌 협업이 강화되고, 시장 규모가 확대됨에 따라 근태 관리 시장에 변화가 생겼습니다. 
따라서 타 사이트와 차별화된 그룹웨어 사이트를 만들어 보고자 기획하게 되었습니다.
<br>

## 프로젝트 진행 순서
1. 기획  [:floppy_disk:.pdf](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/f63008b3-bafb-4242-9caa-04e1f4e40658/01.%EA%B8%B0%ED%9A%8D%ED%9A%8C%EC%9D%98_Worktech.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220126T104100Z&X-Amz-Expires=86400&X-Amz-Signature=f0bea671dfa855aaebe3a6b7b48fe894eedc32188e37336bba8830febb871548&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%2201.%25EA%25B8%25B0%25ED%259A%258D%25ED%259A%258C%25EC%259D%2598_Worktech.pdf%22&x-id=GetObject)
    + 개발 배경 고찰
    + 구현 목표 설정
    + 요구사항 정의서 작성
    + 단위업무 정의서 작성을 통한 요구사항 상세화  
    <br>
    
2. UI 설계  [:floppy_disk:.pdf](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/f53cb7de-d619-4517-ace3-b1a405bca110/02.UI%ED%9A%8C%EC%9D%98_Worktech.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220126T104127Z&X-Amz-Expires=86400&X-Amz-Signature=f969d5e2b27669008fba95e336f1cbad672c989a84072266e537f363f6d04ebf&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%2202.UI%25ED%259A%258C%25EC%259D%2598_Worktech.pdf%22&x-id=GetObject)
    + 유스케이스 다이어그램 작성
    + 스토리보드를 통한 화면 구성 설계  
    <br>
3. DB 구축  [:floppy_disk:.pdf](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/4d256ca5-c5b8-4dd3-a0bb-bf31dd382477/03.DB%ED%9A%8C%EC%9D%98_Worktech.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220126T104139Z&X-Amz-Expires=86400&X-Amz-Signature=b7bfaa9fa0eeb2846d10f5103b2170e8d9e668ac6879b324ece7bb0b93352651&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%2203.DB%25ED%259A%258C%25EC%259D%2598_Worktech.pdf%22&x-id=GetObject)
    + DB 구축을 위한 ERD 설계
    + 테이블 정의서를 통한 ERD 상세화
    + 실제 테이블 구성 : [:clipboard:.sql](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/6f039189-5c25-4b4f-99cd-6283dad91e5d/Worktech_DB.sql?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220126T104631Z&X-Amz-Expires=86400&X-Amz-Signature=c28f4c999811110ffb529e7bf145cd9c8b310f0073a3153052178f0960bd5e94&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Worktech_DB.sql%22&x-id=GetObject)
    <br>

4. 실구현  [:floppy_disk:.pdf](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a4974ee2-b15c-4479-bb77-054bcefb911a/04.%EC%B5%9C%EC%A2%85_Worktech.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220126T104851Z&X-Amz-Expires=86400&X-Amz-Signature=8a1a46de92f74a01b70d573b830cd3ef8b475ab0d7a7b37a459db2467d8f8db0&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%2204.%25EC%25B5%259C%25EC%25A2%2585_Worktech.pdf%22&x-id=GetObject)
<br>

## 구현 기능
### [사원]
-------------
+ 마이페이지
+ 전자결재
+ 메일
+ 회의실 예약
+ 기타 예약
+ 일반/공지사항 채팅
+ 캘린더
+ 알림
+ 주소록
+ 근태 관리
<br>

### [관리자]
-------------
+ 공지사항 게시판 등록/수정/삭제
+ 기타 예약 자산 등록/수정/삭제
+ 사원 관리
+ 부서 관리
<br>

### [공통]
-------------
+ 로그인
+ 공지사항/일반/익명 게시판 조회/검색
+ 일반/익명 게시판 등록/수정/삭제
+ 댓글 등록
<br>

## 사용 기술 및 개발 환경
```
Server : Apache Tomcat 9.0
Database : Oracle 18c
Development Tool : Eclipse 4.15.0, sqlDeveloper version 21.2.1
Development Language :  JAVA , HTML5, CSS3, JavaScript, jQuery, SQL, EL/JSTL
Framework: Spring, Mybatis, Bootstrap
Team Coop : Github, Sourcetree, ERDCloud, Figma
Open API : FullCalendar, ztree, jstree, summernote
```
