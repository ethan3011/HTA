package com.sample.web.controller;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.dao.CartItemDao;
import com.sample.service.GameService;
import com.sample.vo.CartItem;
import com.sample.vo.Game;
import com.sample.vo.User;
import com.sample.web.annotation.LoginUser;
import com.sample.web.utils.SessionUtils;

@Controller
@RequestMapping("/game")
public class GameController {
	
	Logger logger = LogManager.getLogger(GameController.class);
	
	@Autowired
	private GameService gameService;
	
	
	@GetMapping("/list")
	public String gameList(Model model) {
		
		List<Game> games = gameService.getAllGames();
		
		model.addAttribute("games", games);
		
		return "game/list";
	}
	
	@GetMapping("detail")
	public String detail(@RequestParam("no") int gameNo, Model model) {
		logger.info("no의 값 : " + gameNo);
		Game game = gameService.getGameByNo(gameNo);
		logger.info(game);
		model.addAttribute("game", game);
		
		return "game/detail";
	}
	
	@GetMapping("addCart")
	public String addCart(@RequestParam("no") int productNo) {
		
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		logger.info("조회된 유저 : " + user);
		logger.info("상품번호 : " + productNo);
		if(user == null) {
			throw new RuntimeException("장바구니 담기는 로그인 후 사용가능한 서비스 입니다.");
		}
		
		
		CartItem cartItem = new CartItem();
		cartItem.setId(user.getId());
		cartItem.setProductNo(productNo);
		
		gameService.addCartItem(cartItem);
		
		return "cart/list";
	}
	
	@GetMapping("/cart")
	public String cart(@LoginUser User user, Model model) {
		logger.info("로그인된 사용자 정보  :" + user);
		if(user == null) {
			throw new RuntimeException("장바구니 담기는 로그인 후 사용가능한 서비스 입니다.");
		}
		List<Map<String, Object>> items = gameService.getCartItemById(user.getId());
		logger.info("조회된 아이템 정보들 : " + items);
		model.addAttribute("items", items);
		
		return "game/cart";
	}

}
