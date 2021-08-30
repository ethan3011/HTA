# 사용가능한 매개변수
## 기본자료형타입	 - 요청파라미터와 매핑되는 매개변수다.
### 작성예
```
@GetMapping(“/search”)
handlerMethod(@RequestParam(“keyword”) String keyword, 
   @RequestParam(name=”page”,required=”false”, defaultValue=”1”) int page)
```
+ request.getParameter(“keyword”)로 획득한 값을 keyword 변수에 전달한다.
+ request.getParameter(“page”)로 획득한 값을 page에 전달한다.
  + 매개변수 타입이 int이기 때문에 정수형 타입으로 변환해서 전달함.   
  (만약, 조회된 값에 정수로 변환할 수 없는 값이 포함되어 있으면 오류 발생)
  + required=false는 요청 파라미터에 page 값이 없어도 상관없다.
  + defaultValue=”1”은 요청파라미터에 page가 존재하지 않을 때 사용될 기본값이다.
+ /search						매개변수 keyword=null, page=1
+ /search?keyword=자바				매개변수 keyword=자바, page=1
+ /search?keyword=자바&page=3			매개변수 keyword=자바, page=3
+ /search?keyword=자바&page=			오류(빈문자열)
+ /search?keyword=자바&page=가			오류(글자는 숫자로 변환불가능)
```
handlerMethod(String keyword, int page)
  handlerMethod(@RequestParam(name=”keyword”, required=true) String keyword,
  @RequestParam(name=”page”, required=true) int page)
```
+ /search   
오류
+ /search?keyword=자바   
오류
+ /search?keyword=자바&page   
오류
+ /search?keyword=자바&page=가   
오류
+ /search?keyword=자바&page=1   
매개변수 keyword=자바, page=1



## 사용자 정의  XXXForm객체
### 작성예
```
@PostMapping(“/register”)
handlerMethod(UserRegisterForm userRegisterForm)
```
+ 사용자정의 클래스가 요청핸들러 메소드의 매개변수로 지정되어 있는 경우
+ 스프링은 기본생성자 메소드를 호출해서 객체를 초기화시킨다.(무조건 기본생성자가 존재해야 함)
+ Getter/Setter 메소드가 구현되어 있어야 한다.
+ 사용자정의 클래스는 다수의 요청 파라미터 혹은 폼 입력값을 전달받기 위해서 사용된다.
+ 사용자정의 클래스의 멤버변수명은 요청파라미터의 이름 혹은 폼 입력요소의 name 속성과 일치해야 한다.


		
## 배열 혹은 List
### 작성예
```
@RequestMapping(“/order”)
handlerMethod(int[] no, int[] amount)
```
* 같은이름의 요청파라미터값이 여러개 전달되는 경우 배열 혹은 List 타입의 매개변수를 지정한다.
```
order?no=10&amount=1&no=34&amount=2
```


### 사용가능한 매개변수 타입
+	Servlet API 		- HttpServletRequest, HttpServletResponse, HttpSession
+	java.util.Locale		- 지역화정보가 포함된 객체(국가코드, 언어)
+	Model, Map, ModelMap	- 뷰에 전달할 데이터를 담는 용도의 객체를 전달받을 수 있다.
+	Erros, BindingResult	- 입력값 유효성 검사결과를 저장하는 객체를 전달받을 수 있다.
+	SessionStatus		- 세션폼 처리시에 해당 세션을 제거하기 위해서 사용한다.


## 로그인한 사용자 정보 조회하기
### HttpSession을 요청핸들러 메소드에 매개변수로 정의하기
```
@GetMapping(“my/info”)
public String userInfo(Session session) {
  User user = (User) session.getAttribute(“LOGINED_USER”);
    return “user/info”;
}
```
+ Controller의 요청핸들러 메소드 내에서만 위의 방식으로 HttpSession 객체를 획득할 수 있다.


### RequestContextHolder객체로 httpSession객체 획득하기
```
@GetMapping(“/my/info)
public String userInfo() {
  ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributeS();
  HttpSession session = attributes.getRequest().getSession(create);
  User user = (User) session.getAttribute(“LOGINED_USER”);
}
```
+ 위에 코드만 작성하면 Controller, Service, Dao 등 모든 클래스에서 HttpSession 객체를 획득할 수 있다.
		
    
### 사용자정의 SessionUtils로 HttpSession 객체에 저장된 사용자정보 획득하기(권장X)
```
@GetMapping(“/my/info”)
public String userInfo() {
User user = (User) SessionUtils.getAttribute(“LOGINED_USER”);
}
```
* SessionUtils가 내부적으로 RequestContextHolder를 사용하기 때문에   
위의 코드만 작성하면 Controller, Service, Dao 등 모든 클래스에서 로그인된 사용자 정보를 획득할 수 있다.


