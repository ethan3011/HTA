package com.sample.di.demo2;

import com.sample.di.demo1.BookDao;
import com.sample.di.demo1.CustomerDao;
import com.sample.di.demo1.OrderDao;

public class OrderService {
	private OrderDao orderDao;
	private BookDao bookDao;
	private CustomerDao customerDao;
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	
	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	// 주문하기
	public void order() {
		// 새로운 주문정보 저장		<-- OrderDao.inserOrder()
		// 상품의 재고변경			<-- BookDao.updateBook()
		// 고객의 포인트 변경			<-- CustomerDao updateCustomer()
		System.out.println("책 주문요청을 처리합니다.");
		orderDao.insertOrder();
		bookDao.updateBook();
		customerDao.updateCustomer();
	}
	
	// 주문취소하기
	public void cancel() {
		// 주문정보 취소			<-- OrderDao cancelOrder()
		// 상품의 재고 변경			<-- BookDao.updateBook();
		// 고객의 포인트 변경			<-- CustomerDao updateCustomer();
		System.out.println("책 주문내용에 대한 취소요청을 처리합니다.");
		orderDao.cancelOrder();
		bookDao.updateBook();
		customerDao.updateCustomer();
	}
}
