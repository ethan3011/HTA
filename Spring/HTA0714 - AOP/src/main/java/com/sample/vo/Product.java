package com.sample.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
@Setter
public class Product {
	
	private int no;
	private String name;
	private String maker;
	private String category;
	private int price;
	private int discountPrice;
	private int stock;
	private String soldOut;
	private Date createdDate;
	private String reviewCnt;
	
	@Builder
	public Product(String name, String maker, String category, int price, int discountPrice, int stock) {
		super();
		this.name = name;
		this.maker = maker;
		this.category = category;
		this.price = price;
		this.discountPrice = discountPrice;
		this.stock = stock;
	}
}
