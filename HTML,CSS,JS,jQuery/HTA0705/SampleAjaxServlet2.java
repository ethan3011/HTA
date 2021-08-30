package com.sample.HTA0705;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ajax2")
public class SampleAjaxServlet2 extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		List<Book> books = List.of(
					new Book(100, "미드나잇 라이브러리", "메그 헤이그", "인풀루엔설", 10000),
					new Book(200, "조국의 시간", "조국", "한길사", 20000),
					new Book(300, "김치", "김치왕", "김치사전", 30000),
					new Book(400, "피자", "피자왕", "피자사전", 40000),
					new Book(500, "치킨", "치킨왕", "치킨사전", 50000),
					new Book(600, "족발", "족발왕", "족발사전", 60000),
					new Book(700, "메밀국수", "메밀국수왕", "메밀국수사전", 70000)
				);
		
		
		// 요청파라미터값 획득하기 <-- 모든 책정보를 읍답으로 보내기 때문에 파라미터값 없음
		// 데이터를 json형식으로 변환하기
		
		Gson gson = new Gson();
		String jsonText = gson.toJson(books);
		
		// json 형식의 텍스트를 응답으로 내려보내기
		res.setContentType("application/json; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.write(jsonText);
		out.flush();
		out.close();
		
	}
		
		public class Book {
				int no;
				String title;
				String writer;
				String publisher;
				int price;
			
		public Book(int no, String title, String writer, String publisher, int price){
			this.no = no;
			this.title = title;
			this.writer = writer;
			this.publisher = publisher;
			this.price = price;
			}

		public int getNo() {
			return no;
		}

		public void setNo(int no) {
			this.no = no;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getWriter() {
			return writer;
		}

		public void setWriter(String writer) {
			this.writer = writer;
		}

		public String getPublisher() {
			return publisher;
		}

		public void setPublisher(String publisher) {
			this.publisher = publisher;
		}

		public int getPrice() {
			return price;
		}

		public void setPrice(int price) {
			this.price = price;
		}
		}
		
}
