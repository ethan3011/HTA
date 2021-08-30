package com.sample.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.tomcat.jakartaee.commons.io.IOUtils;

import com.sample.dao.FileItemDao;
import com.sample.vo.FileItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/up")
@MultipartConfig
public class FileUploadServlet extends HttpServlet{
	private static final String savedDirectory = "C:\\test\\upload";

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청 파라미터 조회하기
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		
		//업로드된 첨부파일 처리하기
		Part part = request.getPart("upfile");
		//Part는 업로드된 첨부파일의 정보를 가지고 있는 객체다.
		//1. 업로드된 첨부파일 정보 획득하기
		String fileName = System.currentTimeMillis()+part.getSubmittedFileName();
		
		//2. 업로드된 첨부파일을 지정된 폴더에 복사하기
		//	 * 서버로 업로드된 첨부파일은 서버의 임시디렉토리에 임시파일(xxxxxxxxxx.tmp)의 형태로 저장되어 있음
		// File객체를 생성 : 지정된 디렉토리와 파일명에 대한 정보를 가지는 객체다.
		//				  File객체는 실제로 존재하지 않는 파일에 대해서도 객체 생성이 가능하다.
		OutputStream out = new FileOutputStream(new File(savedDirectory, fileName));
		InputStream in = part.getInputStream();
		IOUtils.copy(in, out);
		IOUtils.close();
		
		FileItem item = new FileItem();
		item.setTitle(title);
		item.setDescription(description);
		item.setFileName(fileName);
		
		//3. 업로드된 파일정보(제목, 설명, 파일명)을 데이터베이스에 저장하기
		FileItemDao fileItemDao = FileItemDao.getInstance();
		fileItemDao.insertFileItem(item);
		
		//클라이언트에게 index.jsp를 재요청하게하는 응답을 보내기
		response.sendRedirect("/sam/index.jsp");

	}

}
