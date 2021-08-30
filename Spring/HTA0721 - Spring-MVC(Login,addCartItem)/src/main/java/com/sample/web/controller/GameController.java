package com.sample.web.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.service.GameService;
import com.sample.vo.CartItem;
import com.sample.vo.Game;
import com.sample.vo.User;
import com.sample.web.utils.SessionUtils;

@Controller
@RequestMapping("/game")
public class GameController {
	
	@Autowired
	private GameService gameService;
	
	private static Logger logger = LogManager.getLogger(GameController.class);
	
	@GetMapping("/list")
	public String getAllGames(Model model){
		logger.debug("getAllGames() 실행됨");
		List<Game> games = gameService.getAllGames();
		
		model.addAttribute("games", games);
		
		logger.debug("getAllGames()종료됨");
		return "game/list";
	}
	
	@GetMapping("/detail")
	public String detail(@Param("no") int no, Model model) {
		Game game = gameService.getGameByNo(no);
		
		model.addAttribute("Game", game);
		
		return "game/detail";
	}
	
	@GetMapping("/addCart")
	public String addCartItem(@RequestParam("no") int no) {
		logger.debug("addCartItem() 시작됨");
		logger.info("장바구니에 저장된 상품번호 : " + no);
		
		User user = (User)SessionUtils.getAttributes("LOGINED_USER");
		logger.info("로그인된 사용자 정보 :" + user);
		if(user == null) {
			throw new RuntimeException("장바구니 담기는 로그인 후 이용할 수 있습니다.");
		}
		
		CartItem cartItem = new CartItem();
		cartItem.setId(user.getId());
		cartItem.setProductNo(no);
		
		gameService.addCartItem(cartItem);
		logger.debug("addCartItem() 종료됨");
		
		return "redirect:listCart";
	}
}
