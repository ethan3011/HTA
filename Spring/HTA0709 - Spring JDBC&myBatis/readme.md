<h1>Srping & myBatis 연결해서 이용해보기</h1>


1. mybatis.jar, mybatis-spring.jar 라이브러리 의존성을 pom.xml에 추가(Maven Repository, ojdbc8, commons-dbcp 검색)

		
    	<dependency>
			<groupId>org.apache.commons</groupId>
			<artifactId>commons-dbcp2</artifactId>
			<version>2.8.0</version>
		</dependency>
		
		<dependency>
			<groupId>com.oracle.database.jdbc</groupId>
			<artifactId>ojdbc8</artifactId>
			<version>21.1.0.0</version>
		</dependency>
		
2.sample_product 테이블을 이용하기 위해 Vo와 Interface(CRUD 기능이 있는 DAO)를 작성한다.<br/>(com.sample.vo / com.sample.mapper / com.sample.service / com.sample.app)

		a. Insert : void insertProduct(Product product);
		b. Update : void updateProduct(Product product);
		c. SelectList : List<Product> getAllProducts();
		d. Select : Product getProductByNo(int ProductNo);
		
3. Mapper 파일 정의하기(CRUD 기능이 구현된 xml 파일정의)<br/>

		a. src/main/resources 경로에 mybatis 폴더를 생성한다.
		b. mybatis폴더 안에 mappers 폴더와 mybatis-config.xml(mapper configuration) 을 생성한다.
		c. mappers 안에 products.xml 을 생성한다.
		d. products.xml 안에 insert,update,selectList,select에 대한 xml sql 쿼리문을 작성한다.
	
4. com.sample.service에 ProductService class를 생성하여 사용할 기능을 생성한다.

		@Service								// annotation을 사용하여 Spring에서 Scan할수 있도록 설정한다.
		public class ProductService {
	
			@Autowired								// Autowired를 사용하여 Spring에서 Scan할수 있도록 설정한다.
			private ProductMapper productMapper;					// CURD 기능이 구현된 Interface를 생성한다.

			public void setProductMapper(ProductMapper productMapper) {		// interface의 SET 메소드를 생성한다.
				this.productMapper = productMapper;
			}

			public List<Product> getAllProductList(){				// Interface에 있는 메소드들을 재정의 한다.
				return productMapper.getAllProducts();
			}

			public void addNewProduct(Product product) {				// Interface에 있는 메소드들을 재정의 한다.
				productMapper.insertProduct(product);
			}

			public void addProducts(int productNo, int amount) {			// Interface에 있는 메소드들을 재정의 한다.
				Product product = productMapper.getProductByNo(productNo);
				product.setStock(product.getStock()+amount);
			}
		}
	
5.  3-b에서 생성한 mybatis-config.xml 에 환경설정을 추가한다.

		a. 환경설정 추가를 위해 <settings /> 를 추가한다.
		b. null값이 들어갈수 있는 컬럼을 위하여 jdbcTypeForNull 환경설정을 추가한다.
			<setting name="jdbcTypeForNull" value="NULL" />
		c. 실행로그를 확인하기 위하여 log4j2 를 추가한다.
			<setting name="logimpl" value="LOG4J2 />
		d. log4j2 파일을 src/main/resources에 추가한다.
			appenders = console
			appender.console.type = Console
			appender.console.name = STDOUT
			appender.console.layout.type = PatternLayout
			appender.console.layout.pattern = %-5p %c - %m%n
			rootLogger.level = debug	// debug or info 기능별 사용가능
			rootLogger.appenderRefs = stdout
			rootLogger.appenderRef.stdout.ref = STDOUT

