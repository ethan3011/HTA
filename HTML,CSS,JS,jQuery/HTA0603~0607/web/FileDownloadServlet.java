package com.sample.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import org.apache.commons.io.IOUtils;

import com.sample.dao.FileItemDao;
import com.sample.vo.FileItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/download")
public class FileDownloadServlet extends HttpServlet {
	
	private static final String saveDirectory = "C:\\workspace\\Java-Web\\upload";
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청파라미터값 조회
		// http://localhost/download?no=파일번호
		int fileNo = Integer.parseInt(request.getParameter("no"));
		
		// 데이터베이스에서 파일정보 조회
		FileItemDao fileItemDao = FileItemDao.getInstance();
		FileItem fileItem = fileItemDao.getFileItem(fileNo);
		String filename = fileItem.getFilename();
		
		// 획득된 파일이름에 해당하는 파일을 읽어서 클라이언트에게 응답으로 출력하기
		// 파일 ---> InputStream ---> OutputStream ---> 브라우져
		// 파일 다운로드 하기
		
		// 1. 응답컨텐츠 타입과 파일이름 설정하기
		// "application/octet-stream" 은 임의의 바이너리 데이터에 대한 컨텐츠 타입이다.
		response.setContentType("application/octet-stream");
		// 다운로드되는 파일의 이름을 응답메세지의 헤더에 설정한다.
		String shortFilename = fileItem.getShortFilname();
		shortFilename = URLEncoder.encode(shortFilename, "utf-8");
		response.setHeader("Content-Disposition", "attachment; filename=" + shortFilename);
		
		// 2. 파일을 읽어서 브라우저와 연결된 출력스트림으로 내려보내기
		// 저장된 파일을 읽어오는 스트림 생성
		InputStream in = new FileInputStream(new File(saveDirectory, filename));
		// 브라우져와 연결된 출력 스트림 획득
		OutputStream out = response.getOutputStream();
		IOUtils.copy(in, out);
		IOUtils.close();
		out.close();
	}

}




