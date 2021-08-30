<h1>sample_games 와 sample_users로 Spring&myBatis 연동</h1>


<h3>요구 사항 : </h3>

	회원가입 서비스 요구사항
		- 신규 사용자 정보를 데이터베이스에 저장한다.				
		- 신규 가입한 사용자는 적립포인트를 100지급한다.				
		  * 동일한 아이디를 가진 사용자는 저장할 수 없고, 예외를 발생시킨다.		
		  * 동일한 이메일을 가진 사용자는 저장할 수 없고, 예외를 발생시킨다.		
		  * 동일한 전화번호를 가진 사용자는 저장할 수 없고, 예외를 발생시킨다.
		  
<h3>개발 내용 : </h3>

	com.sample.vo에 User 클래스 작성하기
	com.sample.dao에 UserMapper 인터페이스 작성하기
		- 새 사용자 정보를 전달받아서 저장하기
		- 변경된 사용자 정보를 전달받아서 반영하기
		- 아이디로 사용자 정보를 조회해서 반환하기
		- 이메일로 사용자 정보를 조회해서 반환하기
		- 전화번호로 사용자 정보를 조회해서 반환하기
	
	src/main/resources/mybatis/mappers에 users.xml 매퍼파일 작성하기
	
	com.sample.service에 UserService 클래스 작성하기
		- 사용자 정보를 전달받아서 회원가입 시키기
	
	com.sample.exception에 사용자정의 RuntimeException 클래스 작성하기
		- MallBusinessException

<h3>사용한 테이블 : </h3>


	Sample_games
	  CREATE TABLE SAMPLE_GAMES 
	  (
	    SAMPLE_GAME_NO NUMBER(8, 0) NOT NULL 
	  , SAMPLE_GAME_NAME VARCHAR2(50 BYTE) NOT NULL 
	  , SAMPLE_GAME_PRICE NUMBER(8, 0) NOT NULL 
	  , SAMPLE_GAME_DISCOUNT_PRICE NUMBER(8, 0) NOT NULL 
	  , SAMPLE_GAME_DESCRIBE VARCHAR2(2000 BYTE) 
	  , SAMPLE_GAME_STOCK NUMBER(8, 0) DEFAULT 0 
	  , SAMPLE_GAME_BRAND VARCHAR2(50 BYTE) 
	  , SAMPLE_CREATED_DATE DATE DEFAULT sysdate 
	  ) 

	Sample_users
	  CREATE TABLE SAMPLE_USERS 
	  (
	    USER_ID VARCHAR2(20 BYTE) NOT NULL 
	  , USER_NAME VARCHAR2(20 BYTE) NOT NULL 
	  , USER_PASSWORD CHAR(64 BYTE) NOT NULL 
	  , USER_EMAIL VARCHAR2(100 BYTE) 
	  , USER_PHONE VARCHAR2(20 BYTE) 
	  , USER_STATUS VARCHAR2(20 BYTE) DEFAULT 'active' 
	  , USER_CREATED_DATE DATE DEFAULT sysdate 
	  , USER_POINT NUMBER(8, 0) DEFAULT 0 
	  )
  
  <h3>1. pom.xml에 dbcp, jdbc, lombok, codec 의존성 주입을 설정한다.</h3>
 
    * dbcp : DB와 커넥션 되어있는 객체를 관리하는 역할
    * jdbc : Java로 Database에 접근할수 있게 하는 역할
    * lombok : Getter, Setter, Equlas, ToString 등 다양한 자동완성을 지원하는 역할
    * codec : 데이터를 인코딩, 디코딩 하는 역할
    
  <h3>2. src/main/java에 com.sample.*로 패키지를 생성하고 테이블의 정보로 클래스&인터페이스 를 추가한다</h3>
 
	* vo,mapper,service,app,exception
  
  <h3>3. src/main/resources 에 log4j2.properties, /mybatis, /mybatis/mappers 폴더 및 /spring 폴더 생성</h3>
  
	* log4j2.properties는 로그를 확인하기 위한 프로퍼티 파일이다.
    
  
  <h3>4. mybatis에 환경설정 정보를 위한 mybatis-config.xml을 생성한다.</h3>
 
    * null값을 추가하기 위해 <setting /> 안에 <setting name="jdbcTypeForNull" value="NULL"/> 를 추가한다.
    * log를 확인하기 위해 <setting /> 안에 <setting name="logImpl" value="LOG4J2"/> 를 추가한다.
    
  <h3>5. mybatis/mappers 폴더 안에 테이블에 사용된 *.xml 을 생성한다.</h3>
  
    - *.xml 파일에서는 com.sample.mappers 안에 인터페이스로 생성된 이름 그대로 sql문을 작성한다
    - namespace를 사용하여 이름 충돌을 피해 사용할 수 있다.
  
  <h3>6. spring과 mybatis 연결한다.</h3>
  
    * DB의 정보를 담기 위한 db.properties 파일을 생성한다.
      (
       db.driverClassName=oracle.jdbc.OracleDriver
       db.url=jdbc:oracle:thin:@localhost:1521:xe
       db.username=hr
       db.password=zxcv1234)
     * 신규가입자 신규 포인트를 위한 singup.properties 를 생성한다.
        (user.signup.bonus.point=100)
        
     * context-mybatis.xml 파일 생성한다.
        - 생성시 p, context, mybatis-spring을 체크한다.
     
     * srping폴더 안에 있는 모든 properties 파일을 불러온다.
        - <context:property-placeholder location="classpath:/spring/*.properties"/>
        
     * DBCP를 생성한다. (properties로 사용한 파일은 ${}로 감싸서 사용할 수 있다.)
        - <bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource" 
		  	   p:driverClassName="${db.driverClassName}" 
			     p:url="${db.url}" 
		  	   p:username="${db.username}" 
		  	   p:password="${db.password}" />
         
     * sqlSessionFactory를 생성한다.
        - <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean" 
        
          // ref로 위에서 생성한 DBCP의 dataSource를 참조한다.
			   	p:dataSource-ref="dataSource"
          
          // *.xml로 /mybatis/mappers 안에 있는 모든 xml 파일을 추가한다.
		  		p:mapperLocations="classpath:/mybatis/mappers/*.xml"
          
          // configlocation은 mybatis-config의 위치
		  		p:configLocation="classpath:/mybatis/mybatis-config.xml" />
          
     * MapperScannerConfiguration을 연결한다.
           (com.sample.mapper 안에 있는 모든 인터페이스를 조회하고 sqlSessionFactory를 참조 받는다)
        - <mybatis-spring:scan base-package="com.sample.mapper" factory-ref="sqlSessionFactory"/>
        
     * 모든 기능이 구현되있는 com.sample.service 객체를 스캔한다.
        - <context:component-scan base-package="com.sample.service" />
    
