# Spring MyBatis Project

### Dependency 설정
* mybatis : 최신버전
* mybatis-spring : 최신버전
* commons-dbcp2 : 최신버전(commoms-dbcp 와는 다름)

### commons-dbcp2
* apache 제단에서 만든 DB Connection 도구
* DB 연결을 pool을 사용하여 많은 동시 접속을 효율적으로 처리
* 기본적으로 DB연결 Connection 미리 다수(10개)를 만들어
두고 연결 요청이 오면 그중 1개를 연결하는 통로로 공한다 

### mybatis
* mybatis 는 DB 연동과 관련된 상당히 많은 부분의 코드를 
직접 작성하지 않고 수행할 수 있도록 도와주는 DB연결 Lib
* 현재 진행형의 DB 연동이 이루어지는 Spring Project에서는
거의 mybatis를 활용한 DB연결이 이루어진다.

# Spring DB연동 프로젝트 작성
1. 기본 SpringMVC 프로젝트 생성
2. pom.xml에 Spring 관련 기본 Dependency 설정
3. mybatis 관련 Dependency 설정
4. 여기까지 기본 프로젝트가 정상적으로 구동되는지 확인하기
5. mybatis-context.xml 을 작성하기
6. DBMS에 table 생성하기
7. model claass(VO,DTO) 생성하기
8. Dao생성하기, Service 생성하기, controller 생성하기
9. client에서 request하여 Controller에 요청하고 
데이터가 정상적으로 select 되는지 log를 통해서 확인