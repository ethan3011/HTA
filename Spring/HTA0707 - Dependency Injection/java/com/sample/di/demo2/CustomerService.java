package com.sample.di.demo2;


public class CustomerService {
	
	
	public void getMyInfo() {
		// 고객의 상세정보 조회 		CustomerDao의 getCustomerById()
		System.out.println("고객님의 상세정보를 조회합니다.");
	}
	
	public void getMyOrderList() {
		// 고객의 주문내역 조회		OrderDao의 getOrderListByUserId()
		System.out.println("고객님의 주문내역을 조회합니다.");
	}
}