```
public class OrderService {
  public List<OrderDto> getMyOrders() {
  User user = (User) SessionUtils.getAttribute(“LOGINED_USER”);
  List<OrderDto> orders = ordersDao.getOrderByUserId(user.getId());
  }
}
```
* SessionUtils가 내부적으로 RequestContextHolder 사용하기 때문에,   
위의 코드만 작성하면 Controller, Service, Dao 등 모든 클래스에서 로그인 된 사용자 정보를 획득할 수 있다.



### 사용자정의 어노테이션과 ArgumentResolver를 이용해서 HttpSession 객체에 저장된 사용자 정보 획득(권장)
```
@GetMapping(“/my/info”)
public String userInfo(@LoginUser User user) {
}
```
* controller의 요청핸들러 메소드에서만 위의 방식으로 로그인 된 사용자정보를 획득할 수 있다.




# 위에 제시된 모든 방법으로 로그인 된 사용자정보를 획득할 수 있지만, 로그인된 사용자정보는 컨트롤러의 요청핸들러 메소드에서 획득하자.




# 사용자 정의 어노테이션과 handlerMethodArguemntsResolver


### 사용자정의 어노테이션 정의하기
```
@Retention(RetentionPolicy, RUNTIME)
@Target(ElementType.PARAMETER)
public @Interface LoginUser {
}
```

### 어노테이션 사용하기
```
@GetMapping(“/my/reviewList”)
public String myReviews(@LoginUser User user) {
}

@GetMapping(“/product/addCart”)
public string addCartItem(@ReuqestParam(“no”) int productNo,
@LoginUser User user){

}
@GetMapping(“/order/add”)
public String addOrder(OrderForm orderForm, @LoginUser User user) {

}
```
* 위와 같이 어노테이션을 사용했을 때 요청핸들러의 매개 변수를 분석해서 로그인된 사용자 정보를 전달하는




# HandlerMethodArgumentResolver 구현하기
```
public boolean supportsParameter(MethodParameter parameter) {
  return Objects.nonNull(parameter.getParameterAnnotation(LoginUser.class));

}

public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
  return SessionUtils.getAttribute("LOGINED_USER");

}
```

### 스프링 빈 설정 파일에 사용자정의 HandlerMethodArgumentResolver를 등록한다.
```
<mvc:annotation-driven>
  <mvc:argument-resolvers>
    <bean class=”com.sa  mple.web.argumentResolver.LoginUserArgumentResolver” />
  </mvc:argument-resolvers>
</mvc:annotation-driven>
```



### 내 장바구니 보기

* 요청방식 : GET
* 요청URL : localhost/spring-mvc/product/cart
* 컨트롤러 : 
```
@Controller
public class ProductController {
  @Autowired ProductService productService;

@GetMapping(“/cart”)
  public String cart(@LoginUser User user, Model model) {
    // 로직

  return “product/cart”;		/WEB-INF/views/product/cart.jsp
  }
}
```

### 데이터베이스 액세스
```
CartItemDao
	List<Map<String, Object>> getCartItemsByUserId(String userId);

carts.xml
	<select id=”getCartItemsByUserId” parameterType=”string” resultType=”hashmap”> </select>
```

### 비즈니스 로직 구현
```
ProductService 인터페이스
  List<Map<String,Object>> getMyCartItems(String userId);

@Service
ProductServiceImpl 구현 클래스
@AutoWired cartItemDao cartItemDao;

public List<Map<String,Object>> getMyCartItems(String userId) {
return cartItemDao.getCartItemByUserId(userId)

} 
```

# 오늘의 정리

1. 로그인 기능을 구현할때 사용자정의 Annotation을 사용하기 위해서는 Annotation 파일과, ArgumentResolver 이용해서 생성할 수 있다.(context-web.xml에 추가도 해야함)
2. DTO의 기능이 필요해서 만들어야 할 때는 List<Map<String,Object>>를 이용해서 Map형식으로도 이용할 수 있다.(상대적으로 무겁다)
3. Controller에서 Logger의 역할은 아주 중요하다..
4. 설정파일을 아무리 외우려고 해도 안되서 많이 보고 따라했다..
5. add/cart에서 장바구니 담기를 눌러 이동할때는 "game/cart"가 아닌,redirect:cart를 사용해야 목록이 표시된다.
