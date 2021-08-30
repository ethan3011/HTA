<%@page import="java.net.URLEncoder"%>
<%@page import="com.sample.dao.ReviewDao"%>
<%@page import="com.sample.vo.Review"%>
<%@page import="com.sample.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	User sessionSavedUser = (User) session.getAttribute("LOGINED_USER_INFO");

	if(sessionSavedUser == null){
		String encodedText = URLEncoder.encode("리뷰등록", "utf-8");
		response.sendRedirect("../user/loginform.jsp?fail=deny&job=" + encodedText);
		return;	}
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
	
	if(title.isBlank() || content.isBlank()){
		response.sendRedirect("detail.jsp?no="+productNo+"&page="+pageNo+"&fail=blank");
		return;
	}
	
	Review review = new Review();
	review.setTitle(title);
	review.setContent(content);
	review.setUserId(sessionSavedUser.getId());
	review.setProductNo(productNo);
	
	ReviewDao reviewDao = ReviewDao.getInstance();
	reviewDao.insertReview(review);
		
	response.sendRedirect("detail.jsp?no="+productNo+"&page="+pageNo);
%>