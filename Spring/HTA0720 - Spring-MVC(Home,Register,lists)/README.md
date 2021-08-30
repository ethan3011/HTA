# Spring MVC 웹 애플리케이션 개발하기
## Client - Controller - Service
![image](https://user-images.githubusercontent.com/80470138/126378532-291eb0fb-edcf-423b-b347-bcee6d828b7e.png)
## Spring-mybatis System
![image](https://user-images.githubusercontent.com/80470138/126378561-4eacd5f6-baf4-4a99-aaed-2fecd8be54ac.png)
## Spring Containers
![image](https://user-images.githubusercontent.com/80470138/126378582-beec1f05-ec86-427a-b18e-1515c8dade8a.png)

## 1. pom.xml에 의존성 추가하기
<ul>
    <li> spring-mvc 라이브러리 의존성</li>
    <li> javax.servlet-api, jstl 라이브러리 의존성</li>
    <li> 그 외, 오라클, mybatis, dbcp, lobmok, codec, log,  etc…</li>
    <li> spring-webmvc는 mvc 패턴의 웹 애플리케이션 개발을 지원하는 스프링의 라이브러리다.</li>
    <li> javax.servlet-api는 jsp작성 및 요청/응답객체, 세션객체를 사용할 때 필요할 라이브러리다.</li>
    <li> jstl은 jsp에서 core태그, 국제화태그를 사용하기 위해서 필요한 라이브러리다.</li>
</ul>

## 2. 스프링 빈 설정파일 생성하기(context-root.xml)
<ul>
    <li> 루트 웹 애플리케이션컨텍스트(root spring container)용 스프링 빈 설정파일이다. </li>
    <li> ContextLoaderListener가 설정파일을 읽어서 스프링 컨테이너를 생성한다.</li>
    <li> 업무로직 수행에 필요한 객체들이 포함된다.</li>
    (Connection Pool, Transaction, mybatis, Dao, ServiceImpl)
</ul>
    

    <context-param>
      <param-name>contextConfigLocation</param-nama>
    <param-value>/WEB-INF/spring/context-root.xml</param-value>
    </context-param>
    <listener>
      <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>

<ul>
    <li> Listener 클래스는 웹 이벤트가 발생했을 때 자동으로 실행되는 클래스다.</li>
    <li> 웹 이벤트는 요청객체가 생성/폐기 될 때, 세션객체가 생성/폐기 될 때, 애플리케이션객체가 생성/폐기 될 때,
      요청객체에 속성값이 저장/변경/삭제 될 때, 세션객체에 속성값이 저장/변경/삭제 될 때,
      애플리케이션 객체에 속성값이 저장/변경/삭제 될 때 발생한다.</li>
    <li> ContextLoaderListener은 애플리케이션객체(ServletContext)의 초기화가 완료될 때 자동으로 실행되는 리스너 클래스다.
      애플리케이션객체의 초기화는 Tomcat이 켜지면 시작된다.</li>
    <li> 애플리케이션객체는 초기화 될 때 <context-param />으로 설정한 초기화 파라미터값을 읽어간다.</li>
</ul>

## context-web-*.xml
<ul>
    <li>자식 웹 애플리케이션컥텍스트(Child Spring Container)용 스프링 빈 설정파일이다.</li>
    <li>DispatcherServlet이 설정파일을 읽어서 스프링 컨테이너를 생성한다.</li>
    <li>주로, 웹 요청처리에 필요한 객체들이 포함된다.</li>
</ul>

```
  <servlet>
  <servlet-name>app</servlet-name>
  <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  <init-param>
  <param-name>contextConfigLocation</param-name>
  <param-value>/WEB-INF/spring/context-web.xml</param-value>
  </init-param>
  <load-on-startup>1</load-on-startup>
  </servlet>
  <servlet-mapping>
  <servlet-name>app</servlet-name>
  <url-pattern>/</url-pattern>
  </servlet-mapping>
```
<ul>
    <li> DispatcherServlet은 <init-param />에 설정된 스프링 빈 설정파일을 읽어서 스프링 컨테이너를 생성한다.</li>
    <li> DispatcherServlet이 생성한 스프링 컨테이너들끼리는 객체를 참조할 수 없다.(서로 의존성 주입을 할 수 없다.)</li>
</ul>






## 3. 클라이언트 요청 처리하기 

   ### 1. 컨트롤러에 요청핸들러 메소드 구현하기
```
  @RequestMapping(“/product/list”)
  public String productList() {
      // 클라이언트 요청을 처리하는 수행문;
  }
```
   ### 2. Service 인터페이스에 클라이언트의 요청을 처리하기 위한 업무로직 수행 메소드를 정의하기.
```
  public interface Service {
      List<Product> getAllProducts();
  }
```
   ### 3. ProductServiceImpl 구현클래스에서 메소드를 재정의(메소드를 구현)한다
```
  public class productServiceImpl implements ProductService {

  @Autowired
  // mybatis의 MapperScannerConfigurer객체가 ProductDao 인터페이스를 구현한 구현객체(Proxy 빈, 매퍼인스턴스)를 스프링의 빈으로 등록
  ProductDao productDao;

      public List<Product> getAllProducts() {
      // 업무로직을 수행하는 수행문;
      }
  }
  업무로직 수행시 필요한 데이터를 엑세스하기 위해서 DAO 구현체가 필요한 경우, 
  @Autowired 어노테이션을 이용해서 필요한 DAO 구현객체를 주입받는다.
```
  ### 4. ProductDao 인터페이스에서 필요한 데이터베이스 엑세스 작업과 관련된 메소드를 정의한다.
```
  public interface ProductDao {
      List<product> selectAll();
  }
```
  ### 5. ProductDao 인터페이스와 매핑된 매퍼파일에 selectAll() 구현시 필요한 SQL을 정의한다.
```
  <select id=”selectAll” resultType=”com.sample.vo.Product”>
      select product_no as no,
      product_name as name,
      ...
      from
      sample_products
  </select>
```

## 강사님의 사용방법 
<ul>
<li>조회작업의 경우 : “4 -> 5 -> 2 -> 3 -> JSP” 의 순서로 개발함. </li>
<li>추가, 변경인 경우 : “JSP -> 1                -> 4 -> 5          -> 2 -> 3       -> 1” 의 순서로 개발함</li>
</ul>


			
			
## LogType - 출력의 양 제어하기
<ul>
<li>fatal : 치명적 오류 메시지 출력, 프로그램 실행이 중단됨</li>
<li>error : 오류 메시지 출력, 프로그램 실행이 중단됨</li>
<li>warning : 경고 메시지 출력, 프로그램 실행에는 문제없음</li>
<li>info : 정보 메시지 출력, 프로그램 실행에 대한 일반적인 정보</li>
<li>debug : 상세정보 메시지 출력, 프로그램 실행에 대한 상세정보</li>
<li>trace : debug와 유사</li>
</ul>



## 회원가입 기능 만들어 보기
<ul>
<li>회원가입 폼 요청하기</li>
<li>요청방식 : GET</li>
<li>요청URL : localhost/spring-mvc/register</li>
<li>컨트롤러 : HomeController</li>
<li>요청핸들러 메소드</li>
</ul>

```
  @GetMapping(“/register)
  public String registerform() {
  return “form”;
  }
```

<ul>
<li>회원정보 등록 요청하기</li>
<li>요청방식 : POST</li>
<li>요청URL : localhost/spring-mvc/register</li>
<li>컨트롤러 : HomeController</li>
<li>요청핸들러 메소드</li>
</ul>

```
  @PostMapping(“/register”)
  public String register() { 

  return “redirect:home”; // 재요청 URL 응답으로 보내기
  }
```


# 새롭게 알게된점 

### 1. Pom.xml :

__Property로 버전을 지정하여 ${}로 감싸서 사용할 수 있음__
```
<properties>
  <spring.maven.artifact.version>4.3.25.RELEASE</spring.maven.artifact.version>
  <egovframework.rte.version>3.10.0</egovframework.rte.version>
  <spring.version>5.2.16.RELEASE</spring.version>
  <log4j.version>2.14.1</log4j.version>
  <slf4j.version>1.7.31</slf4j.version>
  <lombok.version>1.18.20</lombok.version>
  <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
</properties>
```

__mybatis 프레임워크 라이브러리 의존성 추가__
```
<dependency>
  <groupId>org.mybatis</groupId>
  <artifactId>mybatis</artifactId>
  <version>3.5.7</version>
</dependency>
```

__mybatis와 spring 연동을 지원하는 라이브러리 의존성 추가__
```
<dependency>
  <groupId>org.mybatis</groupId>
  <artifactId>mybatis-spring</artifactId>
  <version>2.0.6</version>
</dependency>
```

__로그 출력을 지원하는 라이브러리 의존성 추가__
```
<dependency>
  <groupId>org.apache.logging.log4j</groupId>
  <artifactId>log4j-api</artifactId>
  <version>${log4j.version}</version>
</dependency>
<dependency>
  <groupId>org.apache.logging.log4j</groupId>
  <artifactId>log4j-core</artifactId>
  <version>${log4j.version}</version>
</dependency>
<dependency>
  <groupId>org.apache.logging.log4j</groupId>
  <artifactId>log4j-jcl</artifactId>
  <version>${log4j.version}</version>
</dependency>
<dependency>
  <groupId>org.slf4j</groupId>
  <artifactId>slf4j-api</artifactId>
  <version>${slf4j.version}</version>
</dependency>
<dependency>
  <groupId>org.apache.logging.log4j</groupId>
  <artifactId>log4j-slf4j-impl</artifactId>
  <version>${log4j.version}</version>
</dependency>
```

__JSTL 표준태그 라이브러리 의존성 추가__
```
<dependency>
  <groupId>javax.servlet</groupId>
  <artifactId>jstl</artifactId>
  <version>1.2</version>
</dependency>
```
__서블릿을 지원하는 라이브러리 의존성 추가__
```
<dependency>
  <groupId>javax.servlet</groupId>
  <artifactId>javax.servlet-api</artifactId>
  <version>4.0.0</version>
  <scope>provided</scope>
</dependency>
```

__스프링 코어 라이브러리 의존성 추가__
```
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-core</artifactId>
  <version>${spring.version}</version>
  <exclusions>
    <exclusion>
      <groupId>commons-logging</groupId>
      <artifactId>commons-logging</artifactId>
    </exclusion>
  </exclusions>
</dependency>
```

__MVC 패턴의 웹 애플리케이션을 개발을 지원하는 스프링 라이브러리 추가__
```
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-webmvc</artifactId>
  <version>${spring.version}</version>
</dependency>
```

__스프링 컨테이너를 제공하는 스프링 라이브러리 추가__
```
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-context</artifactId>
  <version>${spring.version}</version>
</dependency>
```

__데이터베이스엑세스와 트랜잭션 처리를 지원하는 스프링 라이브러리 추가__
```
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-jdbc</artifactId>
  <version>${spring.version}</version>
</dependency>
```

### 2. web.xml

__루트 스프링 컨테이너 설정하기__
<ul>
  <li> ContextLoaderListner는 Tomcat이 시작되면 <context-param />에 설정된 스프링 빈 설정파일을 읽어서
    스프링 컨테이너를 생성한다. </li>
  <li> ContextLoaderListener가 생성한 스프링 컨테이너는 루트 스프링 컨테이너가 된다.</li>
  <li> ContextLoaderListener가 생성한 스프링 컨테이너가 관리하는 빈들은 Child 스프링 컨테이너에서 참조할 수 있다.
    (즉, Root 스프링 컨테이너가 관리하는 빈들은 Child 스프링 컨테이너가 관리하는 빈들에게 의존성 주입이 가능하다.)</li>
</ul>

```
<context-param>
  <param-name>contextConfigLocation</param-name>
  <param-value>/WEB-INF/spring/context-root.xml</param-value>
</context-param>
  <listener>
  <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>
```
  

__모든 URL 요청이 접수될 때마다 실행되는 서블릿 배포하기__
```
<url-pattern>/</url-pattern>"은 모든 URL 요청을 뜻한다.
<servlet-name>app</servlet-name>"
<url-pattern>/</url-pattern>"
```

__모든 URL 요청에 대해서 app라는 이름을 가진 서블릿이 그 요청을 처리하도록 함__
```
  * <servlet-name>app</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    DispatcherSevelet을 app라는 이름으로 배포함.
  * 따라서, 모든 URL 요청에 대해서 DispatcherServlet이 실행됨
```

__Spring Container 생성하기__
```
  * <init-param/>은 서블릿에게 설정정보를 전달할 때 사용하는 태그다.
  * contextConfigLocation이라는 이름으로 스프링 설정파일의 경로를 설정하면 DispatcherServlet이
    설정파일을 읽어서 스프링 컨테이너를 생성하고, 설정파일의 설정정보를 분석해서 객체 생성/의존성 주입을 한다.
```

__Tomcat 시작될 때 서블릿객체가 생성되고, 초기화까지 완료되게 하기__

<ul>
  <li> <load-on-startup>1</load-on-startup> 태그는 톰캣이 시작되면 
    이 태그가 붙어있는 서블릿을 생성하고, 초기화시킨다.</li>
  <li> 가운데 숫자는 우선순위다. 숫자가 낮을 수록 빨리 생성/초기화된다.</li>
</ul>

```
<servlet>
  <servlet-name>app</servlet-name>
  <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  <init-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>/WEB-INF/spring/context-web.xml</param-value>
  </init-param>
  <load-on-startup>1</load-on-startup>
</servlet>

<servlet-mapping>
  <servlet-name>app</servlet-name>
  <url-pattern>/</url-pattern>
</servlet-mapping>
```

__한글 인코딩을 위한 필터 설정하기__
```
<filter>
  <filter-name>characterEncodingFilter</filter-name>
  <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
  <init-param>
    <param-name>encoding</param-name>
    <param-value>UTF-8</param-value>
  </init-param>
</filter>
<filter-mapping>
  <filter-name>characterEncodingFilter</filter-name>
  <url-pattern>/*</url-pattern>
</filter-mapping>
```

__모든 JSP에서 공통으로 사용되는 태그라이브러리설정을 모든 JSP 페이지의 맨 앞부분에 include하기__
```
<jsp-config>
  <jsp-property-group>
    <url-pattern>*.jsp</url-pattern>
    <include-prelude>/WEB-INF/views/common/tags.jsp</include-prelude>
  </jsp-property-group>
</jsp-config>
```

