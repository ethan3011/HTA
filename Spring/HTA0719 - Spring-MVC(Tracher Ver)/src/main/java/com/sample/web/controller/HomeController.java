package com.sample.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/*
 * @Controller
 * 		- 클라이언트의 요청을 처리하는 컨트롤러 클래스임을 나타낸다.
 * 		- <context:component-scan />태그를 xml에 설정했을 때 자동으로 스프링 컨테이너의 빈으로 등록된다.
 */
@Controller
public class HomeController {
	/*
	 * @RequestMapping, @GetMapping, @PostMapping, @PutMapping, @DeleteMapping
	 * 		- 요청 URL와 요청핸들러 메소드를 매핑시킨다.
	 * 		- 요청URL은 "/"로 시작한다. 절대경로나 상대경로는 상관없다.
	 * 		- @RequestMapping은 메소드, 클래스 두 곳에 사용할 수 있고 나머지는 메소드에만 사용할 수 있다.
	 * 		- 다양한 속성값을 가질 수 있다.
	 * 			* path
	 * 					요청핸들러 메소드와 매핑되는 요청URL을 지정할 떄 사용된다.
	 * 					2개 이상의 요청URL과 매핑되는 경우 배열형식으로 요청URL을 정의한다.
	 * 					작성예
	 * 						@RequestMapping("/home")
	 * 						@RequestMapping(value = "/home")
	 * 						@RequestMapping(path = "/home")
	 * 						@RequestMapping(value = {"/home"})
	 * 						@RequestMapping(path = {"/home"})
	 * 						@RequestMapping(value = {"/", "/home", "/main"})
	 * 						@RequestMapping(path = {"/", "/home", "/main"})
	 * 						
	 */
	
	/*
	 * Model
	 * 		- 뷰객체 혹은 뷰페이지(JSP)에 값을 전달할 때 사용하는 객체다.
	 * 		- 요청핸들러 메소드의 매개변수로 Model객체를 정의하면 handlerAdapter가
	 * 		    요청핸들러 호출할 때 Model객체를 전달한다.
	 * 		- 요청핸들러 메소드에서 Model객체에 값 혹은 객체를 저장하면 HttpServlet객체의
	 * 		    속성으로 옮겨진다.
	 */
	@GetMapping(path = {"/home"})
	public String home(Model model) {
		
		// 뷰 페이지에 값 전달하기
		model.addAttribute("greeting", "안녕하세요, 반갑습니다.");
		
		return "home";		//	/WEB-INF/views/home.jsp 경로에서 "/WEB-INF/views"와 ".jsp"를 제외한 이름
	}
	/*
	 * 요청핸들러 메소드의 반환값
	 * 		-String
	 * 			* 내부이동할 JSP페이지의 이름을 반환한다.
	 * 				내부이동할 JSP 페이지의 이름은 /WEB-INF/views/ 폴더에 있는 JSP 파일의 파일명이다.
	 * 				내부이동할 JSP페이지가 /WEB-INF/views/home.jsp인 경우는 "home"다.
	 * 				내부이동할 JSp페이지가 /WEB-INF/views/board/list.jsp인 경우는 "board/list" 다.
	 * 				내부이동하는 경로를 적을 때는 "/"로 시작할 필요가 없음
	 * 				InternalResourceView, JstlView가해당 경로의 JSP로 내부이동시킨다.
	 * 			* 클라이언트가 재요청할 URL을 반환한다.
	 * 				재요청할 URL은 "redirect:"로 시작한다.
	 * 				"redriect:list"와 "redirect:/list"는 서로 다른 경로다.
	 * 				"redirect:list"는 상대주쇼표기법으로 작성된 경로다.
	 * 				"redirect:/list"는 절대주소표기법으로 작성된 경로다.
	 * 				RedriectView가 해당 URL을 재요청URl로 클라이언트에게 응답으로 보낸다.
	 * 				작성예)
	 * 					@controller
	 * 					@RequestMapping("/board")
	 * 					public class boardController {
	 * 						
	 * 						@GetMapping("/list")
	 * 						public String boardList() {
	 * 							...
	 * 							return "board/list";		// 실제 JSP 경로는 /WEB-INF/views/board/list.jsp 다.
	 * 						}
	 * 					}
	 * 
	 *		- VO객체, List객체, Map객체
 	 *			* JSP 페이지로 이동하는 것이 아니다.
 	 *			* 요청 핸들러 메소드가 반환하는 값이 직접 응답으로 클라이언트에게 전달된다.
 	 *			* 주로 JSON, XML 형태로 반환되어서 전달된다.
 	 *			* 대부분의 경우, 컨트롤러 클래스에 @Controller 대신 @restController가 지정되어 있다.
 	 *			작성예)
 	 *				@RestController
 	 *				@RequestMapping("/board")
 	 *				public class BoardController {
 	 *					@GetMapping("/detail")
 	 *					public Board getBoardDetail() { ... }
 	 *
 	 *					@GetMapping("/list")
 	 *					public List<Board> getBoardList() { ... }
 	 *				} 
	 */
}

