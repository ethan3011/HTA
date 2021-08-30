<h1>Transaction 을 Tx를 이용해서 사용해보기 </h1>

    1. src/main/java에 각 vo,exception,mapper,app,service 패키지 및 class를 생성한다.
    
    2. src/main/resources에 mybaits, spring, mappers 등 필요한 파일들을 생성한다.
    
    3. pom.xml에도 기존과 다를것 없이 OJDBC, DBCP, Spring-test, JUnit, Commons-codec, lombok 을 추가해준다.
    
    4. src/main/resources/spring에 SpringBean Configuration File을 생성할때 이번엔 mybatis를 체크하지 않고 사용해본다.
    (aop, context, p, tx만 체크한다. mybatis-spring은 체크하지 않는다.)
    
    5. context로 scan, configuration, placeholder, DBCP, SqlSessionFacotry를 생성한다.
    
    
<h2>SpringBean Configuration File에 mybatis 체크 하지않고 사용해보기</h2>

     1. 지정된 패키지에서 매퍼 인터페이스를 스캔해서 매퍼 인터페이스에 대한 매퍼 인스턴스를 생성하고,
        스프링의 빈을 등록시키는 MapperScannerConfigurer를 스프링의 빈으로 등록한다. 
        
        <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer"
          p:basePackage="com.sample.mapper"
          p:sqlSessionFactoryBeanName="sqlSessionFactory" />
          
     2. 선언적 Transaction 처리를 지원하는 TransactionManager를 스프링의 빈으로 등록한다.
        
        <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager"
        p:dataSource-ref="dataSource" />
        
     3. Spring AOP 설정을 사용해서 선언적 Transaction 처리하기
          * TransactionManager를 Advice로 만들기.
          * <aop:config /> 태그를 사용해서 클래스 공통기능으로 적용시킨다.
              a. 트랜잭션처리 규칙을 지정한다.
                 (tx:attributes />태그를 사용하면 트랜잭션 규칙을 지정 및 적용할 수 있다.
                 
          * <aop:config />에 사용할수 있는 대표적 기능들
              a. read-only : Transaction을 읽기 전용 모드로 만든다.
                 <tx:method read-only="true" name="get*" />
                 메소드 이름이 get으로 시작하는 모든 메소드에 Transaction이 적용될 떄는 읽기전용모드의 트랜잭션이 적용되게함.
                 (해당 메소드 내에서 Insert, Update, Delete를 사용하면 에러발생)
                 
              b. propagation - "REQUIRED" : Transaction의 전파규칙을 설정하는 기능을 사용할 수 있다.
                 <tx:method propagation="REQUIRED" name="*" />
                 name="*"을 사용하여 모든 메소드의 전파규칙을 REQUIRED로 설정한다.
                 
              c. rollback-for="예외클래스명" : rollback할 예외클래스를 지정한다.
              
              d. norollback-for="예외클래스명" : rollback 처리 하지 않을 예외클래스를 지정한다.
              
              e. timeout="초단위시간"(-1은 제한없음 + 기본값)
                 timeout에 지정된 시간을 초과할 경우 rollback 처리한다.
                 
         <tx:advice id="txAdvice" transaction-manager="transactionManager">
             <tx:attributes>
                <tx:method propagation="REQUIRED" name="*"/>
                <tx:method read-only="true" name="get* "/>
                <tx:method rollback-for="Exception" name="*" />
             </tx:attributes>
          </tx:advice>

<h2>AOP 설정</h2>
    
    1. <aop:config /> 를 사용해 트랜잭션이 공통기능으로 적용될 곳을 포인트 컷으로 지정한다.
    
    2. advisor를 정의한다.
        * advisor는 aspect와 동일한 개념이다.
        * advisor는 Spring AOP에만 있는 용어이다.
        * aspect와advisor는 advice + pointcut 이다.
        * transaction 처리를 지원하는 공통기능을 설정할 떄, <aop:aspect />태그 대신 <aop:advisor />를 사용한다.
        * transaction 처리를 지원하는 공통기능은 언제나 대상 메소드에 대해서
          around advice로 동작하기 떄문에 <aop:before />, <aop:around />와 같은 하위태그를 사용하지 않아도 되는
          <aop:advisor />를 사용한다.
          
          <aop:config>
            <aop:pointcut expression="execution(* com.sample.service.*Service.*(..))" id="txPointcut"/>
            <aop:advisor advice-ref="txAdvice" pointcut-ref="txPointcut" />
          </aop:config>
    
    
<h2>Service에서 사용하기</h2>

    public class SpringApp {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/context-tx-annotation.xml");
		UserService userService = context.getBean(UserService.class);
		
		User user = User.builder().id("kimaster1")
                        .password("zxcv1234")
                        .phone("010-1234-5678")
                        .email("masarapangkimchi@gmail.com")
                        .name("킹일")
                        .build();
		userService.addNewUser(user);
        }
    }
   
    
<h2>TestService에서 사용하기</h2>


        * SpringJUnit4ClassRunner
            단위테스트 실행시 spring-test 라이브러리가 지원하는 서비스를 제공받을 수 있도록 한다.
        @RunWith(SpringJUnit4ClassRunner.class)

        @ContextConfiguration
        	지정된 스프링 빈 설정파일을 읽어서 스프링 컨테이너를 생성한다.(객체생성, 의존성 주입 완료)
        @ContextConfiguration("classpath:/spring/context-tx-annotation.xml")

        @Transactional
            각각의 테스트 메소드 의 실행이 종료되면 해당 메소드내에서 수행했던 모든 데이터베이스 엑세스 작업을 롤백시킨다.
        	즉, 테이블의 상태를 테스트 이전 상태로 되돌려놓는다.
        	수동으로 값을 원래 상태로 되돌리는 작업없이 반복적으로 테스트를 수행할 수 있게 된다.
        @Transactional
        public class UserServiceTest {
	
        @Autowired
        	단위테스트 대상이 되는 객체를 스프링컨테이너로부터 주입받을 수 있다.
        @Autowired
        UserService userService;
        @Value
        	단위테스트 수행시 필요한 상수값, properties설정값을 주입받을 수 있다.
        @Value("${RegisterBonusPoint}")
        int DefaultPoint;

        @Test
        public void testConfig() {
            Assert.assertNotNull(userService);
            Assert.assertEquals(100, DefaultPoint);
        }

        @Test
        public void testAddNewUser() {
            User user = User.builder().id("kimaster1")
                        .password("zxcv1234")
                        .phone("010-1234-5678")
                        .email("masarapangkimchi@gmail.com")
                        .name("킹일")
                        .build();
		userService.addNewUser(user);
        }
        }
    }


        
    

    
              
              

    
