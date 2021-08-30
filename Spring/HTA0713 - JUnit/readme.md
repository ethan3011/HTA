# JUnit 단위테스트


<h3>1. pom.xml 에 단위테스트에 필요한 사항들 추가하기</h3>

      1. JUnit 사용을 위해 Maven Repository에서 JUnit 검색
          (https://mvnrepository.com/artifact/junit/junit)
      2. Maven Dependencies 에서 spring-tx-버전.을 확인후 Maven Repository에서 spring-test 검색
          (https://mvnrepository.com/artifact/org.springframework/spring-test)


<h3>2. src/test/java 에 테스트할 패키지(com.sample.service),클래스(TestProductService,TestUserSerivce)생성</h3>

        JUnit 테스트를 위해 생성한 클래스에 Annotation을 추가해준다
          - @RunWith : 단위테스트 실행시 같이 실행할 클래스를 지정한다.(헬프클래스)
          - @ContextConfiguration : 스프링 빈 컨테이너를 생성하고 추가/분석/관리를 하는 곳
          
          @RunWith(SpringJUnit4ClassRunner.class)
          @ContextConfiguration(locations = "classpath:/spring/context-mybatis.xml")
          public class TestProductService(){
          
          }
          
<h3>3. 테스트 할 service 객체를 생성하고 사용을 위해 @Autowired Annotation을 추가해준다. </h3>
      
          @RunWith(SpringJUnit4ClassRunner.class)
          @ContextConfiguration(locations = "classpath:/spring/context-mybatis.xml")
          public class TestProductService(){
          
          @Autowired
          ProductService productService;
          
          }

<h3> Aseert 메소드 정리 </h3>

      - assertArrayEquals(a, b) :  배열 A와 B가 일치함을 확인한다.


      - assertEquals(a, b) : 객체 A와 B가 같은 값을 가지는지 확인한다.


      - assertEquals(a, b, c) :  객체 A와 B가 값이 일치함을 확인한다.( a: 예상값, b:결과값, c: 오차범위)


      - assertSame(a, b) : 객체 A와 B가 같은 객체임을 확인한다.


      - assertTrue(a): 조건 A가 참인지 확인한다.


      - assertNotNull(a) : 객채 A가 null이 아님을 확인한다.
      
<h3>TestProduct에 JUnit으로 단위테스트 해보기 </h3>
      
          @RunWith(SpringJUnit4ClassRunner.class)
          @ContextConfiguration(locations = "classpath:/spring/context-mybatis.xml")
          public class TestProductService(){
          
          @Autowired
          ProductService productService;
          
              * Ignore를 Test와 같이 사용할 경우 테스트할때 무시된다.
              @Ignore
              @Test
              public void testConfig(){
                Assert.assertNotNull(productSerivce);
              }
  
              @Test
              public void testGetAllProducts() {
                List<Product> products = productService.getAllProducts();
                Assert.assertEquals(20, products.size());
              }
          }
        
<h3>UserProduct에 Junit으로 단위테스트 하기 </h3>

          @RunWith(SpringJUnit4ClassRunner.class)
          @ContextConfiguration(locations = "classpath:/spring/context-mybatis.xml")
          public class TestUserService {
              * @Value를 사용하여 properties의 값을 불러올 수 있다.
              @Value("${regsiter.BonusPoint})
              int defaultDepositPoint (설정값100)

              @Autowired
              UserService userService;

              * 테스트를 위한 객체를 생성한다.
              * 중복 아이디, 연락처, 이메일로 된 아이디를 새로 생성할때, 생성해둔 MallExpceiton이 발생하는지 확인
              User user;
              User userForId;
              User userForPhone;
              User userForEmail;


              * @Before은 각각의 Test가 실행되기 전에 실행되며 전처리 작업을 위하여 사용된다.
              @Before
              public void setUp() {
                * 빌더 패턴을 이용해서 초기화된 User객체 획득
                 user = User.builder()
                      .id("mandu1234")
                      .password("zxcv1234")
                      .name("김만두")
                      .email("mandu123@gmail.com")
                      .phone("010-5555-5555")
                      .build();
                 userForId = User.builder()
                      .id("mandu1234")
                      .password("zxcv1234")
                      .name("김만두")
                      .email("mandu2345@gmail.com")
                      .phone("010-6666-6666")
                      .build();
                 userForPhone = User.builder()
                      .id("mandu2345")
                      .password("zxcv1234")
                      .name("김만두")
                      .email("mandu3456@gmail.com")
                      .phone("010-5555-5555")
                      .build();
                 userForEmail = User.builder()
                      .id("mandu3456")
                      .password("zxcv1234")
                      .name("김만두")
                      .email("mandu123@gmail.com")
                      .phone("010-7777-7777")
                      .build();
              }
              
              
              * @After 는 각각의 테스트 메소드가 실행된 후에 초기화를 위해 실행되는 메소드다
              @After
              public void teardown() {
                * 테스트 수행과정에서 데이터베이스에 저장했던  테스트 사용자 정보를 모두 삭제한다.
                userService.removeUser("mandu1234");
                userService.removeUser("mandu2345");
                userService.removeUser("mandu3456");
              }
              
              
              @Test
              public void testAddNewUser() {
                * 신규 사용자 정보 저장
                userService.addNewUser(user);
                * 새로 저장된 사용자 정보 조회
                User savedUser = userService.getUserDetail(user.getId());
                * 새로 저장된 사용자 정보가 요구사항에 맞게 값이 저장되어있는지 체크
                Assert.assertNotNull(savedUser);
                Assert.assertEquals("mandu1234", savedUser.getId());
                Assert.assertEquals("active",savedUser.getStatus());
                Assert.assertEquals(defaultDepositPoint,savedUser.getPoint());
              }
              
              * @Test(excepted = exception.class)는 exception에 적은 exception이 발생하면 성공, 아닐경우 오류를 발생한다.
              @Test(expected = MallBusinessException.class)
              public void testAddNewUserExistId() {
                * 신규 사용자 저장
                userService.addNewUser(user);
                * 동일한 아이디를 가진 신규 사용자 저장
                userService.addNewUser(user);
              }
              @Test(expected = MallBusinessException.class)
              public void testAddNewUserExistPhone() {
                * 신규 사용자 저장
                userService.addNewUser(user);
                * 동일한 연락처를 가진 신규 사용자 저장
                userService.addNewUser(userForPhone);
              }

              @Test(expected = MallBusinessException.class)
              public void testAddNewUserExistEmail() {
                * 신규 사용자 저장
                userService.addNewUser(user);
                * 동일한 이메일을 가진 신규 사용자 저장
                userService.addNewUser(userForEmail);
              }
          }
