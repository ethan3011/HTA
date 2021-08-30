package com.sample.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sample.vo.Score;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/core")
public class CoreTagSampleServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// <c:out />태그 연습 >
		String text1 = "택배 배송이 너무 지연됩니다 확인 부탁드려요";
		String text2 = "<script>function a() { alert('해피해킹');}</script><button onclick='a()'>클릭</button>";
		request.setAttribute("text1", text1);
		request.setAttribute("text2", text2);
		
		// <c:if text="${조건식}">컨텐츠</if>태그 연습
		// <c:choose />, ,<c:whe />, <c:otherwise /> 태그 연습 
		request.setAttribute("score", 85);
		ArrayList<String> names = new ArrayList<String>();
		names.add("홍길동");
		names.add("김유신");
		request.setAttribute("names", names);
		
		Map<String, Integer> condition = new HashMap<String, Integer>();
		condition.put("year", 3);				// 자동차 사용기간 3년
		condition.put("distance", 100000);		// 운행거리 10만 km
		request.setAttribute("car", condition);
		
		// <c:forEach var="변수명" items"${}">HTML 컨텐츠</c:forEach> 태그연습
		List<String> members = new ArrayList<String>();
		members.add("김유신");
		members.add("강감찬");
		members.add("홍길동");
		members.add("이순신");
		members.add("류관순");
		request.setAttribute("members", members);
		
		List<Score> scoreList = new ArrayList<Score>();
		scoreList.add(new Score("홍", "길동", 70, 70, 60));
		scoreList.add(new Score("김", "유신", 70, 90, 70));
		scoreList.add(new Score("강", "감찬", 90, 30, 80));
		scoreList.add(new Score("이", "순신", 70, 50, 20));
		scoreList.add(new Score("윤", "봉길", 50, 70, 70));
		scoreList.add(new Score("류", "관순", 30, 50, 70));
		request.setAttribute("scores", scoreList);

		// <c:set />태그 연습
		request.setAttribute("king", new Score("세종", "대왕", 100, 100,100));
		// core.jsp 내부이동 시키기
		request.getRequestDispatcher("/jstl/core.jsp").forward(request, response);
		
	}

}