6. Spring & myBatis 연동하기

		a. context-mybatis.xml을 생성한다.(Spring Bean Configuration File -> next -> context, mybatis-spring, p 선택 후 finish)
		b. db 정보 추가를 위해 Spring 폴더 안에 db.properties를 생성후 db 정보를 추가한다.(이름:값 / 이름은 개인적으로 설정가능하며 .으로 구분할수 있게 한다.).
			db.driverClassName=oracle.jdbc.OracleDriver
			db.url=jdbc:oracle:thin:@localhost:1521:xe
			db.username=hr
			db.password=zxcv1234
		c. context-mybatis.xml 에 연동을 위한 값들을 추가한다.
			1. 데이터베이스 연결정보가 포함된 Properties 파일 로딩하기
			<context:property-placeholder location="classpath:/spring/db.properties />

			2. Apache commons-dbcp의 BasicDataSource에 connection pool 객체를 SpringContainer에 등록하기(class는 dbcp 자동완성 기능 사용)
			(p를 사용해서 이름:값 형식으로 데이터를 넣어준다. 이름은 고정이며 값에는 db.properties에 기재된 이름을 ${}로 감싸서 추가한다.)
			<bean id="dataSource" class="org.apache.common.dbcp2.BasicDataSource"
				p:driverClassName="${db.driverClassName}"
				p:url="${db.url}"
				p:username="${db.username}"
				p:password="${db.password}"
			</bean>

		d. myBatis의 핵심객체(SqlSessionFactory)를 스프링의 빈으로 등록하기
			* mybatis의 환경설정 정보를 가지는 객체다.
			* 매핑된 SQL 구문정보를 가지는 객체다.
			* sqlSession을 제공하는 객체다.
			<bean id="sqlSessionFactory class="org.mybatis.spring.sqlSessionFactoryBean"
				p:dataSource-ref="dataSource"					// ref를 사용하여 dbcp를 참조한다.
				p:configLocation="classpath:/mybatis/mybatis-config.xml"	// 실제 mybatis-config.xml이 들어있는 경로를 넣어준다.
				p:mapperLocations="classpath:/mybatis/mapper/*.xml" />		// mapper안에 있는 모든 .xml 파일을 스프링의 빈으로 등록해준다.

		e. MapperScannerConfigurer를 스프링의 빈으로 등록하기
			* Mapper 인터페이스에 대한 구현객체(Mapper Interface)를 생성한다.
			* 생성된 Mapper Interface를 스프링 컨테이너의 빈으로 등록한다.
			<mybatis-spring:scan base-package="com.sample.mapper"				// ref를 사용하여 mapper 파일이 들어있는 package를 참조하게 한다.
							   factory-ref="sqlSessionFactory"		// ref 를 사용하여 sqlSessionFactory객체를 참조한다.
		f. 업무로직이 구현되어 있는 com.sample.service 패키지의 모든 클래스를 스캔해서 스프링의 빈으로 자동등록하고 의존성 주입도 처리한다.
			<context:component-scan base-package="com.sample.service" />
			
			
7. com.sample.app 에 SpringApp을 생성하여 생성한 기능들을 사용해본다.

		public class SpringApp {
			public static void main(String[] args) {
				ApplicationContext context = new ClassPathXmlApplicationContext("spring/context-mybatis.xml");

				ProductService service = context.getBean(ProductService.class);

				List<Product> products =  service.getAllProducts();

				for(Product item : products) {
					System.out.println(item.getNo() + ", " + item.getName() + ", " + item.getPrice());
				}

				Product findProduct = service.getProductByNo(64);

				System.out.println(findProduct.getNo());
				System.out.println(findProduct.getName());
				System.out.println(findProduct.getMaker());
				System.out.println(findProduct.getCategory());
				System.out.println(findProduct.getPrice());
				System.out.println(findProduct.getDiscountPrice());
				System.out.println(findProduct.getStock());
				System.out.println(findProduct.getSoldOut());
				System.out.println(findProduct.getCreatedDate());
				System.out.println(findProduct.getReviewCnt());


				Product item = new Product();
				item.setName("김치맨");
				item.setMaker("엄마손김치");
				item.setCategory("김치");
				item.setPrice(20000);
				item.setDiscountPrice(15000);
				item.setStock(150);

				service.insertProduct(item);
				System.out.println(item.getName() + " 아이템이 추가되었습니다.");

				findProduct.setName("피자맨");
				findProduct.setMaker("파파존스피자");
				findProduct.setCategory("피자");
				findProduct.setPrice(25000);
				findProduct.setDiscountPrice(18000);
				findProduct.setStock(200);

				service.updateProduct(findProduct);
				System.out.println(findProduct.getName() + " 아이템이 변경되었습니다.");

				System.out.println(findProduct.getNo());
				System.out.println(findProduct.getName());
				System.out.println(findProduct.getMaker());
				System.out.println(findProduct.getCategory());
				System.out.println(findProduct.getPrice());
				System.out.println(findProduct.getDiscountPrice());
				System.out.println(findProduct.getStock());
				System.out.println(findProduct.getSoldOut());
				System.out.println(findProduct.getCreatedDate());
				System.out.println(findProduct.getReviewCnt());
			}
		}
		
