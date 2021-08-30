# 인터셉터

1. 요청핸들러 메소드 실행전/실행후 처리를 수행할 수 있다.
2. 클라이언트의 요청을 처리하는 데 소요되는 총 시간을 계산할 수 있다.
3. 클라이언트가 어떤 요청핸들러 메소드에 대한 정보를 로깅할 수 있다.
4. preHandle()이 true를 반환하면 요청핸들러 메소드가
실행되고, false를 반환하면 요청핸들러 메소드가 실행되지 않는다.
5. 로그인 하지 않은 사용자가 로그인이 필요한 요청핸들러 메소드를 실행요청 하는 것을 막을 수 있다.
6. 관리자 권한이 없는 사용자가 관리자 권한이 필요한 요청핸들러 메소드를 실행요청하는 것을 막을 수 있다.
7. 컨트롤러의 요청핸들러 메소드 실행전/후에 수행되는 작업을 구현할 수 있다.
8. HandlerInterceptor 인터페이스를 구현해서 작성한다.

### HandlerInterceptor의 주요 메소드
* boolean preHandle(request, response, handler)
  * 컨트롤러의 요청 핸들러 메소드 실행 전 수행할 작업을 구현할 수 있다.
  * 인터셉터의 메소드중 가장 많이 구현되는 메소드다.
  * 이 메소드가 true를 반환하면 요청 핸들러 메소드가 실행되고, false를 반환하면 요청 핸들러 메소드가 실행되지 않는다.
  * 접근제한, 권한제어 등의 작업을 이 메소드로 구현할 수 있다.

* void postHandle(request, response, modelAndView)
  * 컨트롤러의 요청핸들러 메소드 실행 후 수행할 작업을 구현할 수 있다.
  * 요청핸들러 메소드가 응답으로 제공하는 값을 조회/조작 할 수 있다.

* afterCompletion(request, response, handler, ex)
  * 클라이언트에게 응답이 완료된 후에 수행할 작업을 구현할 수 있다.
  * 대부분의 인터셉터에서 사용되지 않는 기능이다.
<br/>
<br/>
<br/>

## EBNF 표기법

* A		A를 무조건 한번 사용해야 한다.
* A+		A를 무조건 한번이상 사용해야 한다.
* A?		A를 사용하지 않아도 되고, 사용한다면 한 번만 사용해야 한다.
* A*		A를 사용하지 않아도 되고, 여러 번 사용할수도 있다.
* A,B		A 다음에 B를 사용해야 한다.
* A|B		A와 B 둘중에 하나를 사용해야 한다.
* ex)
  * ((bean|ref) | interceptor)+
	  * ()안의 내용을 1번 이상 사용해야 한다.
	* (bean|ref)와 interceptor 중에서 하나를 사용해야 한다.
	  * bean 혹은 ref를 사용할 때는 둘 중 하나를 사용해야 한다.
  * (mapping+, exclude-mapping*, (bean | ref))
	  * mapping, exclude-mapping, (bean|ref) 순서로 사용해야 한다.
	  * mapping는 1번 이상 사용해야 한다.
	  * exclude-mapping*은 사용하지 않아도 되고, 여러번 사용해도 된다.
	  * bean과 ref 중에서 하나를 무조건 한번 사용해야 한다.

<br/>
<br/>
<br/>

# 스프링의 예외처리

* @ExceptionHandler를 이용해서 예외를 처리한다.
  * 작성예
```
@ExceptionHandler(예외클래스명.class)
public String handle예외클래스명(예외클래스 ex) {
  return "에러페이지"
}
```

### 위와 같이 예외처리를 한 경우 JSP에서 에러정보 표시하기
* <%@ page isErrorPage=”true” %> 페이지 지시어에서 isErrorPage속성을 True로 설정한다.
* <%=exception.getMessage() %> 표현식으로 에러 메시지를 화면에 표시할 수 있다.
```
@ExceptionHandler(예외클래스명.class)
public String handle예외클래스명(예외클래스 ex, Model model) {
  model.addAttribute("error", 에러정보);
  return "에러페이지"
}
```

### 이 예외처리를 한 경우 JSP에서 에러정보 표시하기
* error.message} 로 에러 메시지를 화면에 표시할 수 있다.

* 예외처리의 구분
  * Controller에서 예외처리
  * 해당 컨트롤러에 특화된 예외처리
  * 작성예
```
@Controller
  public class HomeController {
  @ExceptionHandler(예외클래스명.class)
    public String handle예외클래스명(예외클래스 ex, Model model) {
    model.addAttribute("error", 에러정보);
    return "에러페이지"
    }
  }
 ```
 
* ControllerAdvice에서 예외처리
  * 글로벌 예외처리
  * 모든 컨트롤러에 공통적으로 적용되는 예외처리(404, 405, etc..)
  * 작성예
```
@ControllerAdvice
public class ExceptionHandlerAdvice {

@ExceptionHandler(예외클래스명.class)
  public String handle예외클래스명(예외클래스 ex, Model model) {
  model.addAttribute("error", 에러정보);
  return "에러페이지"
  }
}
```


### web.xml에서 에러페이지 설정하기
* 예외클래스로 에러페이지 설정하기
```
<error-page>
<exception-type>패키지를포함한 예외클래스명</exception-type>
<location>/WEB-INF/views/error/xxx.jsp</location>
</error-page>
```

* HTTP 에러코드로 에러페이지 설정하기
```
<error-page>
<error-code>404</error-code>
<location>/WEB-INF/views/error/filenotfound.jsp</location>
</error-page>
```
