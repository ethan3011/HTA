package com.sample.app;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.service.GameService;
import com.sample.service.UserService;
import com.sample.vo.Game;
import com.sample.vo.User;

public class SpringApp {

	public static void main(String[] args) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/context-mybatis.xml");
		
		GameService service = context.getBean(GameService.class);
		UserService userService = context.getBean(UserService.class);
		
		
		
/*		# 신규게임 추가 

		Game game = new Game();
		game.setName("No Mans' Sky");
		game.setDescribe("《노 맨즈 스카이》는 인디 스튜디오 헬로 게임스가 개발하고 배급한 탐험 서바이벌 게임이다. 2016년 8월 플레이스테이션 4, 마이크로소프트 윈도우용으로 전 세계에 출시되었으며 엑스박스 원용의 경우 2018년 7월 출시되었다.");
		game.setPrice(7000);
		game.setDiscountPrice(5000);
		game.setStock(150);
		game.setBrand("Hello Games");
		
		service.insertNewGame(game);
		System.out.println("게임이 등록되었습니다.");
		
 */
		

/*
		# 모든 게임내역 조회
		List<Game> games = service.getAllGames();
		
		for(Game game : games) {
			System.out.println("게임번호 : " + game.getNo());
			System.out.println("게임명 : " + game.getName());
			System.out.println("게임제조사 : " + game.getBrand());
			System.out.println("게임설명 : " + game.getDescribe());
			System.out.println("게임가격 : " + game.getPrice());
			System.out.println("게임할인가격 : " + game.getDiscountPrice());
			System.out.println("게임재고 : " + game.getStock());
			System.out.println("게임추가일 : " + game.getCreatedDate());
		}
*/
		
/*
		# 게임번호로 게임 검색
		Game foundGame = service.getGameByGameNo(1);
		
		System.out.println("게임번호 : " + foundGame.getNo());
		System.out.println("게임명 : " + foundGame.getName());
		System.out.println("게임제조사 : " + foundGame.getBrand());
		System.out.println("게임설명 : " + foundGame.getDescribe());
		System.out.println("게임가격 : " + foundGame.getPrice());
		System.out.println("게임할인가격 : " + foundGame.getDiscountPrice());
		System.out.println("게임재고 : " + foundGame.getStock());
		System.out.println("게임추가일 : " + foundGame.getCreatedDate());
*/
/*
		# 게임번호로 게임삭제
		service.deleteGameByGameNo(2);
*/	
/*
		# 게임 정보 변경
		Game foundGame = service.getGameByGameNo(3);
		
		foundGame.setDiscountPrice(40000);
		foundGame.setPrice(60000);
		
		service.updateGame(foundGame);
 */
/*
		# 신규 유저 가입
		User user = new User();
		user.setId("TESTUSER1");
		user.setName("테스트1");
		user.setPassword("zxcv1234");
		user.setPhone("+821011111111");
		user.setEmail("TESTUSER1@gmail.com");
		userService.AddNewUser(user);
		System.out.println("성공적으로 가입이 완료되었습니다.");
*/
		
	}
}
