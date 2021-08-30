package com.sample.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.crypto.Data;

import com.sample.vo.Score;import com.sample.vo.Chicken;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/core2")
public class Core2 extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			String text1 = "텍스트 텍스트~";
			String text2 = "<script>function a() { alert('텍스트텍스트~');}</script><button onclick='a()'>클릭</button>";
			String text3 = "<script>function a() { alert('해피해킹');}</script><button onclick='a()'>클릭</button>";
			request.setAttribute("text1" , text1);
			request.setAttribute("text2" , text2);
			request.setAttribute("text3" , text3);
			
			request.setAttribute("score", 95);
			
			Map<String, Integer>car = new HashMap<String, Integer>();
			car.put("km", 100000);
			car.put("years", 3);
			request.setAttribute("car", car);
			
			List<Score> scores = new ArrayList<Score>();
			scores.add(new Score("김", "치맨", 100, 70, 80));
			request.setAttribute("scores", scores);
			
			List<Chicken> chickens = new ArrayList<Chicken>();
			chickens.add(new Chicken("후라이드", 15000, new Date() , "호식이두마리", 2500, 9));
			chickens.add(new Chicken("양념치킨", 16000, new Date() , "노랑치킨", 3000, 5));
			chickens.add(new Chicken("매운치킨", 17000, new Date() , "푸라닭치킨", 2000, 6));
			chickens.add(new Chicken("간장치킨", 18000, new Date() , "딲좋아치킨", 2300, 7));
			chickens.add(new Chicken("치즈치킨", 19000, new Date() , "끄러찌치킨", 2100, 8));
			
			
			request.setAttribute("mang", (new Chicken("마사랍치킨", 8500, new Date(), "망이나살", 1500, 150)));
			
			
			request.setAttribute("chickens", chickens);
			request.getRequestDispatcher("/jstl/core2.jsp").forward(request, response);
		
	}
}
