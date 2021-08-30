<%@page import="java.net.URLEncoder"%>
<%@page import="com.sample.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.vo.Review"%>
<%@page import="com.sample.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

User savedSessionUser = (User)session.getAttribute("LOGINED_USER_INFO");

	if(savedSessionUser == null) {
		String encodedText = URLEncoder.encode("리뷰 삭제","utf-8");
		response.sendRedirect("../user/loginform.jsp?fail=deny&job=" + encodedText);
		return;
	}
	

	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	int pageNo = Integer.parseInt(request.getParameter("pageNo"));
	int productNo = Integer.parseInt(request.getParameter("productNo"));

	
	ReviewDao reviewDao = ReviewDao.getInstance();
	
	reviewDao.deleteReview(reviewNo);
	
	response.sendRedirect("detail.jsp?no="+productNo+"&page="+pageNo);

%>